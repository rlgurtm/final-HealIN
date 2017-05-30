package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TrainerVideoVO;

public interface TrainerVideoService {

	TrainerVideoVO trainerVideoShow(int videoNo);

	void trainerVideoWrite(TrainerVideoVO trainerVideoVO);

	int totalCountVideo();

	ListVO trainerVideoList(PagingBean pb);

}
