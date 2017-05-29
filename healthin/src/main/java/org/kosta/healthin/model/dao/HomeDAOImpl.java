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
		//System.out.println(listVO);
		return listVO;
	}
	
	@Override
	public  ListVO getTrainerInfoListOnMainpage() {
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("home.getTrainerInfoListByPopularity"));
		//System.out.println(listVO);
		return listVO;
	}
}
