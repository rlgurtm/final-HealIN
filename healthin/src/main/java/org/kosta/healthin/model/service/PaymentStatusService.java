package org.kosta.healthin.model.service;

import org.kosta.healthin.model.vo.ListVO;

public interface PaymentStatusService {
	public ListVO getPaymentList(String id, String nowPage);
}
