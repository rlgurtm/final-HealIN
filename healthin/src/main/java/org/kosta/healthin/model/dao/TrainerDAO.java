package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TrainerVO;
import org.kosta.healthin.model.vo.VO;

public interface TrainerDAO {

	int getTrainerTotalCount();

	List<VO> getTrainerList(PagingBean pb);

	List<VO> trainerOrderName(Map<String, Object> map);

	List<VO> trainerOrderFollowing(Map<String, Object> map);

	TrainerVO trainerDetail(String trainerId);

	int trainerfollowingCount(String trainerId);

	String selectfollowState(Map<String, String> map);

	void updatefollowState(Map<String, String> map);

	void insertfollowtrainer(Map<String, String> map);

	int getTrainerfollowingTotalCount();

	int getTrainerLocTotalCount(String local);

	List<VO> getTrainerLoc(Map<String, Object> map);
	
	int getTrainerSearchTotalCount(String searchWord);

	List<VO> getSearchTrainer(Map<String, Object> map);




}
