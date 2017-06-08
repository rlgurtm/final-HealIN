package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.kosta.healthin.model.vo.PhysicalInfoVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAOImpl implements MyPageDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public void insertUserPhysicalInfo(PhysicalInfoVO pivo) {
		template.insert("mypage.insertUserPhysicalInfo", pivo);
	}

	@Override
	public ListVO selectUserPhyicalInfo(Map map) {
		ListVO listVO = new ListVO();
		listVO.setLVO(template.selectList("mypage.selectUserPhyicalInfo", map));
		System.out.println(listVO);
		return listVO;
	}
	@Override
	public int graphContentCount(String user_id){
		return template.selectOne("mypage.graphContentCount",user_id);
	}

	@Override
		public List<PhysicalInfoVO> graphPagingBean(PagingBean pb){
		return  template.selectList("mypage.graphPagingBean",pb);
			/*PhysicalInfoVO pivo=new PhysicalInfoVO();
			pivo.setLvo((ListVO) template.selectList("mypage.totalCountList",pb));
			return pivo;*/
				}
}
