package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.TrainerVO;

public interface MemberService {
	void registerStep3(MemberVO vo);
	MemberVO registerTrainer(MemberVO vo);
	MemberVO registerStudent(MemberVO vo);
	
	MemberVO login(String id, String password);

	void modify(MemberVO vo);
	MemberVO modifyStudent(MemberVO vo);
	MemberVO modifyTrainer(TrainerVO tvo);
}
