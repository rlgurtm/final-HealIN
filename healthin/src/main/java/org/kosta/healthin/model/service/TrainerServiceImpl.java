package org.kosta.healthin.model.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.TrainerDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.PagingBeanForRating;
import org.kosta.healthin.model.vo.RateVO;
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
		
		int pageNum=Integer.parseInt(pageNo);
		ListVO listVO=null;
		
		if(order.equals("name")){
			int totalCount=dao.getTrainerTotalCount();
			PagingBean pb=new PagingBean(totalCount, pageNum);
			Map<String, Object> map=new HashMap<String,Object>();
			map.put("STARTROWNUM", pb.getStartRowNumber());
			map.put("ENDROWNUM", pb.getEndRowNumber());	
			listVO=new ListVO(dao.trainerOrderName(map),pb);
		}
		else if(order.equals("following")){
			int totalCount=dao.getTrainerfollowingTotalCount();
			PagingBean pb=new PagingBean(totalCount, pageNum);
			Map<String, Object> map=new HashMap<String,Object>();
			map.put("STARTROWNUM", pb.getStartRowNumber());
			map.put("ENDROWNUM", pb.getEndRowNumber());	
			listVO=new ListVO(dao.trainerOrderFollowing(map),pb);
		}
		
		
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
	public String selectfollowState(String memId, String trainerId) {
		Map<String, String> map=new HashMap<String,String>();
		map.put("MEMID", memId);
		map.put("TRAINERID", trainerId);
		return dao.selectfollowState(map);
	}

	@Override
	public void updatefollowState(String memId, String trainerId, String state) {
		if(state.equals("Y"))
			state="N";
		else if(state.equals("N"))
			state="Y";
		Map<String, String> map=new HashMap<String,String>();
		map.put("MEMID", memId);
		map.put("TRAINERID", trainerId);
		map.put("STATE", state);
		dao.updatefollowState(map);
	}

	@Override
	public void insertfollowtrainer(String memId, String trainerId) {
		Map<String, String> map=new HashMap<String,String>();
		map.put("MEMID", memId);
		map.put("TRAINERID", trainerId);
		dao.insertfollowtrainer(map);
	}

	@Override
	public ListVO getTrainerLoc(String pageNo, String local) {
		int totalCount=dao.getTrainerLocTotalCount(local);
		int pageNum=Integer.parseInt(pageNo);
		PagingBean pb=new PagingBean(totalCount, pageNum);
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("STARTROWNUM", pb.getStartRowNumber());
		map.put("ENDROWNUM", pb.getEndRowNumber());	
		map.put("LOC", local);
		ListVO listVO=new ListVO(dao.getTrainerLoc(map),pb);
		return listVO;
	}

	@Override
	public ListVO getSearchTrainer(String pageNo, String searchWord) {
		int totalCount=dao.getTrainerLocTotalCount(searchWord);
		int pageNum=Integer.parseInt(pageNo);
		PagingBean pb=new PagingBean(totalCount, pageNum);
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("STARTROWNUM", pb.getStartRowNumber());
		map.put("ENDROWNUM", pb.getEndRowNumber());	
		map.put("WORD", searchWord);
		ListVO listVO=new ListVO(dao.getSearchTrainer(map),pb);
		return listVO;
	}

	@Override
	public ListVO getTrainerRate(String id, String pageNo) {
		int totalCount = dao.getTotalRatingCount(id);
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBeanForRating(totalCount);
		} else {
			pagingBean = new PagingBeanForRating(totalCount, Integer.parseInt(pageNo));
		}
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("STARTROWNUM", pagingBean.getStartRowNumber());
		map.put("ENDROWNUM", pagingBean.getEndRowNumber());	
		ListVO listVO = new ListVO(dao.getTrainerRate(map), pagingBean);
		return listVO;
	}

	@Override
	public double getSumOfRating(String id) {
		return dao.getSumOfRating(id);
	}

	@Override
	public int getTotalRatingCountForAvgRate(String id) {
		return dao.getTotalRatingCount(id);
	}

	@Override
	public void updateRate(Map<String, Object> map) {
		dao.updateRate(map);
	}

	@Override
	public RateVO getRatingByRateNo(int rateNo) {
		return dao.getRatingByRateNo(rateNo);
	}

	@Override
	public void deleteRate(int rateNo) {
		dao.deleteRate(rateNo);
	}

}
