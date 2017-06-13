package org.kosta.healthin.model.service;

import java.util.Map;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PhysicalInfoVO;

public interface MyPageService {

	void insertUserPhysicalInfo(PhysicalInfoVO pivo);

	ListVO selectUserPhysicalInfo(Map map);

	int graphContentCount(String user_id);

	int getFollowingTotalCount(String userid);

	ListVO getFollowingList(String pageNo, String userid);

	void unfollow(String trainerId, String userId);

	Object getmypageBothFollowList(String pageNo, String userId);



}
