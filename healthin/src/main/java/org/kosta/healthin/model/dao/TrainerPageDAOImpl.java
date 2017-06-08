package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

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

	@Override
	public int getFollowerTotalCount(String id) {
		return template.selectOne("trainerpage.getFollowerTotalCount",id);
	}

	@Override
	public List<VO> getFollowerList(Map<String, Object> map) {
		return template.selectList("trainerpage.getFollowerList",map);
	}
}
