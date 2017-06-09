package org.kosta.healthin;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.healthin.model.dao.QnaDAO;
import org.kosta.healthin.model.dao.TipDAO;
import org.kosta.healthin.model.dao.TrainerPageDAO;
import org.kosta.healthin.model.service.TipService;
import org.kosta.healthin.model.service.TrainerPageService;
import org.kosta.healthin.model.service.TrainerService;
import org.kosta.healthin.model.vo.PagingBean;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml"})

public class TestJUnit {
	@Resource
	private TipDAO tipdao;
	
	@Resource
	private QnaDAO qnadao;
	
	@Resource
	private TipService tipserivce;
	
	@Resource
	private TrainerService trainerservice;
	
	@Resource
	private TrainerPageDAO tpdao;
	
	@Resource
	private TrainerPageDAO pdao;
	
	@Resource
	private TrainerPageService pservice;

	@Test
	public void test(){
		
		int totalCount=5;
		int pageNum=1;
		PagingBean pb=new PagingBean(totalCount, pageNum);
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("startRowNumber", pb.getStartRowNumber());
		map.put("endRowNumber", pb.getEndRowNumber());	
		map.put("id", "healthboy");
		System.out.println(pdao.trainerPtList(map));
		System.out.println(pservice.trainerPtList("healthboy", "1").getPb().getStartPageOfPageGroup());
	}
}




















