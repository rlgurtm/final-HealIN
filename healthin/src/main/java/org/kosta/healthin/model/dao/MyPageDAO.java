package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.PhysicalInfoVO;
import org.kosta.healthin.model.vo.VO;

public interface MyPageDAO {


	void insertUserPhysicalInfo(PhysicalInfoVO pivo);

	List<PhysicalInfoVO> graphPagingBean(PagingBean pb);

	ListVO selectUserPhyicalInfo(Map map);

	int graphContentCount(String user_id);

	int getFollowingTotalCount(String userid);

	List<VO> getFollowingList(Map<String, Object> map);

	void unfollow(Map<String, String> map);

	int getmypageBothFollowTotalCount(String userId);

	List<VO> getmypageBothFollowList(Map<String, Object> map);
	
}
