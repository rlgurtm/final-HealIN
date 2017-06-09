package org.kosta.healthin.model.dao;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.ListVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDAOImpl implements HomeDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public ListVO getVideoListOnMainpage() {
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("home.getVideoListOnMainpage"));
		return listVO;
	}
	
	@Override
	public  ListVO getTrainerInfoListOnMainpage() {
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("home.getTrainerInfoListOnMainpage"));
		return listVO;
	}

	@Override
	public ListVO getTipBoardOnMainPage() {
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("home.getTipBoardOnMainPage"));
		return listVO;
	}

	@Override
	public ListVO getQnABoardOnMainPage() {
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("home.getQnABoardOnMainPage"));
		return listVO;
	}
}
