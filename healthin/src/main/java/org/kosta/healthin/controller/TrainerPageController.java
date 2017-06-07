package org.kosta.healthin.controller;

import javax.annotation.Resource;

import org.kosta.healthin.model.service.TrainerPageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TrainerPageController {
	@Resource
	private TrainerPageService trainerPageService;

	@RequestMapping("ptList.do")
	public String ptList(String id,Model model){
		model.addAttribute("ptList", trainerPageService.trainerPtList(id));
		return "trainer/ptList.tiles";
	}
}
