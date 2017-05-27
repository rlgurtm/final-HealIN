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
	public ListVO videoListOnMainpage() {
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("home.getVideoListByPopularity"));
		//System.out.println(listVO);
		return listVO;
	}
	
	@Override
	public  ListVO trainerInfoListOnMainpage() {
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("home.getTrainerInfoListByPopularity"));
		//System.out.println(listVO);
		return listVO;
	}

	@Override
	public ListVO tipAndQnaBoardOnMainpage() {
		// TODO Auto-generated method stub
		return null;
	}
}
