package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.PayVO;
import org.kosta.healthin.model.vo.VO;

public interface TrainerPageDAO {

	List<VO> trainerPtList(Map<String, Object> map);

	int getFollowerTotalCount(String id);

	List<VO> getFollowerList(Map<String, Object> map);

	List<VO> trainerMatchingList(Map<String, Object> map);

	int trainerPtListCount(String id);

	int trainerMatchingListCount(String id);

	void updateAcceptState(Map<String, String> map);

	String selectAcceptState(Map<String, String> map);

	void trainerMatcingUpdate(Map<String, Object> map);

	void userMatchingInsert(Map<String, Object> map);

	void payInsert(Map<String, Object> map);

	List<VO> userPtList(Map<String, Object> map);

	int userPtListCount(String id);

	List<VO> trainerSearchList(Map<String, Object> map);
	
	int getFollowerCount(String id);

	int getBothFollowTotalCount(String trainerid);

	List<VO> getBothFollowList(Map<String, Object> map);

	PayVO userTrainerPay(Map<String, Object> map);

	void userDepositUpate(Map<String, Object> map);

	int countExistMatching(Map<String, Object> map);

	int countExistMatching1(Map<String, Object> map);

	int countExistFollowing(Map<String, Object> map);

	void trainerPayUpdate(Map<String, Object> map);

	int userPtMatchingListCount(String id);

	List<VO> userPtMatchingList(Map<String, Object> map);

	List<String> findFieldCategory();

	void insertTrainerField(Map map);

	void deleteTrainerField(String mvoId);

	void trainerRankUp(String trainerId);
	
}
