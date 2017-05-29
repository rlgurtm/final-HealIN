package org.kosta.healthin.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.healthin.model.service.TrainerVideoService;
import org.kosta.healthin.model.vo.TrainerVideoVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	private String uploadPath;
	
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
	@RequestMapping("trainerVideoWriteForm.do")
	public String trainerVideoWriteForm(){
		return "video/trainer_video_write_form.tiles";
	}
	@RequestMapping("trainerVideoWrite.do")
	public String trainerVideoWrite(HttpServletRequest request,MultipartFile uploadFile){
		uploadPath = "C:\\Users\\Administrator\\git\\final-HealIN\\healthin\\src\\main\\webapp\\resources\\video\\";
		MultipartFile file = uploadFile;
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String videoFile = uploadFile.getOriginalFilename();
		String category = request.getParameter("category");
		String trainerId = request.getParameter("trainerId");
		int	openrank = Integer.parseInt(request.getParameter("openrank"));
		
		TrainerVideoVO vo = new TrainerVideoVO();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setVideoFile(videoFile);
		vo.setCategory(category);
		vo.setTrainerId(trainerId);
		vo.setOpenrank(openrank);
		
		System.out.println(vo);
		
		
		return "video/trainer_video_write_form.tiles";
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping("filter.do")
	public String filter(){
		return "video/portfolio_1_col.tiles";
	}
}
