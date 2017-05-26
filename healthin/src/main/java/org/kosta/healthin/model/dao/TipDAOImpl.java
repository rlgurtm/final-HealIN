package org.kosta.healthin.model.dao;

import java.util.List;

import org.kosta.healthin.model.vo.TipBoardVO;
import org.springframework.stereotype.Repository;

@Repository
public class TipDAOImpl implements TipDAO {

/*	@Resource
	private SqlSessionTemplate template;*/
	
	@Override
	public List<TipBoardVO> getTipboardList(){
	/*	return template.selectList("tip.getTipboardList");*/
		return null;
	}

}
