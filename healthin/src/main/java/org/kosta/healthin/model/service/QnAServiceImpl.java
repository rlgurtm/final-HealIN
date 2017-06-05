package org.kosta.healthin.model.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.QnaDAO;
import org.kosta.healthin.model.vo.CommentVO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TipBoardVO;
import org.springframework.stereotype.Service;

@Service
public class QnAServiceImpl implements QnAService {
	@Resource
	private QnaDAO qnaDao;
	
	@Override
	public ListVO getptQnaList(String nowpage){
		int totalContents=qnaDao.getTotalPtQnaCount();
		int nowPage=Integer.parseInt(nowpage);
		PagingBean pb=new PagingBean(totalContents, nowPage);
		ListVO listVO=new ListVO(qnaDao.getPtQnaList(pb),pb);
			
		return listVO;
	}
	@Override
	public ListVO getptQnaCategoryList(String category,String nowpage){
		int totalContents=qnaDao.getTotalPtQnaCategoryCount(category);
		int nowPage=Integer.parseInt(nowpage);
		PagingBean pb=new PagingBean(totalContents, nowPage);
			Map<String, Object> map=new HashMap<String,Object>();
			map.put("category",category);
			map.put("startRowNumber", pb.getStartRowNumber());
			map.put("endRowNumber", pb.getEndRowNumber());
		ListVO listVO=new ListVO(qnaDao.getptQnaCategoryList(map),pb);
		
		return listVO;
		
	}
	@Override
	public void ptQnaHitsCount(String no) {
			int NO=Integer.parseInt(no);
			qnaDao.tipQnaBoardHitsCount(NO);
		
	}
	@Override
	public Object getptQnaDetailContent(String no) {
		int NO=Integer.parseInt(no);
		return qnaDao.getptQnaDetailContent(NO);
	}
	@Override
	public void ptQnaWrite(TipBoardVO tvo) {
		qnaDao.ptQnaWrite(tvo);
	}
	@Override
	public void ptQnaDelete(String no, String id) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("no", Integer.parseInt(no));
		map.put("id", id);
		qnaDao.tipQnaBoardDelete(map);
	}
	@Override
	public void ptQnaUpdate(TipBoardVO tvo) {
		qnaDao.tipQnaBoardUpdate(tvo);
		
	}
	@Override
	public ListVO getPtQnaCommentList(String no, String nowpage) {
		int totalContents=qnaDao.getTotalTipQnaCommentCount(Integer.parseInt(no));
		int nowPage=Integer.parseInt(nowpage);
		PagingBean pb=new PagingBean(totalContents, nowPage);
			Map<String, Object> map=new HashMap<String,Object>();
			map.put("no",Integer.parseInt(no));
			map.put("startRowNumber", pb.getStartRowNumber());
			map.put("endRowNumber", pb.getEndRowNumber());
		ListVO listVO=new ListVO(qnaDao.getTipQnaCommentList(map),pb);
		return listVO;
	}
	@Override
	public void ptQnaCommentWrite(CommentVO cvo) {
		if(qnaDao.getIsTrainer(cvo.getId()).equals("trainer")){
			qnaDao.tipQnaCommentWrite(cvo);
		}
	}
	@Override
	public void ptQnaCommentDelete(String no) {
		qnaDao.tipQnaCommentDelete(Integer.parseInt(no));
	}
	@Override
	public String getIsTrainer(String id){
		return qnaDao.getIsTrainer(id);
	}
}
