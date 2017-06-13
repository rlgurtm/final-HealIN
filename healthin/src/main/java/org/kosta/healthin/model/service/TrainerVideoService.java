package org.kosta.healthin.model.service;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TrainerVideoCommentVO;
import org.kosta.healthin.model.vo.TrainerVideoVO;

public interface TrainerVideoService {

	TrainerVideoVO trainerVideoShow(int videoNo);

	void trainerVideoWrite(TrainerVideoVO trainerVideoVO);

	int totalCountVideo();

	ListVO trainerVideoList(PagingBean pb);

	void trainerVideoUpdateNewFile(TrainerVideoVO trainerVideoVO);

	void trainerVideoUpdate(TrainerVideoVO trainerVideoVO);

	void trainerVideoDelete(int videoNo);

	TrainerVideoVO trainerVideoDetail(int videoNo);

	int trainerVideoSelectMember(String id);

	int trainerVideoSelectFollowing(Map<String, String> map);

	int trainerVideoSelectMatching(Map<String, String> map);

	ListVO filterHitsTrainerVideoList(PagingBean pb);

	ListVO filterLikeStateTrainerVideoList(PagingBean pb);

	ListVO filterPostedDateTrainerVideoList(PagingBean pb);

	int filterOpenrankTotalCountVideo(int openrank);

	ListVO filterOpenrankTrainerVideoList(Map map);

	int filterCategoryTotalCountVideo(String category);

	ListVO filterCategoryTrainerVideoList(Map map);

	int selectVideoLikeState(Map map);

	int insertVideoLikeState(Map map);

	int deleteVideoLikeState(Map map);

	List<String> trainerNameKeywordSelect(String keyword);

	int findByTotalCount(String trainerId);

	ListVO findByTrainerIdVideoList(Map map);
	ListVO findBysearchWordVideoList(Map map);

	void registerVideoComment(TrainerVideoCommentVO cvo);

	void deleteVideoComment(int videoCommentNo);

	int commentTotalCount(int videoNo);

	ListVO showVideoComment(Map map);

}
