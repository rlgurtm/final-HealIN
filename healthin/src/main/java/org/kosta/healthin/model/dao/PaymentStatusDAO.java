package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.VO;

public interface PaymentStatusDAO {
	public List<VO> getPaymentList(Map<String, Object> map);			// user가 사용
	public List<VO> getUsersPaymentList(Map<String, Object> map); // trainer가 사용
	public int getTotalCountOfContent(String id);				// user가 사용
	public int getTotalCountOfUsersContent(String id);		// trainer가 사용
	public void updateUserPayStatus(Map<String, Object> map);
	public List<String> isExistRating(String id);
	public void rating(Map<String, Object> map);	// 평가
	public List<Integer> getRateStatus();
	//public void deletePayment(int payNo);
}
