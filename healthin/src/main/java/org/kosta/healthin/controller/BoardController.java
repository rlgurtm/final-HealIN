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
