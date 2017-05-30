package org.kosta.healthin.model.service;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.TrainerDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.springframework.stereotype.Service;

@Service
public class TrainerServiceImpl implements TrainerService {
	@Resource
	private TrainerDAO dao;

	@Override
	public ListVO getTrainerList(String pageNo){
		int totalCount=dao.getTrainerTotalCount();
		int pageNum=Integer.parseInt(pageNo);
		PagingBean pb=new PagingBean(totalCount, pageNum);
		ListVO listVO=new ListVO(dao.getTrainerList(pb),pb);
		return listVO;
	}

}
