package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.CommentVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TipBoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAOImpl implements QnaDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public List<TipBoardVO> getPtQnaList(PagingBean pb){
		return template.selectList("tipQna.getPtQnaList",pb);
	}
	@Override
	public int getTotalPtQnaCount() {
		return template.selectOne("tipQna.getTotalPtQnaCount");
	}
	@Override
	public List<TipBoardVO> getptQnaCategoryList(Map<String, Object> map){
		return template.selectList("tipQna.getptQnaCategoryList",map);
	}
	@Override
	public int getTotalPtQnaCategoryCount(String category) {
		return template.selectOne("tipQna.getTotalPtQnaCategoryCount",category);
	}
	@Override
	public void tipQnaBoardHitsCount(int no) {
		template.update("tipQna.tipQnaBoardHitsCount",no);
	}
	@Override
	public TipBoardVO getptQnaDetailContent(int no) {
		return template.selectOne("tipQna.getptQnaDetailContent",no);
	}
	@Override
	public void ptQnaWrite(TipBoardVO tvo) {
		template.insert("tipQna.ptQnaWrite",tvo);
		
	}
	@Override
	public void tipQnaBoardDelete(Map<String, Object> map) {
		template.delete("tipQna.tipQnaBoardDelete",map);
	}
	@Override
	public void tipQnaBoardUpdate(TipBoardVO tvo) {
		template.update("tipQna.tipQnaBoardUpdate",tvo);
		
	}
	@Override
	public int getTotalTipQnaCommentCount(int no) {
		return template.selectOne("tipQna.getTotalTipQnaCommentCount",no);
	}
	@Override
	public List<CommentVO> getTipQnaCommentList(Map<String, Object> map) {
		return template.selectList("tipQna.getTipQnaCommentList",map);
	}
	@Override
	public void tipQnaCommentWrite(CommentVO cvo) {
		template.insert("tipQna.tipQnaCommentWrite",cvo);
	}
	@Override
	public void tipQnaCommentDelete(int no) {
		template.delete("tipQna.tipQnaCommentDelete",no);
	}
	@Override
	public String getIsTrainer(String id){
		return template.selectOne("tipQna.getIsTrainer",id);
	}
	@Override
	public List<TipBoardVO> getptQnaSearchList(Map<String, Object> map){
		return template.selectList("searchTipQna.getPtQnaSearchList",map);
	}

}
