package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.healthin.model.vo.ListVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserFieldDAOImpl implements UserFieldDAO{
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public ListVO selectUserField(String userId){
		ListVO fieldList = new ListVO();
		fieldList.setLVO(template.selectList("userfield.selectUserField",userId));
		return fieldList;
	}
	
	@Override
	public List<String> selectFieldCategory(){
		return template.selectList("userfield.selectFieldCategory");
	}
	
	@Override
	public void insertUserField(Map map){
		template.insert("userfield.insertUserField",map);
	}
	@Override
	public void deleteUserField(String id){
		template.delete("userfield.deleteUserField",id);
	}
	@Override
	public ListVO findByIdField(String id){
		ListVO idList = new ListVO();
		idList.setLVO(template.selectList("userfield.findByIdField",id));
		return idList;
	}
}
