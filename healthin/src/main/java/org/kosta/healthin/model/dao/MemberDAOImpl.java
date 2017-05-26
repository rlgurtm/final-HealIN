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
		// TODO Auto-generated method stub
		Map<String, String>map = new HashMap<String,String>();
		map.put("id", id);
		map.put("password", password);
		MemberVO vo  = sqlSessionTemplate.selectOne("member.login", map);
		return vo;
	}

}
