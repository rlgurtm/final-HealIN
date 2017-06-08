package org.kosta.healthin.model.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MentoringDAOImpl implements MentoringDAO{
	@Resource
	private SqlSessionTemplate template;
	
}
