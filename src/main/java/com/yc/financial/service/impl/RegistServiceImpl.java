package com.yc.financial.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.financial.dao.DeptDAO;
import com.yc.financial.dao.UsersDAO;
import com.yc.financial.service.RegistService;
import com.yc.financial.vo.DeptVO;
import com.yc.financial.vo.UsersVO;

@Service
public class RegistServiceImpl implements RegistService{

	@Autowired
	private UsersDAO udao;
	
	@Autowired
	private DeptDAO ddao;
	
	@Override
	public Integer Regist(UsersVO users) {
		return udao.selectByRegist(users);
	}

	@Override
	public List<UsersVO> selectByAccount(UsersVO users) {
		return udao.selectByAccount(users);
	}


	@Override
	public DeptVO selectDeptByDid(Integer did) {
		return ddao.selectDeptByDid(did);
	}

	@Override
	public Integer UpdateStaffNum(Integer staff,Integer did) {
		return ddao.UpdateStaffNum(staff,did);
	}

	@Override
	public List<DeptVO> selectDept() {
		return ddao.selectDept();
	}
	
}
