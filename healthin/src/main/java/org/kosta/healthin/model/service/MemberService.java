package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.MemberVO;

public interface MemberService {
	MemberVO login(String id, String password);

	void modify(MemberVO vo);

	void registerStep3(MemberVO vo);
	MemberVO registerTrainer(MemberVO vo);
	MemberVO registerStudent(MemberVO vo);
}
