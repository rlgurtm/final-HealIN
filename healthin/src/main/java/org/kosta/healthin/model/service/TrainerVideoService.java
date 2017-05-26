package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.TrainerVideoVO;

public interface TrainerVideoService {

	ListVO trainerVideoList();

	TrainerVideoVO trainerVideoShow(int videoNo);

}
