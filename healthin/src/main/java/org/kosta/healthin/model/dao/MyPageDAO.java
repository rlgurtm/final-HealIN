package org.kosta.healthin.model.dao;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.PhysicalInfoVO;

public interface MyPageDAO {


	void insertUserPhysicalInfo(PhysicalInfoVO pivo);

	ListVO selectUserPhyicalInfo(MemberVO mvo);
	
}
