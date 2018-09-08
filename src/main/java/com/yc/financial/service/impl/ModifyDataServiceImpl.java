package com.yc.financial.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.financial.dao.ModifyDataDAO;
import com.yc.financial.service.ModifyDataService;
import com.yc.financial.vo.UsersVO;

@Service
public class ModifyDataServiceImpl implements ModifyDataService {

	@Resource
	private ModifyDataDAO dao;
	
	public UsersVO selectByUid(UsersVO user) {
		
		return dao.selectByUid(user);
	}

	@Override
	public Integer update(UsersVO user) {
		
		return dao.update(user);
	}

}
