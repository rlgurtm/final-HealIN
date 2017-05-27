package org.kosta.healthin.controller;

import javax.annotation.Resource;

import org.kosta.healthin.model.service.TrainerVideoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UploadController {
	@Resource
	private TrainerVideoService videoService;
	
	@RequestMapping("trainerVideoList.do")
	public String trainerVideoList(Model model){
		model.addAttribute("listVO",videoService.trainerVideoList());
		return "video/trainer_video_list.tiles";
	}
	@RequestMapping("trainerVideoShow.do")
	public String trainerVideoShow(Model model,int videoNo){
		model.addAttribute("videoVO",videoService.trainerVideoShow(videoNo));
		return "video/trainer_video_show.tiles";
	}
	
	@RequestMapping("portfolio-2-col.do")
	public String portfolio2col(){
		return "video/portfolio_item.tiles";
	}
}
