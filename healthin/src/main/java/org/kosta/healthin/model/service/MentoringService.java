package org.kosta.healthin.model.service;

import java.util.Map;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MentoringVO;

public interface MentoringService {

	ListVO findByTrainerMatchingMemberList(String trainerId);

	ListVO findByUserMatchingMemberList(String userId);

	void insertMentoring(MentoringVO mentoring);

	void mentoringDetailHits(MentoringVO mentoring);

	int mentoringTotalCount(MentoringVO mentoring);

	ListVO mentoringDetail(Map map);

}
