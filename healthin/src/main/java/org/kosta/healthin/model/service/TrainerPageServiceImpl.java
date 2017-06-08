package org.kosta.healthin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.TrainerPageDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.VO;
import org.springframework.stereotype.Service;

@Service
public class TrainerPageServiceImpl implements TrainerPageService{
	@Resource
	private TrainerPageDAO dao;
	
	@Override
	public List<VO> trainerPtList(String id){
		return dao.trainerPtList(id);
	}

	@Override
	public ListVO getFollowerList(String pageNo, String id) {
		int totalCount=dao.getFollowerTotalCount(id);
		int pageNum=Integer.parseInt(pageNo);
		PagingBean pb=new PagingBean(totalCount, pageNum);
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("STARTROWNUM", pb.getStartRowNumber());
		map.put("ENDROWNUM", pb.getEndRowNumber());	
		map.put("ID", id);
		ListVO listVO=new ListVO(dao.getFollowerList(map),pb);
		return listVO;
	}
	@Override
	public int getFollowerList(String id){
		return dao.getFollowerTotalCount(id);
		
	}
	
}
