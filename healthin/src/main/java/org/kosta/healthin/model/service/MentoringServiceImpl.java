package org.kosta.healthin.model.service;

import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.MentoringDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MentoringVO;
import org.springframework.stereotype.Service;

@Service
public class MentoringServiceImpl implements MentoringService {
	@Resource
	private MentoringDAO mentoringDAO;
	
	@Override
	public ListVO findByTrainerMatchingMemberList(String trainerId){
		return mentoringDAO.findByTrainerMatchingMemberList(trainerId);
	}
	@Override
	public ListVO findByUserMatchingMemberList(String userId){
		return mentoringDAO.findByUserMatchingMemberList(userId);
	}
	@Override
	public void mentoringDetailHits(MentoringVO mentoring){
		mentoringDAO.mentoringDetailHits(mentoring);
	}
	@Override
	public int mentoringTotalCount(MentoringVO mentoring){
		return mentoringDAO.mentoringTotalCount(mentoring);
	}
	@Override
	public ListVO mentoringDetail(Map map){
		return mentoringDAO.mentoringDetail(map);
	}
	@Override
	public void insertMentoring(MentoringVO mentoring){
		mentoringDAO.insertMentoring(mentoring);
	}
}
