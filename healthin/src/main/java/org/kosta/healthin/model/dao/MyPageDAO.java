package org.kosta.healthin.model.dao;

import org.kosta.healthin.model.vo.PhysicalInfoVO;

public interface MyPageDAO {


	void insertUserPhysicalInfo(PhysicalInfoVO pivo);

	String selectUserPhyicalInfo(PhysicalInfoVO pivo);
	
}
