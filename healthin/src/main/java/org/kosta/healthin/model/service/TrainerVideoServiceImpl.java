package org.kosta.healthin.model.service;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.TrainerVideoDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.TrainerVideoVO;
import org.springframework.stereotype.Service;

@Service
public class TrainerVideoServiceImpl implements TrainerVideoService{
	@Resource
	private TrainerVideoDAO videoDAO;
	
	@Override
	public ListVO trainerVideoList(){
		return videoDAO.trainerVideoList();
	}
	@Override
	public TrainerVideoVO trainerVideoShow(int videoNo){
		return videoDAO.trainerVideoShow(videoNo);
	}

}
