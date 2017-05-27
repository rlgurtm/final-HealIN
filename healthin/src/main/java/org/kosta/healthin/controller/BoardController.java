package org.kosta.healthin.controller;

import javax.annotation.Resource;

import org.kosta.healthin.model.service.TipService;
import org.kosta.healthin.model.vo.ListVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@Resource
	private TipService tipService;
	
	@RequestMapping("tip/tip.do")
	public String getTipBoardList(Model model,String nowpage){
		if(nowpage==null)
			nowpage="1";
		ListVO list=tipService.getTipBoardList(nowpage);
		model.addAttribute("list",list );
		return "tip/tip.tiles";
	}

}
