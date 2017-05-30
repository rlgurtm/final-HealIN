package org.kosta.healthin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.healthin.model.service.TrainerVideoService;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TrainerVideoVO;
import org.kosta.healthin.model.vo.VO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	private String uploadPath;
	
	@Resource
	private TrainerVideoService videoService;
	
	@RequestMapping("trainerVideoList.do")
	public String trainerVideoList(Model model,HttpServletRequest request){
		int nowPage;
		PagingBean pb;
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		} else {
			nowPage = 1;
		}
		int totalContents = videoService.totalCountVideo();
		pb = new PagingBean(totalContents,nowPage);
		ListVO listVO = new ListVO();
		listVO = videoService.trainerVideoList(pb);
		listVO.setPb(pb);
		model.addAttribute("listVO",listVO);
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
		uploadPath = "C:\\Users\\KOSTA\\git\\final-HealIN\\healthin\\src\\main\\webapp\\resources\\video\\";
		MultipartFile file = uploadFile;
		UUID uuid = UUID.randomUUID();
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String videoFile = uuid.toString()+"_"+uploadFile.getOriginalFilename();
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
		
		try {
			file.transferTo(new File(uploadPath+videoFile));
			videoService.trainerVideoWrite(vo);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		// System.out.println(vo);
		return "redirect:trainerVideoShow.do?videoNo="+vo.getVideoNo();
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping("filter.do")
	public String filter(){
		return "video/portfolio_1_col.tiles";
	}
}
