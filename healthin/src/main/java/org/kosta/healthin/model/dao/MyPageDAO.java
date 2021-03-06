package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.PhysicalInfoVO;

public interface MyPageDAO {


	void insertUserPhysicalInfo(PhysicalInfoVO pivo);

	List<PhysicalInfoVO> graphPagingBean(PagingBean pb);

	ListVO selectUserPhyicalInfo(Map map);

	int graphContentCount(String user_id);

	void bmiListDelete(String physical_no);
	int getFollowingTotalCount(String userid);

	List<MemberVO> getFollowingList(Map<String, Object> map);

	void unfollow(Map<String, String> map);

	int getmypageBothFollowTotalCount(String userId);

	List<MemberVO> getmypageBothFollowList(Map<String, Object> map);

	PhysicalInfoVO selectListToday(Map map);

	void bmiListUpdate(PhysicalInfoVO pivo);
	
}
