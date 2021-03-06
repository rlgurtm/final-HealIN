package org.kosta.healthin.controller;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.QnAService;
import org.kosta.healthin.model.service.TipService;
import org.kosta.healthin.model.service.TrainerService;
import org.kosta.healthin.model.service.TrainerVideoService;
import org.kosta.healthin.model.vo.CommentVO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.RateVO;
import org.kosta.healthin.model.vo.TipBoardVO;
import org.kosta.healthin.model.vo.TrainerVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BoardController {
	private String uploadPath
	//송희
	//="C:\\Users\\KOSTA\\git\\final-HealIN\\healthin\\src\\main\\webapp\\resources\\tipFile\\";
	//지선
	//="C:\\java-kosta\\final_project\\healthin\\healthin\\src\\main\\webapp\\resources\\tipFile\\";
	//지원
	//="C:\\Users\\Administrator\\git\\final-HealIN\\healthin\\src\\main\\webapp\\resources\\tipFile\\";
	//기혁
	="C:\\Users\\Administrator\\git\\final-HealIN\\healthin\\src\\main\\webapp\\resources\\tipFile\\";
	@Resource
	private TipService tipService;
	@Resource
	private QnAService qnaService;
	@Resource
	private TrainerService trainerService;	
	@Resource
	private TrainerVideoService trainerVideoService;
	
	@RequestMapping("tip/tip.do")
	public String getTipBoardList(Model model,String nowpage){
		if(nowpage==null)
			nowpage="1";
		ListVO list=tipService.getTipBoardList(nowpage);
		model.addAttribute("list",list );
		return "tip/tip.tiles";
	}
	
	@RequestMapping("tip/search_tip.do")
	public String getSearchtipAllList(Model model,String nowpage,String searchWord){
		if(nowpage==null)
			nowpage="1";
		ListVO list=tipService.getSearchtipAllList(nowpage,searchWord);
		model.addAttribute("list",list );
		return "tip/search_tip.tiles";
	}
	
	@RequestMapping("tipcategory.do")
	@ResponseBody
	public Object tipBoardCategoryList(String category,String nowpage){
		if(nowpage==null)
			nowpage="1";
		return tipService.tipBoardCategoryList(category.trim(), nowpage);
	}
	@RequestMapping("tip/tip_content.do")
	public String getTipBoardContent(String no,Model model){
		tipService.tipHitsCount(no);
		model.addAttribute("tip", tipService.getTipBoardDetailContent(no));
		return "tip/tip_content.tiles";
	}
	@RequestMapping("tip/NO_Hits_tip_content.do")
	public String getTipHitsBoardContent(String no,Model model){
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
		if(!uploadFile.isEmpty()){
			
			
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
		}else{
			tvo.setattachedFile("");
			tipService.tipWrite(tvo);
		}
		return "redirect:/tip/NO_Hits_tip_content.do?no="+tvo.getNo();
	}
	@RequestMapping("fileDownload.do")
	public String fileDownload(String fileName){
		return "downloadView";
	}
	@RequestMapping("tipComment.do")
	@ResponseBody
	public ListVO getTipCommentList(String no,String nowpage){
		if(nowpage==null)
			nowpage="1";
		return tipService.getTipCommentList(no, nowpage);
	}
	@RequestMapping("tipCommentWrite.do")
	public String tipCommentWrite(CommentVO cvo){
				tipService.tipCommentWrite(cvo);
		return "redirect:/tip/NO_Hits_tip_content.do?no="+cvo.getBoardNo();
	}
	@RequestMapping("tipCommentDelete.do")
	public String tipCommentDelete(String no,String bno){
			tipService.tipCommentDelete(no);
		return "redirect:/tip/tip_content.do?no="+bno;
	}
	@RequestMapping("tip/updateForm.do")
	public String tipUpdateForm(String no,Model model){
		model.addAttribute("tip", tipService.getTipBoardDetailContent(no));
		return "tip/updateForm.tiles";
	}
	@RequestMapping("tipBoardUpdate.do")
	public String tipBoardUpdate(TipBoardVO tvo,MultipartFile uploadFile){
		if(!uploadFile.isEmpty()){
			MultipartFile file = uploadFile;
			UUID uuid = UUID.randomUUID();
			String File = uuid.toString()+"_"+uploadFile.getOriginalFilename();
			try {
					file.transferTo(new File(uploadPath+File));
					tvo.setattachedFile(File);
					tipService.tipBoardUpdate(tvo);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}	
		}else{
			tipService.tipBoardUpdate(tvo);
		}
		return "redirect:/tip/NO_Hits_tip_content.do?no="+tvo.getNo();
	}
	@RequestMapping("trainerList.do")
	public String gettrainerList(Model model,String pageNo){
		if(pageNo==null)
			pageNo="1";
		ListVO list=trainerService.getTrainerList(pageNo);
		model.addAttribute("list",list);
		return "trainer/trainerList.tiles";
	}
	@RequestMapping("trainer/trainerSearchList.do")
	public String gettrainerSearchList(Model model,String pageNo,String searchWord){
		if(pageNo==null)
			pageNo="1";

		ListVO list=trainerService.getSearchTrainer(pageNo,searchWord);
		
		model.addAttribute("list",list);
		return "trainer/trainerList.tiles";
	}
	@RequestMapping("order.do")
	@ResponseBody
	public Object trainerListOrder(String order,String pageNo){
		if(pageNo==null)
			pageNo="1";
		return trainerService.trainerListOrder(order, pageNo);
	}
		
	@RequestMapping("trainerDetail.do")
	public String trainerDetail(Model model,String trainerId,HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if(mvo==null)
			return "redirect:home.do";
		TrainerVO vo= trainerService.trainerDetail(trainerId);
		int count =trainerService.trainerfollowingCount(trainerId);
		vo.setCount(count);
		String pageNo = request.getParameter("pageNo");
		ListVO rateList = trainerService.getTrainerRate(trainerId, pageNo);
		if (rateList.getLVO().size() != 0) {
			String pattern = "####.##";
			DecimalFormat dformat = new DecimalFormat(pattern);
			double sumOfRate = trainerService.getSumOfRating(trainerId);
			int totalRatingCount = trainerService.getTotalRatingCountForAvgRate(trainerId);
			String avgRate = dformat.format(sumOfRate / totalRatingCount);
			Double result = Double.parseDouble(avgRate);
			model.addAttribute("totalRatingCount", totalRatingCount);
			model.addAttribute("avgRate", result);
		}
		model.addAttribute("tvo",vo);
		model.addAttribute("trainerId", trainerId);
		model.addAttribute("rateList", rateList);
		
		int nowPage=1;
		PagingBean pb;
		ListVO listVO = new ListVO();
        pb = new PagingBean(3,nowPage);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("pb", pb);
        map.put("trainerId", trainerId);
        listVO = trainerVideoService.findByTrainerIdVideoList(map);
        model.addAttribute("listVO",listVO);
		return "trainer/trainerDetail.tiles";
	}
	
	@RequestMapping("updateRate.do")
	public String updateRate(Model model, HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		int rateNo = Integer.parseInt(request.getParameter("rateNo"));
		//String id = request.getParameter("id");
		double rate = Double.parseDouble(request.getParameter("rate"));
		String content = request.getParameter("content");
		String trainerId = request.getParameter("trainerId");
		map.put("rateNo", rateNo);
		map.put("rate", rate);
		map.put("content", content);
		trainerService.updateRate(map);
		return "redirect:trainerDetail.do?trainerId=" + trainerId;
	}
	
	@RequestMapping("getRatingByRateNo.do")
	@ResponseBody
	public RateVO getExerciseByConsumptionNo(Model model, HttpServletRequest request) {
		int rateNo = Integer.parseInt(request.getParameter("rateNo"));
		RateVO rate = trainerService.getRatingByRateNo(rateNo);
		return rate;
	}
	
	@RequestMapping("deleteRate.do")
	public String deleteRate(Model model, HttpServletRequest request){
		int rateNo = Integer.parseInt(request.getParameter("rateNo"));
		String trainerId = request.getParameter("trainerId");
		trainerService.deleteRate(rateNo);
		return "redirect:trainerDetail.do?trainerId=" + trainerId;
	}
	
	
	@RequestMapping("pt_qna/qna.do")
	public String getptQnaList(){
		return "pt_qna/qna.tiles";
	}
	
	@RequestMapping("pt_qna/search_qna.do")
	public String getSearchQnaAllList(Model model,String nowpage,String searchWord){
		if(nowpage==null)
			nowpage="1";
		
		ListVO list=tipService.getSearchQnaAllList(nowpage,searchWord);
		
		model.addAttribute("qnalist",list );
		return "pt_qna/search_qna.tiles";
	}
	
	@RequestMapping("ptQnaList.do")
	@ResponseBody
	public ListVO getTipBoardList(String nowpage,String category){
		if(nowpage==null)
			nowpage="1";
		if(category.equals("null")||category.equals("Home")){
			return qnaService.getptQnaList(nowpage);
		}else{
			return qnaService.getptQnaCategoryList(category.trim(), nowpage);
		}
	}
	
	@RequestMapping("pt_qna/pt_qna_content.do")
	public String ptQnaContent(String no,Model model){
		qnaService.ptQnaHitsCount(no);
		model.addAttribute("tip",qnaService.getptQnaDetailContent(no));
		return "pt_qna/pt_qna_content.tiles";
	}
	@RequestMapping("pt_qna/NO_Hits_ptQna_content.do")
	public String ptQnaNiHitsContent(String no,Model model){
		model.addAttribute("tip",qnaService.getptQnaDetailContent(no));
		return "pt_qna/pt_qna_content.tiles";
	}
	@RequestMapping("pt_qna/ptQnaWriteForm.do")
	public String ptQnaWriteForm(){
		return "pt_qna/ptQnaWriteForm.tiles";
	}
	@RequestMapping("pt_qna/ptQnaWrite.do")
	public String ptQnaWrite(TipBoardVO tvo,MultipartFile uploadFile){
		if(!uploadFile.isEmpty()){
			MultipartFile file = uploadFile;
			UUID uuid = UUID.randomUUID();
			String File = uuid.toString()+"_"+uploadFile.getOriginalFilename();
			try {
					file.transferTo(new File(uploadPath+File));
					tvo.setattachedFile(File);
					qnaService.ptQnaWrite(tvo);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}	
		}else{
			tvo.setattachedFile("");
			qnaService.ptQnaWrite(tvo);
		}
		return "redirect:/pt_qna/NO_Hits_ptQna_content.do?no="+tvo.getNo();
	}
	@RequestMapping("ptQnaDelete.do")
	public String ptQnaDelete(String no,String id){
		qnaService.ptQnaDelete(no, id);
		return "redirect:/pt_qna/qna.do";
	}
	@RequestMapping("pt_qna/ptQnaUpdateForm.do")
	public String ptQnaUpdateForm(String no,Model model){
		model.addAttribute("tip", qnaService.getptQnaDetailContent(no));
		return "pt_qna/ptQnaUpdateForm.tiles";
	}
	@RequestMapping("ptQnaUpdate.do")
	public String ptQnaUpdate(TipBoardVO tvo,MultipartFile uploadFile){
		if(!uploadFile.isEmpty()){
			MultipartFile file = uploadFile;
			UUID uuid = UUID.randomUUID();
			String File = uuid.toString()+"_"+uploadFile.getOriginalFilename();
			try {
					file.transferTo(new File(uploadPath+File));
					tvo.setattachedFile(File);
					qnaService.ptQnaUpdate(tvo);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}	
		}else{
			qnaService.ptQnaUpdate(tvo);
		}
		return "redirect:/pt_qna/NO_Hits_ptQna_content.do?no="+tvo.getNo();
	}
	@RequestMapping("ptQnaCommentWrite.do")
	public String ptQnaCommentWrite(CommentVO cvo){
		qnaService.ptQnaCommentWrite(cvo);
		return "redirect:/pt_qna/NO_Hits_ptQna_content.do?no="+cvo.getBoardNo();
	}
	@RequestMapping("ptQnaComment.do")
	@ResponseBody
	public ListVO getPtQnaCommentList(String no,String nowpage){
		if(nowpage==null)
			nowpage="1";
		return qnaService.getPtQnaCommentList(no, nowpage);
		
	}
	@RequestMapping("ptQnaCommentDelete")
	public String ptQnaCommentDelete(String no,String bno){
		qnaService.ptQnaCommentDelete(no);
	return "redirect://pt_qna/NO_Hits_ptQna_content.do?no="+bno;
	}
	@RequestMapping("isTrainer.do")
	@ResponseBody
	public String getIsTrainer(String id){
		return qnaService.getIsTrainer(id);
	}
	@RequestMapping("selectfollowstate.do")
	@ResponseBody
	public String selectfollowstate(String memId,String trainerId){
		String apply=trainerService.selectfollowState(memId,trainerId);
		if(apply=="N"||apply==null)
			apply="N";
		return apply;
	}
	
	@RequestMapping("updatefollowState.do")
	@ResponseBody
	public String updatefollowState(HttpServletRequest request,String trainerId){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if(mvo!=null){
			String memId=mvo.getId();
			String state=trainerService.selectfollowState(memId,trainerId);
			if(state == null){
				trainerService.insertfollowtrainer(memId,trainerId);
			}
			else{
				if(state.equals("Y")){
					trainerService.updatefollowState(memId,trainerId,state);
				}
				else if(state.equals("N")) {
					trainerService.updatefollowState(memId,trainerId,state);
				}
			}
			state=trainerService.selectfollowState(memId,trainerId);
			return state;
		} else {
			return "redirect:home.do";
		}
	}
	@RequestMapping("trainerLoc.do")
	public String trainerLoc(Model model,String pageNo,String local){
		if(pageNo==null)
			pageNo="1";
		ListVO list=trainerService.getTrainerLoc(pageNo,local);
		model.addAttribute("list",list);
		return "trainer/trainerList.tiles";
	}
}
