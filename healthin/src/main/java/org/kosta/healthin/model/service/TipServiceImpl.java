package org.kosta.healthin.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.DAO;
import org.kosta.healthin.model.vo.TipBoardVO;
import org.springframework.stereotype.Service;

@Service
public class TipServiceImpl implements HealthService {
	@Resource
	private DAO dao;
	
	public List<TipBoardVO> getTipboardList(){
		return null;
	}

}
