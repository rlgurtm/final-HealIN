package org.kosta.healthin.model.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.TipDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TipBoardVO;
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
	@Override
	public ListVO tipBoardCategoryList(String category,String nowpage){
		int totalContents=dao.getTotalTipCategoryCount(category);
		int nowPage=Integer.parseInt(nowpage);
		PagingBean pb=new PagingBean(totalContents, nowPage);
			Map<String, Object> map=new HashMap<String,Object>();
			map.put("category",category);
			map.put("startRowNumber", pb.getStartRowNumber());
			map.put("endRowNumber", pb.getEndRowNumber());
		ListVO listVO=new ListVO(dao.tipBoardCategoryList(map),pb);
		
		return listVO;
		
	}
	@Override
	public TipBoardVO getTipBoardDetailContent(String no){
		int NO=Integer.parseInt(no);
		return dao.getTipBoardDetailContent(NO);
	}
	@Override
	public void tipBoardDelete(String no,String id){
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("no", Integer.parseInt(no));
		map.put("id", id);
		dao.tipBoardDelete(map);
	}
	@Override
	public void tipWrite(TipBoardVO tvo){
		dao.tipWrite(tvo);
	}

}
