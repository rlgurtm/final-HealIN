package org.kosta.healthin.model.service;

import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.AdminDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{
	@Resource
	private AdminDAO adminDAO;
	
	@Override
	public ListVO findByIsTrainer(){
		return adminDAO.findByIsTrainer();
	}
	@Override
	public void trainerRankDesignation(Map map){
		adminDAO.trainerRankDesignation(map);
	}
	
	@Override
	public ListVO memberSecessionForm(){
		return adminDAO.memberSecessionForm();
	}
	@Override
	public void memberSecession(Map map){
		adminDAO.memberSecession(map);
	}
	
	@Override
	public ListVO findByTrainerVideoForm(){
		return adminDAO.findByTrainerVideoForm();
	}
	@Override
	public void deleteTrainerVideo(Map map){
		adminDAO.deleteTrainerVideo(map);
	}
	
	@Override
	public ListVO findByBoardForm(){
		return adminDAO.findByBoardForm();
	}
}
