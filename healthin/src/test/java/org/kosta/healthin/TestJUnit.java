package org.kosta.healthin;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.healthin.model.dao.QnaDAO;
import org.kosta.healthin.model.dao.TipDAO;
import org.kosta.healthin.model.dao.TrainerPageDAO;
import org.kosta.healthin.model.service.TipService;
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

	@Test
	public void test(){
		int totalContents=5;
		int nowPage=1;
		PagingBean pb=new PagingBean(totalContents, nowPage);
		System.out.println(tipdao.getTipBoardList(pb));
	}
}




















