package org.kosta.healthin.model.dao;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.TrainerVideoVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TrainerVideoDAOImpl implements TrainerVideoDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public ListVO trainerVideoList(){
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("trainervideo.trainerVideoList"));
		//System.out.println(listVO);
		return listVO;
	}
	
	@Override
	public TrainerVideoVO trainerVideoShow(int videoNo){
		return template.selectOne("trainervideo.trainerVideoShow",videoNo);
	}

}
