package org.kosta.healthin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.TrainerDAO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.VO;
import org.springframework.stereotype.Service;

@Service
public class TrainerServiceImpl implements TrainerService {
	@Resource
	private TrainerDAO dao;
	PagingBean pagingBean=null;

	@Override
	public List<VO> getTrainerList(String pageNo) {
		int totalCount=dao.getTrainerTotalCount();
		pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));
		int start=pagingBean.getStartRowNumber();
		int end=pagingBean.getEndRowNumber();
		Map<String, Integer> map=new HashMap<String,Integer>();
		map.put("STATRNUM", start);
		map.put("ENDNUM", end);
		
		return dao.getTrainerList(map);
	}

}
