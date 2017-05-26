package org.kosta.healthin.controller;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.healthin.model.service.TipService;
import org.kosta.healthin.model.vo.VO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@Resource
	private TipService tipService;
	
	@RequestMapping("tip/tip.do")
	public String getTipBoardList(Model model){
		//PagingBean pangebean= new PagingBean(3,1);
		List<VO> list=tipService.getTipBoardList();
		//ListVO listVO=new ListVO(list, pangebean);
		model.addAttribute("list",list );
		return "tip/tip.tiles";
	}

}
