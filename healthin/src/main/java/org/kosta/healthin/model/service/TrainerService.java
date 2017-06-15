package org.kosta.healthin.model.service;

import java.util.Map;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.RateVO;
import org.kosta.healthin.model.vo.TrainerVO;

public interface TrainerService {

	ListVO getTrainerList(String pageNo);

	Object trainerListOrder(String order, String pageNo);

	TrainerVO trainerDetail(String trainerId);

	int trainerfollowingCount(String trainerId);

	String selectfollowState(String memId, String trainerId);

	void updatefollowState(String memId, String trainerId, String state);

	void insertfollowtrainer(String memId, String trainerId);

	ListVO getTrainerLoc(String pageNo, String local);
	ListVO getSearchTrainer(String pageNo, String searchWord);
	
	ListVO getTrainerRate(String id, String pageNo);
	double getSumOfRating(String id);
	int getTotalRatingCountForAvgRate(String id);
	void updateRate(Map<String, Object> map);
	RateVO getRatingByRateNo(int rateNo);
	void deleteRate(int rateNo);
}
