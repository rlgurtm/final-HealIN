package org.kosta.healthin.model.service;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.MemberDAO;
import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.TrainerVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;

	@Override
	public MemberVO login(String id, String password) {
		MemberVO vo = memberDAO.login(id, password);
		return vo;
	}

	@Override
	public void modify(MemberVO vo) {
		memberDAO.modify(vo);
	}

	@Override
	public void registerStep3(MemberVO vo) {
		memberDAO.registerStep3(vo) ;
	}
	@Override
	public MemberVO registerTrainer(MemberVO vo) {
		return memberDAO.registerTrainer(vo) ;
	}

	@Override
	public MemberVO registerStudent(MemberVO vo) {
		return memberDAO.registerStudent(vo) ;
	}

	@Override
	public MemberVO modifyTrainer(TrainerVO tvo) {
		return memberDAO.modifyTrainer(tvo) ;
	}

	@Override
	public MemberVO modifyStudent(MemberVO vo) {
		return memberDAO.modifyStudent(vo) ;
	}

	@Override
	public TrainerVO trainerInfo(String id) {
		TrainerVO tvo = memberDAO.trainerInfo(id);
		return tvo;
	}

	@Override
	public String findById(String id) {
		String result = memberDAO.findById(id) ;
		return result ;
	}

	@Override
	public String findByNickname(String nickname) {
		String result = memberDAO.findByNickname(nickname) ;
		return result ;
	}

	@Override
	public MemberVO findByIdLostPassword(String id) {
		MemberVO mvo = memberDAO.findByIdLostPassword(id) ;
		return mvo;
	}

	@Override
	public MemberVO findPasswordByPhone(String name, String smsNum) {
		MemberVO vo = memberDAO.findPasswordByPhone(name,smsNum);
		return vo;
	}

	@Override
	public MemberVO findPasswordByMail(String otherMailName, String otherMail) {
		MemberVO vo = memberDAO.findPasswordByMail(otherMailName,otherMail);
		return vo;
	}

	@Override
	public String modifyPassword(String id, String newPassword) {
		memberDAO.modifyPassword(id,newPassword);
		return null;
	}

	@Override
	public String idSearchByNumResult(String smsName, String smsNum) {
		String id =memberDAO.idSearchByNumResult(smsName,smsNum);
		return id;
	}

	@Override
	public String idSearchByMailResult(String otherName, String otherMail) {
		String id =memberDAO.idSearchByMailResult(otherName,otherMail);
		return id;
	}

	@Override
	public void withdraw(String id) {
		memberDAO.withdraw(id);
	}

}
