package com.yc.financial.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.financial.dao.ExamDAO;
import com.yc.financial.service.ExamService;

@Service
public class ExamServiceImpl implements ExamService {
	
	@Resource
	private ExamDAO dao;

	public Integer updataFlowOne(Integer id, Integer did,String note,int state) {
		return dao.updataFlowOne(id, did,note,state);
	}

	public Integer insertFlow(Integer id,Integer did) {
		return dao.insertFlowmeter(id, did);
	}

	public Integer updataDetails(Integer id,Integer state) {
		return dao.updataDetails(id, state);
	}

	


}
