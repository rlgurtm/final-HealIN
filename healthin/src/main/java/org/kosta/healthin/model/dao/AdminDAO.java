package org.kosta.healthin.model.dao;

import java.util.Map;

import org.kosta.healthin.model.vo.ListVO;

public interface AdminDAO {

	ListVO findByIsTrainer();

	void trainerRankDesignation(Map map);

	ListVO memberSecessionForm();

	void memberSecession(Map map);

	ListVO findByTrainerVideoForm();

	void deleteTrainerVideo(Map map);

	ListVO findByBoardForm();

	void deleteBoard(int boardNo);

}
