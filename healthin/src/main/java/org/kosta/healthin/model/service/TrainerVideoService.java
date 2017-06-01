package org.kosta.healthin.model.service;

import java.util.Map;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
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

}
