package org.kosta.healthin;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.healthin.model.dao.TipDAO;
import org.kosta.healthin.model.service.TipService;
import org.kosta.healthin.model.service.TrainerService;
import org.kosta.healthin.model.vo.CommentVO;
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
	private TrainerService trainerservice;

	@Test
	public void test(){
			CommentVO cvo=new CommentVO();
			cvo.setBoardNo(2);
			cvo.setComment("여기 너무 좋아용~~!짱짱");
			cvo.setId("java");
			tipdao.tipCommentWrite(cvo);
			Map<String, Object> map=new HashMap<String,Object>();
			map.put("no",2);
			map.put("startRowNumber", 1);
			map.put("endRowNumber", 5);
		System.out.println(tipdao.getTipCommentList(map));
		
	}
}




















