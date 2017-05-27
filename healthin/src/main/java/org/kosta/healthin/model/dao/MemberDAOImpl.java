package org.kosta.healthin.model.dao;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

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
	public void registerStep1(MemberVO vo) {
		// TODO Auto-generated method stub
		int result= sqlSessionTemplate.insert("member.registerStep1", vo);
		
		if(vo.getIstrainer() == "n"){
			registerStudent(vo);
		}else{
			registerTrainer(vo);
		}
	}

	@Override
	public MemberVO registerStudent(MemberVO vo) {
		// TODO Auto-generated method stub
		int result= sqlSessionTemplate.insert("member.registerStudent", vo);
		return vo;
	}

	@Override
	public MemberVO registerTrainer(MemberVO vo) {
		// TODO Auto-generated method stub
		int result= sqlSessionTemplate.insert("member.registerTrainer", vo);
		return vo;
	}



}
