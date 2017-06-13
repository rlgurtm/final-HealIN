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
	public int trainerPtListCount(String id){
		return dao.trainerPtListCount(id);
	}
	@Override
	public int trainerMatchingListCount(String id){
		return dao.trainerMatchingListCount(id);
	}
	@Override
	public void trainerMatchingUpdate(String userId,String trainerId){
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("trainerId", trainerId);
		dao.trainerMatcingUpdate(map);
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
	@Override
	public void updateAcceptState(String trainerId, String userId) {
		
		Map<String, String> map=new HashMap<String,String>();
		map.put("TRAINERID", trainerId);
		map.put("USERID",userId);
		String state=dao.selectAcceptState(map);
		map.put("STATE", state);
		dao.updateAcceptState(map);
	}
	@Override
	public ListVO trainerSearchList(String nowpage, String searchWord) {
		//검색 결과 카운트 해라....
		int totalCount=dao.trainerPtListCount(searchWord);
		int pageNum=Integer.parseInt(nowpage);
		PagingBean pb=new PagingBean(totalCount, pageNum);
		
		
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("startRowNumber", pb.getStartRowNumber());
		map.put("endRowNumber", pb.getEndRowNumber());	
		map.put("searchWord", searchWord);  //trainerPtList
		ListVO listVO=new ListVO(dao.trainerSearchList(map),pb);
		System.out.println("listVO"+listVO);
		return listVO;
	}
	
}
