package org.kosta.healthin.model.service;

import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.MyPageDAO;
import org.kosta.healthin.model.vo.ListVO;
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
	@Override
	public void bmiListDelete(String physical_no){
		mydao.bmiListDelete(physical_no);
	}
	
}
