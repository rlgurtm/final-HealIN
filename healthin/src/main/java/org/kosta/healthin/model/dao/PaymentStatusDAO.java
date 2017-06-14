package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.VO;

public interface PaymentStatusDAO {
	public List<VO> getPaymentList(Map<String, Object> map);
	public int getTotalCountOfContent(String id);
	public void updateUserPayStatus(Map<String, Object> map);
	public List<String> isExistRating(Map<String, Object> map);
	public void rating(Map<String, Object> map);
}
