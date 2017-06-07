package org.kosta.healthin.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.TrainerPageDAO;
import org.kosta.healthin.model.vo.VO;
import org.springframework.stereotype.Service;

@Service
public class TrainerPageServiceImpl implements TrainerPageService{
	@Resource
	private TrainerPageDAO dao;
	
	@Override
	public List<VO> trainerPtList(String id){
		return dao.trainerPtList(id);
	}
}
