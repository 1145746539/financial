package com.yc.financial.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.financial.dao.DeptDAO;
import com.yc.financial.dao.UsersDAO;
import com.yc.financial.service.LoginService;
import com.yc.financial.vo.DeptVO;
import com.yc.financial.vo.UsersVO;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private UsersDAO udao;
	
	@Autowired
	private DeptDAO ddao;
	
	public List<UsersVO> Login(UsersVO users) {
		return udao.selectByLogin(users);
	}

	@Override
	public Integer CountDid(Integer did) {
		return udao.CountDid(did);
	}

}
