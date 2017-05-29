package org.kosta.healthin.model.service;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.TipDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.springframework.stereotype.Service;

@Service

public class TipServiceImpl implements TipService  {
	@Resource
	private TipDAO dao;
	
	@Override
	public ListVO getTipBoardList(String nowpage){
		int totalContents=dao.getTotalTipCount();
		int nowPage=Integer.parseInt(nowpage);
		PagingBean pb=new PagingBean(totalContents, nowPage);
		ListVO listVO=new ListVO(dao.getTipBoardList(pb),pb);
		return listVO;
	}

}
