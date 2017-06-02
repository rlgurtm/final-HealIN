package org.kosta.healthin.model.dao;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.PhysicalInfoVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAOImpl implements MyPageDAO {
	@Resource
	private SqlSessionTemplate template;
		@Override
		public void insertUserPhysicalInfo(PhysicalInfoVO pivo){
		template.insert("mypage.insertUserPhysicalInfo", pivo);
	}
		@Override
		public ListVO selectUserPhyicalInfo(MemberVO mvo){
			ListVO listVO = new ListVO();
			listVO.setLVO(template.selectList("mypage.selectUserPhyicalInfo",mvo));
			System.out.println(listVO);
		return listVO;
		}
}