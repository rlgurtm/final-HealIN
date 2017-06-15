package org.kosta.healthin.model.service;

import java.util.HashMap;
import java.util.List;
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

	@Override
	public void updateUserPayStatus(Map<String, Object> map) {
		paymentStatusDAO.updateUserPayStatus(map);
	}

	@Override
	public void rating(Map<String, Object> map) {
		paymentStatusDAO.rating(map);
	}

	@Override
	public List<String> isExistRating(Map<String, Object> map) {
		return paymentStatusDAO.isExistRating(map);
	}

	@Override
	public ListVO getUsersPaymentList(String id, String nowPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		int totalContents = paymentStatusDAO.getTotalCountOfUsersContent(id);
		PagingBean pagingBean = null;
		if (nowPage == null) {
			pagingBean = new PagingBean(totalContents);
		} else {
			pagingBean = new PagingBean(totalContents, Integer.parseInt(nowPage));
		}
		map.put("id", id);
		map.put("startRowNumber", pagingBean.getStartRowNumber());
		map.put("endRowNumber", pagingBean.getEndRowNumber());
		ListVO listVO = new ListVO(paymentStatusDAO.getUsersPaymentList(map), pagingBean);
		System.out.println(listVO);
		return listVO;
	}
}
