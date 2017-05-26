package org.kosta.healthin.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.TipDAO;
import org.kosta.healthin.model.vo.VO;
import org.springframework.stereotype.Service;

@Service

public class TipServiceImpl implements TipService  {
	@Resource
	private TipDAO dao;
	
	@Override
	public List<VO> getTipBoardList(){
		return dao.getTipBoardList();
	}
}
