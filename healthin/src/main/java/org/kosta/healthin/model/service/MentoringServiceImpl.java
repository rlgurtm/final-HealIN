package org.kosta.healthin.model.service;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.MentoringDAO;
import org.kosta.healthin.model.vo.ListVO;
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
}
