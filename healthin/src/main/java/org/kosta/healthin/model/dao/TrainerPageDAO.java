package org.kosta.healthin.model.dao;

import java.util.List;

import org.kosta.healthin.model.vo.VO;

public interface TrainerPageDAO {

	List<VO> trainerPtList(String id);

}