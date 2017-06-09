package org.kosta.healthin.model.service;

import javax.annotation.Resource;

import org.kosta.healthin.model.dao.MentoringDAO;
import org.springframework.stereotype.Service;

@Service
public class MentoringServiceImpl implements MentoringService {
	@Resource
	private MentoringDAO mentoringDAO;
	
}
