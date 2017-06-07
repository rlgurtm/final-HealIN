package org.kosta.healthin.model.service;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.MyPageDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.PhysicalInfoVO;
import org.springframework.stereotype.Service;

@Service
public class MyPageServcieImpl implements MyPageService{
	@Resource
	private MyPageDAO mydao;
		@Override
		public void insertUserPhysicalInfo(PhysicalInfoVO pivo){
			mydao.insertUserPhysicalInfo(pivo);
		}
		@Override
		public ListVO selectUserPhysicalInfo(MemberVO mvo){
			return mydao.selectUserPhyicalInfo(mvo);
		}
		@Override
		public int graphContentCount(){
			return mydao.graphContentCount();
		}
		
		@Override
		public PhysicalInfoVO graphPagingBean(PagingBean pb){
			return mydao.graphPagingBean(pb);
		}
}
