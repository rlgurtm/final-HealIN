package org.kosta.healthin.model.service;

import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.TrainerVideoDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
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
}
