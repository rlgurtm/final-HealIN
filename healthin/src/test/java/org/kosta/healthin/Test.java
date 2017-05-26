package org.kosta.healthin;

import javax.annotation.Resource;


import org.junit.runner.RunWith;
import org.kosta.healthin.model.dao.MemberDAO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml"})
//(locations={"file:src/main/webapp/WEB-INF/spring-*.xml"})
public class Test {
	@Resource
	private MemberDAO memberDAO;

	@org.junit.Test
	public void test(){
		System.out.println("테스트 0526");
		memberDAO.login("java", "1234");
		memberDAO.login("healthboy", "1234");
		System.out.println(memberDAO.login("healthboy", "1234"));
	}

}
