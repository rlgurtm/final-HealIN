package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.PhysicalInfoVO;

public interface MyPageService {

	void insertUserPhysicalInfo(PhysicalInfoVO pivo);

	String selectUserPhysicalInfo(PhysicalInfoVO pivo);

}
