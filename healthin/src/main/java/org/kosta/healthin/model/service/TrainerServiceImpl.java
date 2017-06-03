package org.kosta.healthin.model.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.TrainerDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TrainerVO;
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

	@Override
	public Object trainerListOrder(String order, String pageNo) {
		int totalCount=dao.getTrainerTotalCount();
		int pageNum=Integer.parseInt(pageNo);
		ListVO listVO=null;
		PagingBean pb=new PagingBean(totalCount, pageNum);
			Map<String, Object> map=new HashMap<String,Object>();
			map.put("STARTROWNUM", pb.getStartRowNumber());
			map.put("ENDROWNUM", pb.getEndRowNumber());
		if(order.equals("name"))
			listVO=new ListVO(dao.trainerOrderName(map),pb);
		else if(order.equals("rate"))
			listVO=new ListVO(dao.trainerOrderRate(map),pb);
		
		return listVO;
	}

	@Override
	public TrainerVO trainerDetail(String trainerId) {
		return dao.trainerDetail(trainerId);
	}

	@Override
	public int trainerfollowingCount(String trainerId) {
		return dao.trainerfollowingCount(trainerId);
	}

	@Override
	public int followingViewCount(String memId) {
		return dao.followingViewCount(memId);
	}

}
