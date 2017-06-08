package org.kosta.healthin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.healthin.model.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@Resource
	private AdminService adminService;
	
	@RequestMapping("adminAuthority.do")
	public String adminAuthority(){
		return "admin/admin_authority";
	}
	
	@RequestMapping("findByIsTrainer.do")
	public String findByIsTrainer(Model model){
		model.addAttribute("listVO",adminService.findByIsTrainer());
		model.addAttribute("adminState","rankDesignation");
		return "admin/admin_authority";
	}
	@RequestMapping("trainerRankDesignation.do")
	@Transactional
	public String trainerRankDesignation(HttpServletRequest request,Model model){
		Map<String,String> map = new HashMap<String,String>();
		map.put("trainerId", request.getParameter("id"));
		map.put("rank", request.getParameter("trainerRank"));
		// System.out.println(map);
		adminService.trainerRankDesignation(map);
		model.addAttribute("listVO",adminService.findByIsTrainer());
		model.addAttribute("adminState","rankDesignation");
		return "admin/admin_authority";
	}
	
	@RequestMapping("memberSecessionForm.do")
	public String memberSecessionForm(Model model){
		model.addAttribute("listVO",adminService.memberSecessionForm());
		model.addAttribute("adminState","SecessionForm");
		return "admin/admin_authority";
	}
	@RequestMapping("memberSecession.do")
	public String memberSecession(HttpServletRequest request,Model model){
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", request.getParameter("id"));
		String state = request.getParameter("state");
		if(state.equals("사용")){
			map.put("withdrawal", "N");
			adminService.memberSecession(map);
			// System.out.println(map);
		} else if(state.equals("정지")){
			map.put("withdrawal", "Y");
			adminService.memberSecession(map);
			// System.out.println(map);
		} 
		model.addAttribute("listVO",adminService.memberSecessionForm());
		model.addAttribute("adminState","SecessionForm");
		return "admin/admin_authority";
	}
	
	@RequestMapping("findByTrainerVideoForm.do")
	public String findByTrainerVideoForm(Model model){
		model.addAttribute("listVO",adminService.findByTrainerVideoForm());
		model.addAttribute("adminState","findByTrainerVideoForm");
		return "admin/admin_authority";
	}
	@RequestMapping("deleteTrainerVideo.do")
	public String deleteTrainerVideo(HttpServletRequest request,Model model){
		Map<String,String> map = new HashMap<String,String>();
		map.put("videoNo", request.getParameter("videoNo"));
		String state = request.getParameter("state");
		if(state.equals("사용")){
			map.put("openrank", "1");
			adminService.deleteTrainerVideo(map);
		} else if(state.equals("정지")){
			map.put("openrank", "9");
			adminService.deleteTrainerVideo(map);
		}
		model.addAttribute("listVO",adminService.findByTrainerVideoForm());
		model.addAttribute("adminState","findByTrainerVideoForm");
		return "admin/admin_authority";
	}
	
	@RequestMapping("findByBoardForm.do")
	public String findByBoardForm(Model model){
		model.addAttribute("listVO",adminService.findByBoardForm());
		model.addAttribute("adminState","findByBoardForm");
		return "admin/admin_authority";
	}
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(HttpServletRequest request,Model model){
		String state = request.getParameter("state");
		if(state.equals("삭제")){
			adminService.deleteBoard(Integer.parseInt(request.getParameter("boardNo")));
		} 
		model.addAttribute("listVO",adminService.findByBoardForm());
		model.addAttribute("adminState","findByBoardForm");
		return "admin/admin_authority";
	}
	
	
	
	
}
