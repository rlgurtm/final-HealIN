package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.TipBoardVO;
import org.kosta.healthin.model.vo.VO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAOImpl implements QnaDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public List<VO> getPtQnaList(PagingBean pb){
		return template.selectList("ptqna.getPtQnaList",pb);
	}
	@Override
	public List<VO> getptQnaCategoryList(Map<String, Object> map){
		return template.selectList("ptqna.getptQnaCategoryList",map);
	}
	@Override
	public int getTotalPtQnaCount() {
		return template.selectOne("ptqna.getTotalPtQnaCount");
	}
	@Override
	public int getTotalPtQnaCategoryCount(String category) {
		return template.selectOne("ptqna.getTotalPtQnaCategoryCount",category);
	}
	@Override
	public void ptQnaHitsCount(int no) {
		template.update("ptqna.ptQnaHitsCount",no);
	}
	@Override
	public Object getptQnaDetailContent(int no) {
		return template.selectOne("ptqna.getptQnaDetailContent",no);
	}
	@Override
	public void ptQnaWrite(TipBoardVO tvo) {
		template.insert("ptqna.ptQnaWrite",tvo);
		
	}
	@Override
	public void ptQnaDelete(Map<String, Object> map) {
		template.delete("ptqna.ptQnaDelete",map);
	}
	@Override
	public void ptQnaUpdate(TipBoardVO tvo) {
		template.update("ptqna.ptQnaUpdate",tvo);
		
	}

}
