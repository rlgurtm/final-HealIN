package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.PayVO;
import org.kosta.healthin.model.vo.VO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TrainerPageDAOImpl implements TrainerPageDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public List<VO> trainerPtList(Map<String, Object> map){
		return template.selectList("trainerpage.trainerPtList",map);
	}
	
	@Override
	public List<VO> trainerMatchingList(Map<String, Object> map){
		return template.selectList("trainerpage.trainerMatchingList",map);
	}
	
	@Override
	public int trainerPtListCount(String id){
		return template.selectOne("trainerpage.trainerPtListCount",id);
	}
	@Override
	public int trainerMatchingListCount(String id){
		return template.selectOne("trainerpage.trainerMatchingListCount",id);
	}
	@Override
	public void trainerMatcingUpdate(Map<String,Object> map){
		template.update("trainerpage.trainerMatcingUpdate",map);
	}
	@Override
	public void userMatchingInsert(Map<String, Object> map){
		template.insert("trainerpage.userMatchingInsert",map);
	}
	@Override
	public void payInsert(Map<String, Object> map){
		template.insert("trainerpage.payInsert",map);
	}
	@Override
	public List<VO> userPtList(Map<String, Object> map){
		return template.selectList("trainerpage.userPtList",map);
	}
	@Override
	public int userPtListCount(String id){
		return template.selectOne("trainerpage.userPtListCount",id);
	}
	@Override
	public PayVO userTrainerPay(Map<String, Object> map){
		return template.selectOne("trainerpage.userTrainerPay",map);
	}
	@Override
	public void userDepositUpate(Map<String, Object> map){
		template.update("trainerpage.userDepositUpate",map);
	}
	@Override
	public int getFollowerTotalCount(String id) {
		return template.selectOne("trainerpage.getFollowerTotalCount",id);
	}
	@Override
	public int countExistMatching(Map<String, Object> map){
		return template.selectOne("trainerpage.countExistMatching",map);
	}
	
	@Override
	public int getFollowerCount(String id) {
		return template.selectOne("trainerpage.getFollowerCount",id);
	}

	@Override
	public List<VO> getFollowerList(Map<String, Object> map) {
		return template.selectList("trainerpage.getFollowerList",map);
	}
	
	@Override
	public String selectAcceptState(Map<String, String> map) {
		return template.selectOne("trainerpage.selectAcceptState",map);
	}
	
	@Override
	public void updateAcceptState(Map<String, String> map) {
		template.update("trainerpage.updateAcceptState",map);
	}

	@Override
	public int getBothFollowTotalCount(String trainerid) {
		return template.selectOne("trainerpage.getBothFollowTotalCount",trainerid);
	}

	@Override
	public List<VO> getBothFollowList(Map<String, Object> map) {
		return template.selectList("trainerpage.getBothFollowList",map);
	}

}
