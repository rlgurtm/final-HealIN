package org.kosta.healthin.model.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.ListVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public ListVO findByIsTrainer(){
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("admin.findByIsTrainer"));
		// System.out.println(listVO);
		return listVO;
	}
	@Override
	public void trainerRankDesignation(Map map){
		template.update("admin.trainerRankDesignation",map);
	}
	
	@Override
	public ListVO memberSecessionForm(){
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("admin.memberSecessionForm"));
		return listVO;
	}
	@Override
	public void memberSecession(Map map){
		template.update("admin.memberSecession",map);
	}
	
	@Override
	public ListVO findByTrainerVideoForm(){
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("admin.findByTrainerVideoForm"));
		return listVO;
	}
	@Override
	public void deleteTrainerVideo(Map map){
		template.update("admin.deleteTrainerVideo",map);
	}
	
	@Override
	public ListVO findByBoardForm(){
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("admin.findByBoardForm"));
		return listVO;
	}
	@Override
	public void deleteBoard(int boardNo){
		template.delete("admin.deleteBoard",boardNo);
	}
}
