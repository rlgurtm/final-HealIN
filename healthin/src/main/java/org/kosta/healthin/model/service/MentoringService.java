package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.ListVO;

public interface MentoringService {

	ListVO findByTrainerMatchingMemberList(String trainerId);

	ListVO findByUserMatchingMemberList(String userId);

}
