package org.kosta.healthin;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.healthin.model.dao.QnaDAO;
import org.kosta.healthin.model.dao.TipDAO;
import org.kosta.healthin.model.service.TipService;
import org.kosta.healthin.model.service.TrainerService;
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

	@Test
	public void test(){
	}
}




















