package org.kosta.healthin.model.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MentoringVO;
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
	@Override
	public void mentoringDetailHits(MentoringVO mentoring){
		template.update("mentoring.mentoringDetailHits",mentoring);
	}
	@Override
	public int mentoringTotalCount(MentoringVO mentoring){
		return template.selectOne("mentoring.mentoringTotalCount",mentoring);
	}
	@Override
	public ListVO mentoringDetail(Map map){
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("mentoring.mentoringDetail",map));
		return listVO;
	}
	@Override
	public void insertMentoring(MentoringVO mentoring){
		template.insert("mentoring.insertMentoring",mentoring);
	}
}
