package org.kosta.healthin.model.service;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.MemberDAO;
import org.kosta.healthin.model.vo.MemberVO;
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
}
