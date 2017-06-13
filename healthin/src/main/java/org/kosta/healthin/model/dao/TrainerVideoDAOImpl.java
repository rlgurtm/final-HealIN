package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TrainerVideoCommentVO;
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
	@Override
	public ListVO filterHitsTrainerVideoList(PagingBean pb){
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("trainervideo.filterHitsTrainerVideoList",pb));
		//System.out.println(listVO);
		return listVO;
	}
	@Override
	public ListVO filterLikeStateTrainerVideoList(PagingBean pb){
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("trainervideo.filterLikeStateTrainerVideoList",pb));
		//System.out.println(listVO);
		return listVO;
	}
	@Override
	public ListVO filterPostedDateTrainerVideoList(PagingBean pb){
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("trainervideo.filterPostedDateTrainerVideoList",pb));
		//System.out.println(listVO);
		return listVO;
	}
	@Override
	public int filterOpenrankTotalCountVideo(int openrank){
		return template.selectOne("trainervideo.filterOpenrankTotalCountVideo",openrank);
	}
	@Override
	public ListVO filterOpenrankTrainerVideoList(Map map){
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("trainervideo.filterOpenrankTrainerVideoList",map));
		//System.out.println(listVO);
		return listVO;
	}
	@Override
	public int filterCategoryTotalCountVideo(String category){
		return template.selectOne("trainervideo.filterCategoryTotalCountVideo",category);
	}
	@Override
	public ListVO filterCategoryTrainerVideoList(Map map){
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("trainervideo.filterCategoryTrainerVideoList",map));
		//System.out.println(listVO);
		return listVO;
	}
	@Override
	public int selectVideoLikeState(Map map){
		if(template.selectOne("trainervideo.selectVideoLikeState",map)==null){
			return 0;
		} else {
			return template.selectOne("trainervideo.selectVideoLikeState",map);
		}
	}
	@Override
	public int insertVideoLikeState(Map map){
		return template.insert("trainervideo.insertVideoLikeState",map);
	}
	@Override
	public int deleteVideoLikeState(Map map){
		return template.delete("trainervideo.deleteVideoLikeState",map);
	}
	@Override
	public List<String> trainerNameKeywordSelect(String keyword){
		return template.selectList("trainervideo.trainerNameKeywordSelect",keyword);
	}
	@Override
	public int findByTotalCount(String trainerId){
		return template.selectOne("trainervideo.findByTotalCount",trainerId);
	}
	@Override
	public ListVO findByTrainerIdVideoList(Map map){
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("trainervideo.findByTrainerIdVideoList",map));
		//System.out.println(listVO);
		return listVO;
	}
	@Override
	public int commentTotalCount(int videoNo){
		return template.selectOne("trainervideo.commentTotalCount",videoNo);
	}
	@Override
	public ListVO showVideoComment(Map map){
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("trainervideo.showVideoComment",map));
		return listVO;
	}
	@Override
	public void registerVideoComment(TrainerVideoCommentVO cvo){
		template.insert("trainervideo.registerVideoComment",cvo);
	}
	@Override
	public void deleteVideoComment(int videoCommentNo){
		template.delete("trainervideo.deleteVideoComment",videoCommentNo);
	}
	@Override
	public ListVO findBysearchWordVideoList(Map map) {
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("searchtrainervideo.findBysearchWordVideoList",map));
		return listVO;
	}
	@Override
	public int selectedCountVideo(String searchWord) {
		return template.selectOne("trainerSearchvideo.selectedCountVideo",searchWord);
	}
	@Override
	public ListVO trainerSearchVideoList(Map<String, Object> map) {
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("trainerSearchvideo.trainerSearchVideoList",map));
		return listVO;
	}
}
