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
		int result= sqlSessionTemplate.insert("member.registerAll", vo);
	}

	@Override
	public MemberVO registerStudent(MemberVO vo) {
		int result= sqlSessionTemplate.insert("member.registerStudent", vo);
		return vo;
	}

	@Override
	public MemberVO registerTrainer(MemberVO vo) {
		sqlSessionTemplate.insert("member.registerTrainer", vo);
		return vo;
	}

	@Override
	public MemberVO login(String id, String password) {
		Map<String, String>map = new HashMap<String,String>();
		map.put("id", id);
		map.put("password", password);
		MemberVO vo  = sqlSessionTemplate.selectOne("member.login", map);
		return vo;
	}

	@Override
	public void modify(MemberVO vo) {
		sqlSessionTemplate.update("member.modify", vo);
	}
	
	@Override
	public MemberVO modifyStudent(MemberVO vo) {
		sqlSessionTemplate.update("member.modifyStudent", vo);
		return vo;
	}
	

	@Override
	public TrainerVO trainerInfo(String id) {
		TrainerVO tvo =
		sqlSessionTemplate.selectOne("member.trainerInfo", id);
		return tvo;
	}

	@Override
	public MemberVO modifyTrainer(TrainerVO tvo) {
		sqlSessionTemplate.update("member.modifyTrainer", tvo);
		return tvo;
	}

	@Override
	public String findById(String id) {
		String result = sqlSessionTemplate.selectOne("member.findById", id);
		return result;
	}

	@Override
	public String findByNickname(String nickname) {
		String result = sqlSessionTemplate.selectOne("member.findByNickname", nickname);
		return result;
	}


	
}
