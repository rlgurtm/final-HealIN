package org.kosta.healthin.model.dao;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.TrainerVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void registerStep3(MemberVO vo) {
		// TODO Auto-generated method stub
		int result= sqlSessionTemplate.insert("member.registerAll", vo);
	}

	@Override
	public MemberVO registerStudent(MemberVO vo) {
		int result= sqlSessionTemplate.insert("member.registerStudent", vo);
		return vo;
	}

	@Override
	public MemberVO registerTrainer(MemberVO vo) {
		int result= sqlSessionTemplate.insert("member.registerTrainer", vo);
		return vo;
	}

	@Override
	public MemberVO login(String id, String password) {
		Map<String, String>map = new HashMap<String,String>();
		map.put("id", id);
		map.put("password", password);
		System.out.println(map);
		MemberVO vo  = sqlSessionTemplate.selectOne("member.login", map);
		return vo;
	}

	@Override
	public void modify(MemberVO vo) {
		sqlSessionTemplate.update("member.modify", vo);
	}

	@Override
	public MemberVO modifyTrainer(TrainerVO tvo) {
		int result= sqlSessionTemplate.update("member.modifyTrainer", tvo);
		return tvo;
	}

	@Override
	public MemberVO modifyStudent(MemberVO vo) {
		int result= sqlSessionTemplate.update("member.modifyStudent", vo);
		return vo;
	}
	
}
