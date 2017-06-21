package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.RateVO;
import org.kosta.healthin.model.vo.TrainerVO;

public interface TrainerDAO {

	int getTrainerTotalCount();

	List<TrainerVO> getTrainerList(PagingBean pb);

	List<TrainerVO> trainerOrderName(Map<String, Object> map);

	List<TrainerVO> trainerOrderFollowing(Map<String, Object> map);

	TrainerVO trainerDetail(String trainerId);

	int trainerfollowingCount(String trainerId);

	String selectfollowState(Map<String, String> map);

	void updatefollowState(Map<String, String> map);

	void insertfollowtrainer(Map<String, String> map);

	int getTrainerfollowingTotalCount();

	int getTrainerLocTotalCount(String local);

	List<TrainerVO> getTrainerLoc(Map<String, Object> map);
	
	int getTrainerSearchTotalCount(String searchWord);

	List<TrainerVO> getSearchTrainer(Map<String, Object> map);

	List<RateVO> getTrainerRate(Map<String, Object> map);
	
	int getTotalRatingCount(String id);

	double getSumOfRating(String id);
	
	void updateRate(Map<String, Object> map);
	
	RateVO getRatingByRateNo(int rateNo);
	
	void deleteRate(int rateNo);
}
