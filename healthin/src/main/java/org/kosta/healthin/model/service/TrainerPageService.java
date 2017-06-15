package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PayVO;

public interface TrainerPageService {

	ListVO getFollowerList(String pageNo, String id);
	
	ListVO trainerMatchingList(String id, String pageNo);

	ListVO trainerPtList(String id, String pageNo);
	
	int getFollowerCount(String id);

	void updateAcceptState(String trainerId, String userId);

	int trainerPtListCount(String id);

	int trainerMatchingListCount(String id);

	void trainerMatchingUpdate(String userId, String trainerId);

	void userMatchingInsert(String userId, String trainerId);

	void payInsert(String userId, String trainerId, String period);

	ListVO userPtList(String id, String nowpage);

	ListVO trainerSearchList(String nowpage, String searchWord);

	Object getBothFollowList(String pageNo, String trainerid);

	PayVO userTrainerPay(String userId, String trainerId);

	void userDepositUpate(String userId, String trainerId);

	int countExistMatching(String userId, String trainerId);

	int countExistMatching1(String userId, String trainerId);

	int countExistFollowing(String userId, String trainerId);

	void trainerPayUpdate(String userId, String trainerId);

	ListVO userPtMatchingList(String id, String pageNo);

	String getOneMatchingInfo(String id, String id2);

	int ExpiredMatching(String userId, String trainerId);

	void MatchingDelete(String userId, String trainerId);

	void ExpiredPayUpate(String userId, String trainerId);


}
