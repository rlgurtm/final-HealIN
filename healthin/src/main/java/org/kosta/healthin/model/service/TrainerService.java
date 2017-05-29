package org.kosta.healthin.model.service;

import java.util.List;

import org.kosta.healthin.model.vo.VO;

public interface TrainerService {

	List<VO> getTrainerList(String pageNo);

}
