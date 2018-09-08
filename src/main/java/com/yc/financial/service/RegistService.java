package com.yc.financial.service;



import java.util.List;

import com.yc.financial.vo.DeptVO;
import com.yc.financial.vo.UsersVO;

public interface RegistService {

	public Integer Regist(UsersVO users);
	
	List<UsersVO> selectByAccount(UsersVO users);
	
	public DeptVO selectDeptByDid(Integer did); 

	public Integer	UpdateStaffNum(Integer staff,Integer did);
	
	public List<DeptVO> selectDept();
	
}
