package org.kosta.healthin;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.healthin.model.dao.TipDAO;
import org.kosta.healthin.model.service.TipService;
import org.kosta.healthin.model.vo.MemberVO;
import org.kosta.healthin.model.vo.TipBoardVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml"})

public class TestJUnit {
	@Resource
	private TipDAO dao;
	
	@Resource
	private TipService serivce;

	@Test
	public void test(){
		TipBoardVO tvo=new TipBoardVO();
		tvo.setCategory("다이어트");
		tvo.setTitle("주제입니다");
		tvo.setContent("걸어걸어 다 걸어");
		tvo.setTipqna("tip");
		tvo.setMemberVO(new MemberVO("java", null, null, null, null, null, null, null, null, null, null));
		dao.tipWrite(tvo);
		System.out.println("안녕하세요"+dao.getTipBoardDetailContent(tvo.getNo()));	
	/*
		insert into tipandqna
		values(#{no},#{title},#{content},#{attachedFile},0,
				sysdate,#{category},#{memberVO.id},#{tipqna})
					private String id;
*/

		
	}
}




















