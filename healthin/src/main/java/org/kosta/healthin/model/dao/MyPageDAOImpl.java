package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.PhysicalInfoVO;
import org.kosta.healthin.model.vo.VO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAOImpl implements MyPageDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public void insertUserPhysicalInfo(PhysicalInfoVO pivo) {
		template.insert("mypage.insertUserPhysicalInfo", pivo);
	}

	@Override
	public ListVO selectUserPhyicalInfo(Map map) {
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("mypage.selectUserPhyicalInfo", map));
		System.out.println(listVO);
		return listVO;
	}
	@Override
	public int graphContentCount(String user_id){
		return template.selectOne("mypage.graphContentCount",user_id);
	}

	@Override
		public List<PhysicalInfoVO> graphPagingBean(PagingBean pb){
		return  template.selectList("mypage.graphPagingBean",pb);
			/*PhysicalInfoVO pivo=new PhysicalInfoVO();
			pivo.setLvo((ListVO) template.selectList("mypage.totalCountList",pb));
			return pivo;*/
				}

	@Override
	public int getFollowingTotalCount(String userid) {
		return template.selectOne("mypage.getFollowingTotalCount",userid);
	}

	@Override
	public List<VO> getFollowingList(Map<String, Object> map) {
		return template.selectList("mypage.getFollowingList",map);
	}

	@Override
	public void unfollow(Map<String, String> map) {
		template.update("mypage.unfollow",map);
	}

	@Override
	public int getmypageBothFollowTotalCount(String userId) {
		return template.selectOne("mypage.getmypageBothFollowTotalCount",userId);
	}

	@Override
	public List<VO> getmypageBothFollowList(Map<String, Object> map) {
		return template.selectList("mypage.getmypageBothFollowList",map);
	}
}
