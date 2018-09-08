package com.yc.financial.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.financial.dao.DeptDAO;
import com.yc.financial.dao.SelUserlistDAO;
import com.yc.financial.service.SelUserlistService;
import com.yc.financial.vo.DeptVO;
import com.yc.financial.vo.UsersVO;

/**
 * SelUserlistService的实现类
 * 
 * @author 朱毅东
 *
 */
@Service
public class SelUserlistServiceImpl implements SelUserlistService {
	// 返回dao里的方法
	@Resource
	SelUserlistDAO dao;

	@Resource
	DeptDAO ddao;
	
	@Override
	public List<UsersVO> selectUserlist() {
		return dao.selectUserlist();
	}

	@Override
	public List<UsersVO> selByUname(String uname) {
		return dao.selByUname(uname);
	}

	@Override
	public List<UsersVO> userPage(int pages, int rows) {
		// TODO：参考ResfoodDaoImpl
		// 分页条件
		// 计算分页参数 偏移量
		return dao.seluserPage(pages, rows);
	}

	@Override
	public int count(UsersVO users) {
		return dao.count(users);
	}

	
	@Override
	public List<DeptVO> selectDept() {
		return ddao.selectDept();
	}

	/**
	 * 分页查询
	 */
	public List<UsersVO> selectByPag(String uname, Integer did, Integer start,Integer limit) {
		return dao.selectByPag(uname,did, start, limit);
	}
	
}
