package org.kosta.healthin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.TrainerPageDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.PayVO;
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
	public void userMatchingInsert(String userId,String trainerId){
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("trainerId", trainerId);
		dao.userMatchingInsert(map);
	}
	@Override
	public void payInsert(String userId,String trainerId,String period){
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("trainerId", trainerId);
		map.put("period", Integer.parseInt(period));
		map.put("price", Integer.parseInt(period)*10000);
		dao.payInsert(map);
	}
	@Override
	public ListVO userPtList(String id, String nowpage) {
		int totalCount=dao.userPtListCount(id);
		int pageNum=Integer.parseInt(nowpage);
		PagingBean pb=new PagingBean(totalCount, pageNum);
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("startRowNumber", pb.getStartRowNumber());
		map.put("endRowNumber", pb.getEndRowNumber());	
		map.put("id", id);
		ListVO listVO=new ListVO(dao.userPtList(map),pb);
		return listVO;
	}
	@Override
	public ListVO userPtMatchingList(String id, String pageNo) {
		int totalCount=dao.userPtMatchingListCount(id);
		int pageNum=Integer.parseInt(pageNo);
		PagingBean pb=new PagingBean(totalCount, pageNum);
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("startRowNumber", pb.getStartRowNumber());
		map.put("endRowNumber", pb.getEndRowNumber());	
		map.put("id", id);
		ListVO listVO=new ListVO(dao.userPtMatchingList(map),pb);
		return listVO;
	}
	@Override
	public PayVO userTrainerPay(String userId,String trainerId){
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("trainerId", trainerId);
		return dao.userTrainerPay(map);
	}
	@Override
	public void userDepositUpate(String userId,String trainerId){
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("trainerId", trainerId);
		dao.userDepositUpate(map);
	}
	@Override
	public int countExistMatching(String userId,String trainerId){
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("trainerId", trainerId);
		return dao.countExistMatching(map);
	}
	@Override
	public int countExistMatching1(String userId,String trainerId){
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("trainerId", trainerId);
		return dao.countExistMatching1(map);
	}
	@Override
	public int countExistFollowing(String userId,String trainerId){
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("trainerId", trainerId);
		return dao.countExistFollowing(map);
	}
	@Override
	public void trainerPayUpdate(String userId,String trainerId){
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("trainerId", trainerId);
		dao.trainerPayUpdate(map);
	}
	@Override
	public String getOneMatchingInfo(String userId,String trainerId) {
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("trainerId", trainerId);
		return dao.getOneMatchingInfo(map);
	}
	@Override
	public int ExpiredMatching(String userId,String trainerId){
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("trainerId", trainerId);
		return dao.ExpiredMatching(map);
	}
	@Override
	public void ExpiredPayUpate(String userId,String trainerId){
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("trainerId", trainerId);
		dao.ExpiredPayUpate(map);
	}
	@Override
	public void MatchingDelete(String userId, String trainerId) {
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("trainerId", trainerId);
		dao.MatchingDelete(map);
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
	public int getFollowerCount(String id){
		return dao.getFollowerCount(id);
		
	}
	@Override
	public void updateAcceptState(String trainerId, String userId) {
		Map<String, String> map=new HashMap<String,String>();
		map.put("TRAINERID", trainerId);
		map.put("USERID",userId);
		String state=dao.selectAcceptState(map);
		if(state.equals("N"))
			state="Y";
		else
			state="N";
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
	public Object getBothFollowList(String pageNo, String trainerid) {
		int totalCount=dao.getBothFollowTotalCount(trainerid);
		int pageNum=Integer.parseInt(pageNo);
		PagingBean pb=new PagingBean(totalCount, pageNum);
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("STARTROWNUM", pb.getStartRowNumber());
		map.put("ENDROWNUM", pb.getEndRowNumber());	
		map.put("TRAINERID", trainerid);
		ListVO listVO=new ListVO(dao.getBothFollowList(map),pb);
		return listVO;
		
	}
	
	@Override
	public List<String> findFieldCategory(){
		return dao.findFieldCategory();
	}
	@Override
	public void deleteTrainerField(String mvoId){
		dao.deleteTrainerField(mvoId);
	}
	@Override
	public void insertTrainerField(Map map){
		dao.insertTrainerField(map);
	}
	@Override
	public void trainerRankUp(String trainerId){
		dao.trainerRankUp(trainerId);
	}
	
}
