package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

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

	List<VO> trainerSearchList(Map<String, Object> map);
	
	int getFollowerCount(String id);

	int getBothFollowTotalCount(String trainerid);

	List<VO> getBothFollowList(Map<String, Object> map);
	
}
