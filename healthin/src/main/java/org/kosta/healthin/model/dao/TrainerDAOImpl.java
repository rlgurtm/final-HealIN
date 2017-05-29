package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.VO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TrainerDAOImpl implements TrainerDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public int getTrainerTotalCount() {
		return template.selectOne("trainer.getTrainerTotalCount");
	}

	@Override
	public List<VO> getTrainerList(Map<String, Integer> map) {
		return template.selectList("trainer.getTrainerList",map);
	}

}
