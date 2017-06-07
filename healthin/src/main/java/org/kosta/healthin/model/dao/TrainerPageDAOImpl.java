package org.kosta.healthin.model.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TrainerPageDAOImpl implements TrainerPageDAO {
	@Resource
	private SqlSessionTemplate template;
}
