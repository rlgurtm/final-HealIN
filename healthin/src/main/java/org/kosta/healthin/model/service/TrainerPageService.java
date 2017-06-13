package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.ListVO;

public interface TrainerPageService {

	ListVO getFollowerList(String pageNo, String id);
	
	ListVO trainerMatchingList(String id, String pageNo);

	ListVO trainerPtList(String id, String pageNo);
	
	int getFollowerList(String id);

	void updateAcceptState(String trainerId, String userId);

	int trainerPtListCount(String id);

	int trainerMatchingListCount(String id);

	void trainerMatchingUpdate(String userId, String trainerId);

	void userMatchingInsert(String userId, String trainerId);

	void payInsert(String userId, String trainerId, String period);

	ListVO userPtList(String id, String nowpage);



}
