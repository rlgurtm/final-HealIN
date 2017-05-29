package org.kosta.healthin.model.dao;

import org.kosta.healthin.model.vo.ListVO;

public interface HomeDAO {
	ListVO getVideoListOnMainpage();
	ListVO getTrainerInfoListOnMainpage();
}
