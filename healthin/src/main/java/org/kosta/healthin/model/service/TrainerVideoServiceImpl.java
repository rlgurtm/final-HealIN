package org.kosta.healthin.model.service;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.TrainerVideoDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TrainerVideoVO;
import org.springframework.stereotype.Service;

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
	public TrainerVideoVO trainerVideoShow(int videoNo){
		return videoDAO.trainerVideoShow(videoNo);
	}
	@Override
	public void trainerVideoWrite(TrainerVideoVO trainerVideoVO){
		videoDAO.trainerVideoWrite(trainerVideoVO);
	}
}
