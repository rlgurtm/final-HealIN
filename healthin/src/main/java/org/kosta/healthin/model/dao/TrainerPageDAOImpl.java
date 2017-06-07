package org.kosta.healthin.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.VO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TrainerPageDAOImpl implements TrainerPageDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public List<VO> trainerPtList(String id){
		return template.selectList("trainerpage.trainerPtList",id);
	}
}
