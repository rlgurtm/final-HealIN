package org.kosta.healthin.model.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TrainerVideoVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TrainerVideoDAOImpl implements TrainerVideoDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public int totalCountVideo(){
		return template.selectOne("trainervideo.totalCountVideo");
	}
	@Override
	public ListVO trainerVideoList(PagingBean pb){
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("trainervideo.trainerVideoList",pb));
		//System.out.println(listVO);
		return listVO;
	}
	
	@Override
	public void trainerVideoShowHits(int videoNo){
		template.update("trainervideo.trainerVideoShowHits",videoNo);
	}
	@Override
	public TrainerVideoVO trainerVideoShow(int videoNo){
		return template.selectOne("trainervideo.trainerVideoShow",videoNo);
	}
	
	@Override
	public void trainerVideoWrite(TrainerVideoVO trainerVideoVO){
		template.insert("trainervideo.trainerVideoWrite",trainerVideoVO);
	}
	
	@Override
	public void trainerVideoUpdateNewFile(TrainerVideoVO trainerVideoVO){
		template.update("trainervideo.trainerVideoUpdateNewFile",trainerVideoVO);
	}
	
	@Override
	public void trainerVideoUpdate(TrainerVideoVO trainerVideoVO){
		template.update("trainervideo.trainerVideoUpdate",trainerVideoVO);
	}
	
	@Override
	public void trainerVideoDelete(int videoNo){
		template.update("trainervideo.trainerVideoDelete",videoNo);
	}
	
	@Override
	public int trainerVideoSelectMember(String id){
		return template.selectOne("trainervideo.trainerVideoSelectMember",id);
	}
	@Override
	public int trainerVideoSelectFollowing(Map<String,String> map){
		return template.selectOne("trainervideo.trainerVideoSelectFollowing",map);
	}
	@Override
	public int trainerVideoSelectMatching(Map<String,String> map){
		return template.selectOne("trainervideo.trainerVideoSelectMatching",map);
	}
}
