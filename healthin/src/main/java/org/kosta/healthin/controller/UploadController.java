package org.kosta.healthin.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.healthin.model.service.TrainerVideoService;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TrainerVideoCommentVO;
import org.kosta.healthin.model.vo.TrainerVideoVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	private String uploadPath 
	//기혁
	= "C:\\Users\\Administrator\\git\\final-HealIN\\healthin\\src\\main\\webapp\\resources\\video\\";
	//송희
	//= "C:\\Users\\kosta\\git\\final-HealIN\\healthin\\src\\main\\webapp\\resources\\video\\";
    //wpfajswjrkftkfka
	//= "C:\\java-kosta\\final_project\\healthin\\healthin\\src\\main\\webapp\\resources\\video\\";
	
	@Resource
	private TrainerVideoService videoService;
	
	/*@RequestMapping("trainerVideoList.do")
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
		for(int i=0;i<listVO.getLVO().size();i++){
			System.out.println(listVO.getLVO().get(i).toString());
		}
		model.addAttribute("listVO",listVO);
		return "video/trainer_video_list.tiles";
	}*/
	@SuppressWarnings("rawtypes")
	@RequestMapping("trainerVideoShow.do")
	public String trainerVideoShow(Model model, int videoNo, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		MemberVO mvo = null;
		if (session.getAttribute("mvo") != null) {
			mvo = (MemberVO) session.getAttribute("mvo");
		}
		int nowPage;
		PagingBean pb;
		int commentTotalCount; 
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		} else {
			nowPage = 1;
		}
		// Paging처리를 위한 totalCount
		commentTotalCount = videoService.commentTotalCount(videoNo);
		pb = new PagingBean(commentTotalCount,nowPage);
		Map<String,Object> map1 = new HashMap<String, Object>();
		map1.put("pb", pb);
		map1.put("videoNo", videoNo);
		// 댓글부분
		ListVO listVO = videoService.showVideoComment(map1);
		listVO.setPb(pb);
		// rank 판독 부분
		TrainerVideoVO videoVO = videoService.trainerVideoDetail(videoNo);
		if (videoVO.getOpenrank() == 0) {
			// 전체공개
			model.addAttribute("videoVO", videoService.trainerVideoShow(videoNo));
			model.addAttribute("listVO",listVO);
			return "video/trainer_video_show.tiles";
		} else if (mvo != null) {
			if (mvo.getId().equals(videoVO.getTrainerId())) {
				// 강사 본인 게시글 확인
				model.addAttribute("videoVO", videoService.trainerVideoShow(videoNo));
				model.addAttribute("listVO",listVO);
				return "video/trainer_video_show.tiles";
			} else {
				if (videoVO.getOpenrank() == 1) {
					// 회원공개
					if (videoService.trainerVideoSelectMember(mvo.getId()) > 0) {
						model.addAttribute("videoVO", videoService.trainerVideoShow(videoNo));
						model.addAttribute("listVO",listVO);
						return "video/trainer_video_show.tiles";
					}
				} else if (videoVO.getOpenrank() == 2) {
					// 팔로우회원공개
					Map<String, String> map = new HashMap<String, String>();
					map.put("userId", mvo.getId());
					map.put("trainerId", videoVO.getTrainerId());
					if (videoService.trainerVideoSelectFollowing(map) > 0) {
						model.addAttribute("videoVO", videoService.trainerVideoShow(videoNo));
						model.addAttribute("listVO",listVO);
						return "video/trainer_video_show.tiles";
					}
				} else if (videoVO.getOpenrank() == 3) {
					// PT회원공개
					Map<String, String> map = new HashMap<String, String>();
					map.put("userId", mvo.getId());
					map.put("trainerId", videoVO.getTrainerId());
					if (videoService.trainerVideoSelectMatching(map) > 0) {
						model.addAttribute("videoVO", videoService.trainerVideoShow(videoNo));
						model.addAttribute("listVO",listVO);
						return "video/trainer_video_show.tiles";
					}
				} else if (videoVO.getOpenrank() == 5) {
					// 비공개
					if (mvo.getId().equals(videoVO.getTrainerId())) {
						model.addAttribute("videoVO", videoService.trainerVideoShow(videoNo));
						model.addAttribute("listVO",listVO);
						return "video/trainer_video_show.tiles";
					}
				}
			}
		}
		model.addAttribute("openrank", videoVO.getOpenrank());
		return "video/trainer_video_show_fail";
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
		int openrank = Integer.parseInt(request.getParameter("openrank"));

		TrainerVideoVO vo = new TrainerVideoVO();
		vo.setTitle(title);
		vo.setContent(content);
		vo.setVideoFile(videoFile);
		vo.setCategory(category);
		vo.setTrainerId(trainerId);
		vo.setOpenrank(openrank);

		try {
			// 파일생성
			file.transferTo(new File(uploadPath+videoFile));
			// DB에 동영상글 저장
			videoService.trainerVideoWrite(vo);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
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
		return "redirect:filterVideoList.do?filter=no";
	}
	
	@RequestMapping("filterVideoList.do")
	public String filterVideoList(Model model,HttpServletRequest request){
		int nowPage;
		PagingBean pb;
		int filterTotalCount; 
		ListVO listVO = new ListVO();
		String filter = request.getParameter("filter");
		if(request.getParameter("nowPage")!=null){
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		} else {
			nowPage = 1;
		}
		if(filter.equals("no")){
			// filter없는 list
			filterTotalCount = videoService.totalCountVideo();
			pb = new PagingBean(filterTotalCount,nowPage);
			listVO = videoService.trainerVideoList(pb);
			listVO.setPb(pb);
			model.addAttribute("filter",filter);
		} else if(filter.equals("hits")){
			// filter 조회수순 list
			filterTotalCount = videoService.totalCountVideo();
			pb = new PagingBean(filterTotalCount,nowPage);
			listVO = videoService.filterHitsTrainerVideoList(pb);
			listVO.setPb(pb);
			model.addAttribute("filter",filter);
		} else if (filter.equals("likeState")){
			// filter 좋아요순 list
			filterTotalCount = videoService.totalCountVideo();
			pb = new PagingBean(filterTotalCount,nowPage);
			listVO = videoService.filterLikeStateTrainerVideoList(pb);
			listVO.setPb(pb);
			model.addAttribute("filter",filter);
		} else if(filter.equals("postedDate")){
			// filter 최신순 list
			filterTotalCount = videoService.totalCountVideo();
			pb = new PagingBean(filterTotalCount,nowPage);
			listVO = videoService.filterPostedDateTrainerVideoList(pb);
			listVO.setPb(pb);
			model.addAttribute("filter",filter);
		} else if(filter.equals("openrank")){
			int rank = Integer.parseInt(request.getParameter("rank"));
			filterTotalCount = videoService.filterOpenrankTotalCountVideo(rank);
			pb = new PagingBean(filterTotalCount,nowPage);
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("pb", pb);
			map.put("openrank", rank);
			listVO = videoService.filterOpenrankTrainerVideoList(map);
			listVO.setPb(pb);
			model.addAttribute("filter",filter+"&rank="+rank);
		} else if(filter.equals("category")){
			String category = request.getParameter("cate");
			filterTotalCount = videoService.filterCategoryTotalCountVideo(category);
			pb = new PagingBean(filterTotalCount,nowPage);
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("pb", pb);
			map.put("category", category);
			listVO = videoService.filterCategoryTrainerVideoList(map);
			listVO.setPb(pb);
			model.addAttribute("filter",filter+"&cate="+category);
		} else if(filter.equals("findByTrainerId")){
			String trainerId = request.getParameter("trainerId");
			filterTotalCount = videoService.findByTotalCount(trainerId);
			pb = new PagingBean(filterTotalCount,nowPage);
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("pb", pb);
			map.put("trainerId", trainerId);
			listVO = videoService.findByTrainerIdVideoList(map);
			listVO.setPb(pb);
			model.addAttribute("filter",filter+"&trainerId="+trainerId);
		}
		/*for(int i=0;i<listVO.getLVO().size();i++){
			System.out.println(listVO.getLVO().get(i).toString());
		}*/
		model.addAttribute("listVO",listVO);
		return "video/trainer_video_list.tiles";
	}
	
	@RequestMapping("searchVideoList.do")
	public String searchVideoList(Model model,String searchWord){
		int nowPage;
		PagingBean pb;
		int filterTotalCount; 
		ListVO listVO = new ListVO();
		Map<String,Object> map = new HashMap<String,Object>();
		
		String filter = "no";
		
		
		nowPage = 1;
		
		if(filter.equals("no")){
			filterTotalCount = videoService.selectedCountVideo(searchWord);
			pb = new PagingBean(filterTotalCount,nowPage);
			map.put("pb", pb);
			map.put("searchWord", searchWord);
			listVO = videoService.trainerSearchVideoList(map);
			listVO.setPb(pb);
			model.addAttribute("filter",filter);
		}

		model.addAttribute("listVO",listVO);
		return "video/selected_trainer_video_list.tiles";
	}
	
	
	@RequestMapping("selectVideoLikeState.do")
	@ResponseBody
	public int selectVideoLikeState(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		int videoNo = Integer.parseInt(request.getParameter("videoNo"));
		Map<String,Object> map = new HashMap<String,Object>();
		if(mvo!=null){
			map.put("userId", mvo.getId());
			map.put("videoNo", videoNo);
			return videoService.selectVideoLikeState(map);
		} else {
			return 0;
		}
	}
	@RequestMapping("updateVideoLikeState.do")
	@ResponseBody
	public int updateVideoLikeState(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		int videoNo = Integer.parseInt(request.getParameter("videoNo"));
		Map<String,Object> map = new HashMap<String,Object>();
		if(mvo!=null){
			map.put("userId", mvo.getId());
			map.put("videoNo", videoNo);
			if(videoService.selectVideoLikeState(map)==0){
				videoService.insertVideoLikeState(map);
			} else if(videoService.selectVideoLikeState(map)==1) {
				videoService.deleteVideoLikeState(map);
			} 
			return videoService.selectVideoLikeState(map);
		} else {
			return 0;
		}
	}
	
	@RequestMapping("trainerNameKeywordSelect")
	@ResponseBody
	public List<String> trainerNameKeywordSelect(HttpServletRequest request){
		String keyword = request.getParameter("keyword");
		List<String> trainerNamelist = videoService.trainerNameKeywordSelect(keyword);
		
		return trainerNamelist;
	}
	
	@RequestMapping("registerVideoComment.do")
	public String registerVideoComment(TrainerVideoCommentVO cvo){
		// System.out.println(cvo);
		videoService.registerVideoComment(cvo);
		return "redirect:trainerVideoShow.do?videoNo="+cvo.getVideoNo()+"#loca";
	}
	@RequestMapping("deleteVideoComment.do")
	public String deleteVideoComment(TrainerVideoCommentVO cvo){
		// System.out.println(cvo);
		videoService.deleteVideoComment(cvo.getVideoCommentNo());
		return "redirect:trainerVideoShow.do?videoNo="+cvo.getVideoNo()+"#loca";
	}
	
	
	
	@RequestMapping("filter.do")
	public String filter(){
		return "video/portfolio_1_col.tiles";
	}
}
