package org.kosta.healthin.model.dao;

import org.kosta.healthin.model.vo.MemberVO;

public interface MemberDAO {
	MemberVO login(String id,String password);

	void modify(MemberVO vo);

	void registerStep1(MemberVO vo);
	MemberVO registerStudent(MemberVO vo);
	MemberVO registerTrainer(MemberVO vo);

}
