package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.ListVO;
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

}
