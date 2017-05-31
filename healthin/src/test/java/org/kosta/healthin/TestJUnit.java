package org.kosta.healthin;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
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
	private TipService tipserivce;
	
	@Resource
	private TrainerService treinerservice;

	@Test
	public void test(){
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("no", 1);
		map.put("startRowNumber",1);
		map.put("endRowNumber",3);
		System.out.println("tipdao 테스트::"+tipdao.getTipCommentList(map));
		System.out.println(tipserivce.getTipCommentList("1", "1"));
		
	}
}




















