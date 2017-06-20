package org.kosta.healthin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.healthin.model.service.CalorieGraphService;
import org.kosta.healthin.model.vo.CalorieInfoVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CalorieGraphController {
	@Resource
	private CalorieGraphService calorieGraphService;
	
	@RequestMapping("userHealthCheck.do")
	public String updateExercise(Model model, HttpServletRequest request) {
		return "mypage/user_health_check.tiles";
	}
	
	@RequestMapping("ajaxGraphData.do")
	@ResponseBody
	public ArrayList<CalorieInfoVO> initGraphData(HttpServletRequest request) {
		int startDate = Integer.parseInt(request.getParameter("startDate").replaceAll("-", ""));
		int endDate = Integer.parseInt(request.getParameter("endDate").replaceAll("-", ""));
		String id = request.getParameter("id");
		List<String> consumptionDateList = calorieGraphService.getAllDateConsumptionCalorie(id);
		List<String> intakeDateList = calorieGraphService.getAllDateIntakeCalorie(id);
		ArrayList<Integer> tmpConsumption = new ArrayList<Integer>();	// 기간별 데이터를 조회하기 위함
		ArrayList<Integer> tmpIntake = new ArrayList<Integer>();			// 기간별 데이터를 조회하기 위함
		ArrayList<String> consumptionPeriod = new ArrayList<String>();
		ArrayList<String> intakePeriod = new ArrayList<String>();
		
		for (int i=0; i<consumptionDateList.size(); i++) {
			tmpConsumption.add(Integer.parseInt(consumptionDateList.get(i).replaceAll("-", "")));
		}
		for (int i=0; i<intakeDateList.size(); i++) {
			tmpIntake.add(Integer.parseInt(intakeDateList.get(i).replaceAll("-", "")));
		}
		System.out.println("정렬전 consumptionDateList" + consumptionDateList);
		consumptionDateList.sort(null);
		System.out.println("정렬후consumptionDateList" + consumptionDateList);
//		calorieDate.clear();
		for (int i=0; i<tmpConsumption.size(); i++) {
			if (tmpConsumption.get(i) >= startDate && tmpConsumption.get(i) <= endDate) {
				StringBuilder tmpString = new StringBuilder();
				tmpString.append(tmpConsumption.get(i) + "");	// String 형으로 바꾸기 위함
				tmpString.insert(4, "-"); 
				tmpString.insert(7, "-");
				consumptionPeriod.add(tmpString.toString());
			}
		}
		intakeDateList.sort(null);
		for (int i=0; i<tmpIntake.size(); i++) {
			if (tmpIntake.get(i) >= startDate && tmpIntake.get(i) <= endDate) {
				StringBuilder tmpString = new StringBuilder();
				tmpString.append(tmpIntake.get(i) + "");	// String 형으로 바꾸기 위함
				tmpString.insert(4, "-"); 
				tmpString.insert(7, "-");
				intakePeriod.add(tmpString.toString());
			}
		}
		System.out.println("consumptionPeriod : " + consumptionPeriod);
		System.out.println("intakePeriod : " + consumptionPeriod);
		
		ArrayList<CalorieInfoVO> calorieInfoList = new ArrayList<CalorieInfoVO>();
		ArrayList<String> calorieDate = new ArrayList<String>();
		ArrayList<Integer> tmpCalorieDate = new ArrayList<Integer>();
		// 날짜 받아오는 과정
		for (int i=0; i<consumptionPeriod.size(); i++) {
			calorieDate.add(consumptionPeriod.get(i));
		}
		for (int i=0; i<intakePeriod.size(); i++) {
			if (calorieDate.contains(intakePeriod.get(i))) {
				System.out.println("같은거 있음 -- " + intakePeriod.get(i));
			} else {
				calorieDate.add(intakePeriod.get(i));
			}
		}
		System.out.println(calorieDate);
		
		// 정렬을 위해 잠시 한글로 변환
		for (int i=0; i<calorieDate.size(); i++) {
			tmpCalorieDate.add(Integer.parseInt(calorieDate.get(i).replaceAll("-", "")));
		}
		
		// 오름차순정렬
		tmpCalorieDate.sort(null);
		System.out.println(tmpCalorieDate);
		
		// 정렬 후 스트링으로 변환
		calorieDate.clear();
		for (int i=0; i<tmpCalorieDate.size(); i++) {
			StringBuilder tmpString = new StringBuilder();
			tmpString.append(tmpCalorieDate.get(i) + "");	// String 형으로 바꾸기 위함
			tmpString.insert(4, "-"); 
			tmpString.insert(7, "-");
			calorieDate.add(tmpString.toString());
		}
		System.out.println(calorieDate);
		
		for (int i=0; i<calorieDate.size(); i++) {
			HashMap<String, String> tmpConsumptionCalorieMap = new HashMap<String, String>();
			tmpConsumptionCalorieMap.put("date", calorieDate.get(i));
			tmpConsumptionCalorieMap.put("id", id);
			
			int totalConsumptionCalorie = calorieGraphService.getTotalConsumptionCalorieOfDay(tmpConsumptionCalorieMap);
			CalorieInfoVO calorieInfo = new CalorieInfoVO(calorieDate.get(i), totalConsumptionCalorie, true);
			calorieInfoList.add(calorieInfo);
			HashMap<String, String> tmpIntakeCalorieMap = new HashMap<String, String>();
			tmpIntakeCalorieMap.put("date", calorieDate.get(i));
			tmpIntakeCalorieMap.put("id", id);
			int totalIntakeCalorie = calorieGraphService.getTotalIntakeCalorieOfDay(tmpIntakeCalorieMap);
			calorieInfoList.get(i).setTotalIntakeCalorie(totalIntakeCalorie);
		}
		System.out.println(calorieInfoList);
		return calorieInfoList;
	}
}