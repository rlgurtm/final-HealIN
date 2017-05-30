package org.kosta.healthin.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.TrainerService;
import org.kosta.healthin.model.service.TrainerVideoService;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TrainerVideoVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	private String uploadPath = "C:\\Users\\Administrator\\git\\final-HealIN\\healthin\\src\\main\\webapp\\resources\\video\\";
	
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
	
	@RequestMapping("trainerVideoUpdateForm.do")
	public String trainerVideoUpdateForm(Model model,int videoNo){
		TrainerVideoVO videoVO = videoService.trainerVideoShow(videoNo);
		model.addAttribute("videoVO", videoVO);
		return "video/trainer_video_update_form.tiles";
	}
	@RequestMapping("trainerVideoUpdate.do")
	public String trainerVideoUpdate(HttpServletRequest request,MultipartFile uploadFile){
		MultipartFile file = uploadFile;
		UUID uuid = UUID.randomUUID();
		
		int videoNo = Integer.parseInt(request.getParameter("videoNo"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String videoFile = uuid.toString()+"_"+uploadFile.getOriginalFilename();
		String category = request.getParameter("category");
		String trainerId = request.getParameter("trainerId");
		int	openrank = Integer.parseInt(request.getParameter("openrank"));
		
		TrainerVideoVO vo = new TrainerVideoVO();
		vo.setVideoNo(videoNo);
		vo.setTitle(title);
		vo.setContent(content);
		if(file.isEmpty()==false){
			vo.setVideoFile(videoFile);
		} else {
			vo.setVideoFile(request.getParameter("videoFile"));
		}
		vo.setCategory(category);
		vo.setTrainerId(trainerId);
		vo.setOpenrank(openrank);
		
		try {
			if(file.isEmpty()==false){
				file.transferTo(new File(uploadPath+videoFile));
				videoService.trainerVideoUpdateNewFile(vo);
			} else {
				videoService.trainerVideoUpdate(vo);
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return "redirect:trainerVideoShow.do?videoNo="+vo.getVideoNo();
	}
	
	@RequestMapping("trainerVideoDelete.do")
	public String trainerVideoDelete(int videoNo,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		TrainerVideoVO vo = videoService.trainerVideoShow(videoNo);
		// System.out.println(mvo+"/"+vo);
		if(mvo.getId().equals(vo.getTrainerId())){
			videoService.trainerVideoDelete(videoNo);
			// System.out.println("삭제");
		} else {
			// System.out.println("삭제x");
		}
		return "redirect:trainerVideoList.do";
	}
	
	
	
	
	
	
	@RequestMapping("filter.do")
	public String filter(){
		return "video/portfolio_1_col.tiles";
	}
}
