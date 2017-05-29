package org.kosta.healthin;

import javax.annotation.Resource;


import org.junit.runner.RunWith;
import org.kosta.healthin.model.dao.MemberDAO;
import org.kosta.healthin.model.vo.MemberVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring-model.xml"})
//(locations={"file:src/main/webapp/WEB-INF/spring-*.xml"})
public class Test {
	@Resource
	private MemberDAO memberDAO;
	private MemberVO vo = 
			new MemberVO("spring", "1234", "spring여신", "spring여신님", "19810614", "female", "서울시 종로구 통인동 69 1202호",
					"01099991234", "spring@lycos.co.kr", "user", "N");
	private MemberVO tvo = 
//			new MemberVO("podo", "1234", "spring여신", "spring여신님", "19810614", "female", "서울시 종로구 통인동 69 1202호",
//					"01099991234", "spring@lycos.co.kr", "user", "N","성동구 사회복지관 어르신 스트레칭 교육 4년",0,"성동구","podo1.png");

			new MemberVO("podo", "1234", "포도양", "김포도", "19920603",
					"female", "서울시 종로구 통인동 69 1202호","01023451234",  "podo@lycos.co.kr", "trainer", "N", "podo1.png", 
					"성동구 사회복지관 수영강습 4년", 0, "성동구", "podo1.png");
			
	@org.junit.Test
	public void test(){
		System.out.println("테스트 0527");
//		memberDAO.login("java", "1234");
//		memberDAO.login("healthboy", "1234");
//		System.out.println(memberDAO.login("healthboy", "1234"));
		System.out.println(tvo);
		memberDAO.registerStep3(tvo);
//		System.out.println("일반회원가입 OKAY");
		System.out.println("트레이너 회원가입 OKAY");
		
	}

}
