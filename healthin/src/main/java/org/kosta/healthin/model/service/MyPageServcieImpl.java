package org.kosta.healthin.model.service;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.MyPageDAO;
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
		public String selectUserPhysicalInfo(PhysicalInfoVO pivo){
			return mydao.selectUserPhyicalInfo(pivo);
		}
}
