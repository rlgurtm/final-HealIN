package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.ListVO;

public interface TrainerPageService {

	ListVO getFollowerList(String pageNo, String id);
	
	ListVO trainerMatchingList(String id, String pageNo);

	ListVO trainerPtList(String id, String pageNo);
	
	int getFollowerList(String id);

	int trainerPtListCount(String id);

	int trainerMatchingListCount(String id);

	void trainerMatchingUpdate(String userId, String trainerId);



}
