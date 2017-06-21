package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.PayVO;

public interface TrainerPageDAO {

	List<MemberVO> trainerPtList(Map<String, Object> map);

	int getFollowerTotalCount(String id);

	List<MemberVO> getFollowerList(Map<String, Object> map);

	List<MemberVO> trainerMatchingList(Map<String, Object> map);

	int trainerPtListCount(String id);

	int trainerMatchingListCount(String id);

	void updateAcceptState(Map<String, String> map);

	String selectAcceptState(Map<String, String> map);

	void trainerMatcingUpdate(Map<String, Object> map);

	void userMatchingInsert(Map<String, Object> map);

	void payInsert(Map<String, Object> map);

	List<MemberVO> userPtList(Map<String, Object> map);

	int userPtListCount(String id);

	int getFollowerCount(String id);

	int getBothFollowTotalCount(String trainerid);

	List<MemberVO> getBothFollowList(Map<String, Object> map);

	PayVO userTrainerPay(Map<String, Object> map);

	void userDepositUpate(Map<String, Object> map);

	int countExistMatching(Map<String, Object> map);

	int countExistMatching1(Map<String, Object> map);

	int countExistFollowing(Map<String, Object> map);

	void trainerPayUpdate(Map<String, Object> map);

	int userPtMatchingListCount(String id);

	List<MemberVO> userPtMatchingList(Map<String, Object> map);

	String getOneMatchingInfo(Map<String, Object> map);

	int ExpiredMatching(Map<String, Object> map);

	void MatchingDelete(Map<String, Object> map);

	void ExpiredPayUpate(Map<String, Object> map);

	List<String> findFieldCategory();

	void insertTrainerField(Map map);

	void deleteTrainerField(String mvoId);

	void trainerRankUp(String trainerId);

	
}
