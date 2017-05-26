package org.kosta.healthin.model.dao;

import org.kosta.healthin.model.vo.MemberVO;

public interface MemberDAO {
	MemberVO login(String id,String password);


}
