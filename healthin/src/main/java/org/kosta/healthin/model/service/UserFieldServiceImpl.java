package org.kosta.healthin.model.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.UserFieldDAO;
import org.kosta.healthin.model.vo.ListVO;
import org.springframework.stereotype.Service;

@Service
public class UserFieldServiceImpl implements UserFieldService{
	@Resource
	private UserFieldDAO userFieldDAO;
	
	@Override
	public ListVO selectUserField(String userId){
		return userFieldDAO.selectUserField(userId);
	}
	@Override
	public List<String> selectFieldCategory(){
		return userFieldDAO.selectFieldCategory();
	}
	@Override
	public void insertUserField(Map map){
		userFieldDAO.insertUserField(map);
	}
	@Override
	public void deleteUserField(String id){
		userFieldDAO.deleteUserField(id);
	}
	@Override
	public ListVO findByIdField(String id){
		return userFieldDAO.findByIdField(id);
	}
}
