package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.TrainerVO;

public interface TrainerService {

	ListVO getTrainerList(String pageNo);

	Object trainerListOrder(String order, String pageNo);

	TrainerVO trainerDetail(String trainerId);

	int trainerfollowingCount(String trainerId);

	int followingViewCount(String memId);

}
