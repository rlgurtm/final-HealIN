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
public class TipDAOImpl implements TipDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public List<VO> getTipBoardList(PagingBean pb){
		return template.selectList("tip.getTipBoardList",pb);
	}
	@Override
	public int getTotalTipCount(){
		return template.selectOne("tip.getTotalTipCount");
	}
	@Override
	public List<VO> tipBoardCategoryList(Map<String, Object> map){
		System.out.println(map.get("category"));
		return template.selectList("tip.tipBoardCategoryList",map);
	}
	@Override
	public int getTotalTipCategoryCount(String category){
		return template.selectOne("tip.getTotalTipCategoryCount",category);
	}
	@Override
	public TipBoardVO getTipBoardDetailContent(int no){
		return template.selectOne("tip.getTipBoardDetailContent",no);
	}
	


}
