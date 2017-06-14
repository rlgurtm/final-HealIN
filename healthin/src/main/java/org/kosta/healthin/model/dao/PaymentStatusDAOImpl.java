package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.VO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentStatusDAOImpl implements PaymentStatusDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<VO> getPaymentList(Map<String, Object> map) {
		return template.selectList("paymentStatus.getPaymentList", map);
	}

	@Override
	public int getTotalCountOfContent(String id) {
		return template.selectOne("paymentStatus.getTotalCountOfContent", id);
	}
}
