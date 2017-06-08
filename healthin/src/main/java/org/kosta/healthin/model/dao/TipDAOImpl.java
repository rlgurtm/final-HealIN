package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.CommentVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TipBoardVO;
import org.kosta.healthin.model.vo.VO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TipDAOImpl implements TipDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public List<VO> getTipBoardList(PagingBean pb){
		return template.selectList("tipQna.getTipBoardList",pb);
	}
	@Override
	public int getTotalTipCount(){
		return template.selectOne("tipQna.getTotalTipCount");
	}
	@Override
	public List<VO> getTipBoardCategoryList(Map<String, Object> map){
		return template.selectList("tipQna.getTipBoardCategoryList",map);
	}
	@Override
	public int getTotalTipCategoryCount(String category){
		return template.selectOne("tipQna.getTotalTipCategoryCount",category);
	}
	@Override
	public TipBoardVO getTipBoardDetailContent(int no){
		return template.selectOne("tipQna.getTipBoardDetailContent",no);
	}
	@Override
	public void tipQnaBoardDelete(Map<String, Object> map){
		template.delete("tipQna.tipQnaBoardDelete",map);
	}
	@Override
	public void tipWrite(TipBoardVO tvo){
		template.insert("tipQna.tipWrite",tvo);
	}
	@Override
	public void tipQnaBoardHitsCount(int no){
		template.update("tipQna.tipQnaBoardHitsCount",no);
	}
	@Override
	public List<VO> getTipQnaCommentList(Map<String, Object> map){
		return template.selectList("tipQna.getTipQnaCommentList",map);
	}
	@Override
	public int getTotalTipQnaCommentCount(int no){
		return template.selectOne("tipQna.getTotalTipQnaCommentCount",no);
	}
	@Override
	public void tipQnaCommentWrite(CommentVO cvo){
		template.insert("tipQna.tipQnaCommentWrite",cvo);
	}
	@Override
	public void tipQnaCommentDelete(int no){
		template.delete("tipQna.tipQnaCommentDelete",no);
	}
	@Override
	public void tipQnaBoardUpdate(TipBoardVO tvo){
		template.update("tipQna.tipQnaBoardUpdate",tvo);
	}
	@Override
	public List<VO> getSearchtipAllList(Map<String, Object> map) {
		return template.selectList("searchTipQna.getSearchtipAllList",map);
	}
	@Override
	public int getTotalTipCategorySearchCount(String searchWord) {
		return template.selectOne("searchTipQna.getTotalTipCategorySearchCount",searchWord);
	}
	@Override
	public int getTotalPtQnaSearchCategoryCount(String searchWord) {
		return template.selectOne("searchTipQna.getTotalPtQnaSearchCategoryCount",searchWord);
	}
	@Override
	public List<VO> getSearchQnaAllList(Map<String, Object> map) {
		return template.selectList("searchTipQna.getSearchQnaAllList",map);
	}

}
