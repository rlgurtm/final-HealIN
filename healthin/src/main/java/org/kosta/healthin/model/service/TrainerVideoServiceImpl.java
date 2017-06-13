package org.kosta.healthin.model.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.TrainerVideoDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TrainerVideoCommentVO;
import org.kosta.healthin.model.vo.TrainerVideoVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class TrainerVideoServiceImpl implements TrainerVideoService{
	@Resource
	private TrainerVideoDAO videoDAO;
	
	@Override
	public int totalCountVideo(){
		return videoDAO.totalCountVideo();
	}
	@Override
	public ListVO trainerVideoList(PagingBean pb){
		return videoDAO.trainerVideoList(pb);
	}
	@Override
	public TrainerVideoVO trainerVideoDetail(int videoNo){
		return videoDAO.trainerVideoShow(videoNo);
	}
	@Override
	@Transactional
	public TrainerVideoVO trainerVideoShow(int videoNo){
		videoDAO.trainerVideoShowHits(videoNo);
		return videoDAO.trainerVideoShow(videoNo);
	}
	@Override
	public void trainerVideoWrite(TrainerVideoVO trainerVideoVO){
		videoDAO.trainerVideoWrite(trainerVideoVO);
	}
	@Override
	public void trainerVideoUpdateNewFile(TrainerVideoVO trainerVideoVO){
		videoDAO.trainerVideoUpdateNewFile(trainerVideoVO);
	}
	@Override
	public void trainerVideoUpdate(TrainerVideoVO trainerVideoVO){
		videoDAO.trainerVideoUpdate(trainerVideoVO);
	}
	@Override
	public void trainerVideoDelete(int videoNo){
		videoDAO.trainerVideoDelete(videoNo);
	}
	@Override
	public int trainerVideoSelectMember(String id){
		return videoDAO.trainerVideoSelectMember(id);
	}
	@Override
	public int trainerVideoSelectFollowing(Map<String,String> map){
		return videoDAO.trainerVideoSelectFollowing(map);
	}
	@Override
	public int trainerVideoSelectMatching(Map<String,String> map){
		return videoDAO.trainerVideoSelectMatching(map);
	}
	@Override
	public ListVO filterHitsTrainerVideoList(PagingBean pb){
		return videoDAO.filterHitsTrainerVideoList(pb);
	}
	@Override
	public ListVO filterLikeStateTrainerVideoList(PagingBean pb){
		return videoDAO.filterLikeStateTrainerVideoList(pb);
	}
	@Override
	public ListVO filterPostedDateTrainerVideoList(PagingBean pb){
		return videoDAO.filterPostedDateTrainerVideoList(pb);
	}
	@Override
	public int filterOpenrankTotalCountVideo(int openrank){
		return videoDAO.filterOpenrankTotalCountVideo(openrank);
	}
	@Override
	public ListVO filterOpenrankTrainerVideoList(Map map){
		return videoDAO.filterOpenrankTrainerVideoList(map);
	}
	@Override
	public int filterCategoryTotalCountVideo(String category){
		return videoDAO.filterCategoryTotalCountVideo(category);
	}
	@Override
	public ListVO filterCategoryTrainerVideoList(Map map){
		return videoDAO.filterCategoryTrainerVideoList(map);
	}
	@Override
	public int selectVideoLikeState(Map map){
		return videoDAO.selectVideoLikeState(map);
	}
	@Override
	public int insertVideoLikeState(Map map){
		return videoDAO.insertVideoLikeState(map);
	}
	@Override
	public int deleteVideoLikeState(Map map){
		return videoDAO.deleteVideoLikeState(map);
	}
	@Override
	public List<String> trainerNameKeywordSelect(String keyword){
		return videoDAO.trainerNameKeywordSelect(keyword);
	}
	@Override
	public int findByTotalCount(String trainerId){
		return videoDAO.findByTotalCount(trainerId);
	}
	@Override
	public ListVO findByTrainerIdVideoList(Map map){
		return videoDAO.findByTrainerIdVideoList(map);
	}
	
	@Override
	public int commentTotalCount(int videoNo){
		return videoDAO.commentTotalCount(videoNo);
	}
	@Override
	public ListVO showVideoComment(Map map){
		return videoDAO.showVideoComment(map);
	}
	@Override
	public void registerVideoComment(TrainerVideoCommentVO cvo){
		videoDAO.registerVideoComment(cvo);
	}
	@Override
	public void deleteVideoComment(int videoCommentNo){
		videoDAO.deleteVideoComment(videoCommentNo);
	}
	@Override
	public ListVO findBysearchWordVideoList(Map map) {
		return videoDAO.findBysearchWordVideoList(map);
	}
}
