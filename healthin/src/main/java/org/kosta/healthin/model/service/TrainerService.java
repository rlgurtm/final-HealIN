package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.ListVO;

public interface TrainerService {

	ListVO getTrainerList(String pageNo);

	Object trainerListOrder(String order, String pageNo);

}
