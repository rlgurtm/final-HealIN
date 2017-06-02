package org.kosta.healthin.model.dao;

import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.TrainerVO;

public interface MemberDAO {
	void registerStep3(MemberVO vo);
	MemberVO registerStudent(MemberVO vo);
	MemberVO registerTrainer(MemberVO vo);
	
	MemberVO login(String id,String password);

	void modify(MemberVO vo);
	MemberVO modifyStudent(MemberVO vo);
	TrainerVO trainerInfo(String id);
	MemberVO modifyTrainer(TrainerVO tvo);
	String findById(String id);
	String findByNickname(String nickname);

}
