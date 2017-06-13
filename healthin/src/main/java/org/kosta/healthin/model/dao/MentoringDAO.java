package org.kosta.healthin.model.dao;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.MentoringVO;

public interface MentoringDAO {

	ListVO findByTrainerMatchingMemberList(String trainerId);

	ListVO findByUserMatchingMemberList(String userId);

	ListVO mentoringDetail(MentoringVO mentoring);

	void insertMentoring(MentoringVO mentoring);

	void mentoringDetailHits(MentoringVO mentoring);

}
