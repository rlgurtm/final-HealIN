package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.VO;

public interface TrainerDAO {

	int getTrainerTotalCount();

	List<VO> getTrainerList(PagingBean pb);

	List<VO> trainerListOrder(Map<String, Object> map);

}
