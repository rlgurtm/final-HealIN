package org.kosta.healthin.model.service;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.ListVO;

public interface PaymentStatusService {
	public ListVO getPaymentList(String id, String nowPage);
	public ListVO getUsersPaymentList(String id, String nowPage);
	public void updateUserPayStatus(Map<String, Object> map);
	public void rating(Map<String, Object> map);
	public List<String> isExistRating(String id);
	public List<Integer> getRateStatus();
}
