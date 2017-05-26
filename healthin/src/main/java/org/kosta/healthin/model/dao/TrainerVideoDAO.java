package org.kosta.healthin.model.dao;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.TrainerVideoVO;

public interface TrainerVideoDAO {

	ListVO trainerVideoList();

	TrainerVideoVO trainerVideoShow(int videoNo);

}
