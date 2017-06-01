package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.PhysicalInfoVO;

public interface MyPageService {

	void insertUserPhysicalInfo(PhysicalInfoVO pivo);

	ListVO selectUserPhysicalInfo(MemberVO mvo);

}
