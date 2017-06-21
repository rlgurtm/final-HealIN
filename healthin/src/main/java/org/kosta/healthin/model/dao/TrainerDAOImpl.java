package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.RateVO;
import org.kosta.healthin.model.vo.TrainerVO;
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
	public List<TrainerVO> getTrainerList(PagingBean pb) {
		return template.selectList("trainer.getTrainerList",pb);
	}

	@Override
	public List<TrainerVO> trainerOrderName(Map<String, Object> map) {
		return template.selectList("trainer.trainerOrderName",map);
	}

	@Override
	public List<TrainerVO> trainerOrderFollowing(Map<String, Object> map) {
		return template.selectList("trainer.trainerOrderFollowing",map);
	}

	@Override
	public TrainerVO trainerDetail(String trainerId) {
		return template.selectOne("trainer.trainerDetail",trainerId);
	}

	@Override
	public int trainerfollowingCount(String trainerId) {
		return template.selectOne("trainer.trainerfollowingCount",trainerId);
	}

	@Override
	public String selectfollowState(Map<String, String> map) {
		return template.selectOne("trainer.selectfollowState",map);
	}

	@Override
	public void updatefollowState(Map<String, String> map) {
		template.update("trainer.updatefollowState",map);
	}

	@Override
	public void insertfollowtrainer(Map<String, String> map) {
		template.insert("trainer.insertfollowtrainer",map);
	}

	@Override
	public int getTrainerfollowingTotalCount() {
		return template.selectOne("trainer.getTrainerfollowingTotalCount");
	}

	@Override
	public int getTrainerLocTotalCount(String local) {
		return template.selectOne("trainer.getTrainerLocTotalCount",local);
	}

	@Override
	public List<TrainerVO> getTrainerLoc(Map<String, Object> map) {
		return template.selectList("trainer.getTrainerLoc",map);
	}
	
	@Override
	public int getTrainerSearchTotalCount(String searchWord) {
		return template.selectOne("searchTrainer.getTrainerSearchTotalCount",searchWord);
	}

	@Override   //getTrainerList
	public List<TrainerVO> getSearchTrainer(Map<String, Object> map) {
		return template.selectList("searchTrainer.getSearchTrainer",map);
	}

	@Override
	public List<RateVO> getTrainerRate(Map<String, Object> map) {
		System.out.println(map);
		return template.selectList("trainer.getTrainerRate", map);
	}

	@Override
	public int getTotalRatingCount(String id) {
		System.out.println(id);
		return template.selectOne("trainer.getTotalRatingCount", id);
	}

	@Override
	public double getSumOfRating(String id) {
		return template.selectOne("trainer.getSumOfRating", id);
	}

	@Override
	public void updateRate(Map<String, Object> map) {
		template.update("trainer.updateRate", map);
	}

	@Override
	public RateVO getRatingByRateNo(int rateNo) {
		return template.selectOne("trainer.getRatingByRateNo", rateNo);
	}

	@Override
	public void deleteRate(int rateNo) {
		template.delete("trainer.deleteRate", rateNo);
	}

}
