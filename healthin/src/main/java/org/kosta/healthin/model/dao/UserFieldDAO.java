package org.kosta.healthin.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.healthin.model.vo.ListVO;

public interface UserFieldDAO {

	ListVO selectUserField(String userId);

	List<String> selectFieldCategory();

	void insertUserField(Map map);

	void deleteUserField(String id);

	ListVO findByIdField(String id);

}
