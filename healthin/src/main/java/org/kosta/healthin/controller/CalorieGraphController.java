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
		System.out.println(id + " " + startDate + " " + endDate);
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
		for (int i=0; i<tmpConsumption.size(); i++) {
			if (tmpConsumption.get(i) >= startDate && tmpConsumption.get(i) <= endDate) {
				StringBuilder tmpString = new StringBuilder();
				tmpString.append(tmpConsumption.get(i) + "");	// String 형으로 바꾸기 위함
				tmpString.insert(4, "-"); 
				tmpString.insert(7, "-");
				consumptionPeriod.add(tmpString.toString());
			}
		}
		for (int i=0; i<tmpIntake.size(); i++) {
			if (tmpIntake.get(i) >= startDate && tmpIntake.get(i) <= endDate) {
				StringBuilder tmpString = new StringBuilder();
				tmpString.append(tmpIntake.get(i) + "");	// String 형으로 바꾸기 위함
				tmpString.insert(4, "-"); 
				tmpString.insert(7, "-");
				intakePeriod.add(tmpString.toString());
			}
		}
		int conLength = consumptionPeriod.size();
		int inLength = intakePeriod.size();
		int cnt = 0;
		if (conLength > inLength)
			cnt = conLength;
		else
			cnt = inLength;
		ArrayList<CalorieInfoVO> calorieInfoList = new ArrayList<CalorieInfoVO>();
		for (int i=0; i<cnt; i++) {
			if (i >= consumptionPeriod.size())
				break;
			HashMap<String, String> tmpConsumptionCalorieMap = new HashMap<String, String>();
			tmpConsumptionCalorieMap.put("date", consumptionPeriod.get(i));
			tmpConsumptionCalorieMap.put("id", id);
			int totalConsumptionCalorie = calorieGraphService.getTotalConsumptionCalorieOfDay(tmpConsumptionCalorieMap);
			CalorieInfoVO calorieInfo = new CalorieInfoVO(consumptionPeriod.get(i), totalConsumptionCalorie, true);
			calorieInfoList.add(calorieInfo);
		}
		for (int i=0; i<cnt; i++) {
			if (i >= intakePeriod.size())
				break;
			HashMap<String, String> tmpIntakeCalorieMap = new HashMap<String, String>();
			tmpIntakeCalorieMap.put("date", intakePeriod.get(i));
			tmpIntakeCalorieMap.put("id", id);
			int totalIntakeCalorie = calorieGraphService.getTotalIntakeCalorieOfDay(tmpIntakeCalorieMap);
			for (int j=0; j<calorieInfoList.size();) {
				if (calorieInfoList.get(i).getDate().equals(intakePeriod.get(i)))	 {	// 같은 날짜가 있는 경우
					calorieInfoList.get(i).setTotalIntakeCalorie(totalIntakeCalorie);
					break;
				} else {	// 같은 날짜가 없는 경우
					CalorieInfoVO calorieInfo = new CalorieInfoVO(intakePeriod.get(i), totalIntakeCalorie, false);
					calorieInfoList.add(calorieInfo);
					break;
				}
			}
		}
		System.out.println(calorieInfoList);
		return calorieInfoList;
	}
}