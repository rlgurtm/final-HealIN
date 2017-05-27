package org.kosta.healthin.model.dao;

import org.kosta.healthin.model.vo.ListVO;

public interface HomeDAO {
	ListVO videoListOnMainpage();
	ListVO trainerInfoListOnMainpage();
	ListVO tipAndQnaBoardOnMainpage();
}
