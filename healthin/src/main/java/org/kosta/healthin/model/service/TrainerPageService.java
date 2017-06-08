package org.kosta.healthin.model.service;

import java.util.List;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.VO;

public interface TrainerPageService {

	List<VO> trainerPtList(String id);

	ListVO getFollowerList(String pageNo, String id);


}
