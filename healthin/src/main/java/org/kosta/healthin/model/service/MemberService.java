package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.MemberVO;

public interface MemberService {
	MemberVO login(String id, String password);


}
