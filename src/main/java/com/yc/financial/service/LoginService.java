package com.yc.financial.service;

import java.util.List;

import com.yc.financial.vo.DeptVO;
import com.yc.financial.vo.UsersVO;


public interface LoginService {
	
	public List<UsersVO> Login(UsersVO users);
	
	public Integer CountDid(Integer did);
	
	
}
