package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TrainerVO;
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
	public List<VO> getTrainerList(PagingBean pb) {
		return template.selectList("trainer.getTrainerList",pb);
	}

	@Override
	public List<VO> trainerOrderName(Map<String, Object> map) {
		return template.selectList("trainer.trainerOrderName",map);
	}

	@Override
	public List<VO> trainerOrderRate(Map<String, Object> map) {
		return template.selectList("trainer.trainerOrderRate",map);
	}

	@Override
	public TrainerVO trainerDetail(String trainerId) {
		return template.selectOne("trainer.trainerDetail",trainerId);
	}

	@Override
	public int trainerfollowingCount(String trainerId) {
		return template.selectOne("trainer.trainerfollowingCount",trainerId);
	}
}
