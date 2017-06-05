package org.kosta.healthin.model.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.TipDAO;
import org.kosta.healthin.model.vo.CommentVO;
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
		ListVO listVO=new ListVO(dao.getTipBoardCategoryList(map),pb);
		
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
		dao.tipQnaBoardDelete(map);
	}
	@Override
	public void tipBoardUpdate(TipBoardVO tvo){
		dao.tipQnaBoardUpdate(tvo);
	}
	@Override
	public void tipWrite(TipBoardVO tvo){
		dao.tipWrite(tvo);
	}
	@Override
	public void tipHitsCount(String no){
		int NO=Integer.parseInt(no);
		dao.tipQnaBoardHitsCount(NO);
	}
	@Override
	public ListVO getTipCommentList(String no,String nowpage){
		int totalContents=dao.getTotalTipQnaCommentCount(Integer.parseInt(no));
		int nowPage=Integer.parseInt(nowpage);
		PagingBean pb=new PagingBean(totalContents, nowPage);
			Map<String, Object> map=new HashMap<String,Object>();
			map.put("no",Integer.parseInt(no));
			map.put("startRowNumber", pb.getStartRowNumber());
			map.put("endRowNumber", pb.getEndRowNumber());
		ListVO listVO=new ListVO(dao.getTipQnaCommentList(map),pb);
		return listVO;
	}
	@Override
	public void tipCommentWrite(CommentVO cvo){
		dao.tipQnaCommentWrite(cvo);
	}
	@Override
	public void tipCommentDelete(String no){
		dao.tipQnaCommentDelete(Integer.parseInt(no));
	}

}
