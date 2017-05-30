package org.kosta.healthin.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.healthin.model.service.TipService;
import org.kosta.healthin.model.service.TrainerService;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.VO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BoardController {
	
	@Resource
	private TipService tipService;
	@Resource
	private TrainerService trainerService;	
	
	@RequestMapping("tip/tip.do")
	public String getTipBoardList(Model model,String nowpage){
		if(nowpage==null)
			nowpage="1";
		ListVO list=tipService.getTipBoardList(nowpage);
		model.addAttribute("list",list );
		return "tip/tip.tiles";
	}
	@RequestMapping("tipcategory.do")
	@ResponseBody
	public Object tipBoardCategoryList(String category,String nowpage){
		if(nowpage==null)
			nowpage="1";
		System.out.println(tipService.tipBoardCategoryList(category, nowpage));
		return tipService.tipBoardCategoryList(category, nowpage);
	}
	@RequestMapping("tip/tip_content.do")
	public String gettipBoardContent(String no,Model model){
		model.addAttribute("tip", tipService.getTipBoardDetailContent(no));
		return "tip/tip_content.tiles";
	}

	
	@RequestMapping("trainer/trainerList.do")
	public String gettrainerList(Model model,String pageNo){
		if(pageNo==null)
			pageNo="1";
		List<VO> list=trainerService.getTrainerList(pageNo);
		System.out.println("trainer Controller : "+list);
		model.addAttribute("list",list);
		return "trainer/trainerList.tiles";
		
		
	}
}
