package org.kosta.healthin.model.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.TrainerPageDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.springframework.stereotype.Service;

@Service
public class TrainerPageServiceImpl implements TrainerPageService{
	@Resource
	private TrainerPageDAO dao;
	
	@Override
	public ListVO trainerPtList(String id,String pageNo){
		int totalCount=dao.trainerPtListCount(id);
		int pageNum=Integer.parseInt(pageNo);
		PagingBean pb=new PagingBean(totalCount, pageNum);
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("startRowNumber", pb.getStartRowNumber());
		map.put("endRowNumber", pb.getEndRowNumber());	
		map.put("id", id);
		ListVO listVO=new ListVO(dao.trainerPtList(map),pb);
		return listVO;
	}
	@Override
	public ListVO trainerMatchingList(String id,String pageNo) {
		int totalCount=dao.trainerMatchingListCount(id);
		int pageNum=Integer.parseInt(pageNo);
		PagingBean pb=new PagingBean(totalCount, pageNum);
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("startRowNumber", pb.getStartRowNumber());
		map.put("endRowNumber", pb.getEndRowNumber());	
		map.put("id", id);
		ListVO listVO=new ListVO(dao.trainerMatchingList(map),pb);
		return listVO;
	}
	
	@Override
	public ListVO getFollowerList(String pageNo, String id) {
		int totalCount=dao.getFollowerTotalCount(id);
		int pageNum=Integer.parseInt(pageNo);
		PagingBean pb=new PagingBean(totalCount, pageNum);
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("STARTROWNUM", pb.getStartRowNumber());
		map.put("ENDROWNUM", pb.getEndRowNumber());	
		map.put("ID", id);
		ListVO listVO=new ListVO(dao.getFollowerList(map),pb);
		return listVO;
	}
	@Override
	public int getFollowerList(String id){
		return dao.getFollowerTotalCount(id);
		
	}
	
}
