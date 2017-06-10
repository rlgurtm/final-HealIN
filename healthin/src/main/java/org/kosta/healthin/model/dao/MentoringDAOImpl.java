package org.kosta.healthin.model.dao;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.ListVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MentoringDAOImpl implements MentoringDAO{
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public ListVO findByTrainerMatchingMemberList(String trainerId){
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("mentoring.findByTrainerMatchingMemberList",trainerId));
		return listVO;
	}
	@Override
	public ListVO findByUserMatchingMemberList(String userId){
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("mentoring.findByUserMatchingMemberList",userId));
		return listVO;
	}
}
