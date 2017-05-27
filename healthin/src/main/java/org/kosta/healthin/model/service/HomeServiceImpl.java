package org.kosta.healthin.model.service;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.HomeDAO;
import org.kosta.healthin.model.dao.QnaDAO;
import org.kosta.healthin.model.dao.TipDAO;
import org.kosta.healthin.model.dao.TrainerDAO;
import org.kosta.healthin.model.dao.TrainerVideoDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService {
	@Resource
	private HomeDAO homeDAO;		// 인기순으로 강사리스트 및 동영상 출력
	@Resource
	private TipDAO tipDAO;
	@Resource
	private QnaDAO qnaDAO;

	@Override
	public ListVO videoListOnMainpage() {
		return homeDAO.videoListOnMainpage();
	}

	@Override
	public ListVO trainerInfoListOnMainpage() {
		return homeDAO.trainerInfoListOnMainpage();
	}
}
