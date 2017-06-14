package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.VO;

public interface PaymentStatusDAO {
	public List<VO> getPaymentList(Map<String, Object> map);
	public int getTotalCountOfContent(String id);
}
