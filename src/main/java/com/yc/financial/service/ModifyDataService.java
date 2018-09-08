package com.yc.financial.service;

import com.yc.financial.vo.UsersVO;

public interface ModifyDataService {
	
	public UsersVO selectByUid(UsersVO user);
	
	
	public Integer update(UsersVO user);

}
