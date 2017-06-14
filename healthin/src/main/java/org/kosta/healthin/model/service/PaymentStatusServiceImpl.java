package org.kosta.healthin.model.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.PaymentStatusDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.kosta.healthin.model.vo.PagingBean;
import org.springframework.stereotype.Service;

@Service
public class PaymentStatusServiceImpl implements PaymentStatusService {
	@Resource
	private PaymentStatusDAO paymentStatusDAO;

	@Override
	public ListVO getPaymentList(String id, String nowPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		int totalContents = paymentStatusDAO.getTotalCountOfContent(id);
		PagingBean pagingBean = null;
		if (nowPage == null) {
			pagingBean = new PagingBean(totalContents);
		} else {
			pagingBean = new PagingBean(totalContents, Integer.parseInt(nowPage));
		}
		map.put("id", id);
		map.put("startRowNumber", pagingBean.getStartRowNumber());
		map.put("endRowNumber", pagingBean.getEndRowNumber());
		ListVO listVO = new ListVO(paymentStatusDAO.getPaymentList(map), pagingBean);
		return listVO;
	}
}
