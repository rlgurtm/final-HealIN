package org.kosta.healthin.model.dao;

import org.kosta.healthin.model.vo.ListVO;

public interface MentoringDAO {

	ListVO findByTrainerMatchingMemberList(String trainerId);

	ListVO findByUserMatchingMemberList(String userId);

}
