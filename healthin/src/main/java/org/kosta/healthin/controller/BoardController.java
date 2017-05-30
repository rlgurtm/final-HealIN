package org.kosta.healthin.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.kosta.healthin.model.service.TipService;
import org.kosta.healthin.model.service.TrainerService;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.TipBoardVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BoardController {
	private String uploadPath;
	
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
	@RequestMapping("tipBoardDelete.do")
	public String tipboardDelete(String no,String id){
		tipService.tipBoardDelete(no, id);
		return "redirect:/tip/tip.do";
	}
	@RequestMapping("tip/tipWriteForm.do")
	public String tipWriteForm(){
		return "tip/tipWriteForm.tiles";
	}
	@RequestMapping("tip/tipWrite.do")
	public String tipWrite(TipBoardVO tvo,MultipartFile uploadFile){
		System.out.println("tipboard::::"+tvo);
		uploadPath = "C:\\Users\\KOSTA\\git\\final-HealIN\\healthin\\src\\main\\webapp\\resources\\video\\";
		MultipartFile file = uploadFile;
		UUID uuid = UUID.randomUUID();
		String File = uuid.toString()+"_"+uploadFile.getOriginalFilename();
		try {
				file.transferTo(new File(uploadPath+File));
				tvo.setattachedFile(File);
				tipService.tipWrite(tvo);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}	
	
		return "redirect:/tip/tip_content.do?no="+tvo.getNo();
	}
	@RequestMapping("trainer/trainerList.do")
	public String gettrainerList(Model model,String pageNo){
		if(pageNo==null)
			pageNo="1";
		ListVO list=trainerService.getTrainerList(pageNo);
		model.addAttribute("list",list);
		return "trainer/trainerList.tiles";
	}
	@RequestMapping("order.do")
	@ResponseBody
	public Object trainerListOrder(String category,String nowpage){
		if(nowpage==null)
			nowpage="1";
		System.out.println(tipService.tipBoardCategoryList(category, nowpage));
		return tipService.tipBoardCategoryList(category, nowpage);
	}
}
