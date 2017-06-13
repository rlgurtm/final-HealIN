package org.kosta.healthin.model.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.MyPageDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.PhysicalInfoVO;
import org.springframework.stereotype.Service;

@Service
public class MyPageServcieImpl implements MyPageService {
	@Resource
	private MyPageDAO mydao;

	@Override
	public void insertUserPhysicalInfo(PhysicalInfoVO pivo) {
		mydao.insertUserPhysicalInfo(pivo);
	}

	@Override
	public ListVO selectUserPhysicalInfo(Map map) {
		return mydao.selectUserPhyicalInfo(map);
	}

	@Override
	public int graphContentCount(String user_id) {
		return  mydao.graphContentCount(user_id);
	}
	/*@Override
	public PhysicalInfoVcO graphContentCount(String pageNo) {
		int totalCount = mydao.graphContentCount();
		PagingBean pb = null;
		if (pageNo == null){
			pb = new PagingBean(totalCount);
		}else{
			pb = new PagingBean(totalCount,Integer.parseInt(pageNo));
		}
		return new PhysicalInfoVO(mydao.graphPagingBean(pb),pb);
	}*/

	@Override
	public int getFollowingTotalCount(String userid) {
		return mydao.getFollowingTotalCount(userid);
	}

	@Override
	public ListVO getFollowingList(String pageNo, String userid) {
		int totalCount=mydao.getFollowingTotalCount(userid);
		int pageNum=Integer.parseInt(pageNo);
		PagingBean pb=new PagingBean(totalCount, pageNum);
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("STARTROWNUM", pb.getStartRowNumber());
		map.put("ENDROWNUM", pb.getEndRowNumber());	
		map.put("USERID", userid);
		ListVO listVO=new ListVO(mydao.getFollowingList(map),pb);
		return listVO;
	}

	@Override
	public void unfollow(String trainerId, String userId) {
		Map<String, String> map=new HashMap<String,String>();
		map.put("TRAINERID", trainerId);
		map.put("USERID",userId);
		mydao.unfollow(map);
	}

	@Override
	public Object getmypageBothFollowList(String pageNo, String userId) {
		int totalCount=mydao.getmypageBothFollowTotalCount(userId);
		int pageNum=Integer.parseInt(pageNo);
		PagingBean pb=new PagingBean(totalCount, pageNum);
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("STARTROWNUM", pb.getStartRowNumber());
		map.put("ENDROWNUM", pb.getEndRowNumber());	
		map.put("USERID", userId);
		ListVO listVO=new ListVO(mydao.getmypageBothFollowList(map),pb);
		return listVO;
	}

}
