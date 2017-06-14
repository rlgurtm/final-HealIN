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
	TrainerVO trainerInfo(String id);
	MemberVO modifyTrainer(TrainerVO tvo);
	String findById(String id);
	String findByNickname(String nickname);
	MemberVO findByIdLostPassword(String id);
	MemberVO findPasswordByPhone(String name, String smsNum);
	MemberVO findPasswordByMail(String otherMailName, String otherMail);
	String modifyPassword(String id, String newPassword);
	String idSearchByNumResult(String smsName, String smsNum);
	String idSearchByMailResult(String otherName, String otherMail);
	void withdraw(String id);
}
