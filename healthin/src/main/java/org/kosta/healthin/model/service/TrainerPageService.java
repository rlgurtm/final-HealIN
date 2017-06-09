package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.ListVO;

public interface TrainerPageService {

	ListVO getFollowerList(String pageNo, String id);
	
	ListVO trainerMatchingList(String id, String pageNo);

	ListVO trainerPtList(String id, String pageNo);

	

}
