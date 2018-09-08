package com.yc.financial.service;

import com.yc.financial.vo.UsersVO;

public interface AddInfoService {

	public Integer AddInfo(UsersVO users);
	
	public UsersVO selectByUid(UsersVO users);
	
}
