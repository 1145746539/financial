package com.yc.financial.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.financial.dao.DetailsDAO;
import com.yc.financial.dao.PayrollDAO;
import com.yc.financial.dao.UsersDAO;
import com.yc.financial.service.CheckService;
import com.yc.financial.vo.DetailsVO;
import com.yc.financial.vo.PayrollVO;

@Service
public class CheckServiceImpl implements CheckService{

	@Autowired
	private DetailsDAO ddao;

	@Autowired
	private UsersDAO udao;
	
	@Autowired
	private PayrollDAO pdao;
	
	public List<DetailsVO> selectByCheckVoucher(DetailsVO details) {
		return ddao.selectByCheckVoucher(details);
	}

	@Override
	public List<PayrollVO> selectBySalary(PayrollVO payroll) {
		return ddao.selectBySalary(payroll);
	}
	
	@Override
	public int countCountSalary(PayrollVO payroll) {
		return ddao.countCountSalary(payroll);
	}

	@Override
	public List<DetailsVO> selectTypes(String types) {
		return ddao.selectTypes(types);
	}
	
	@Override
	public List<DetailsVO> selectByPag(Integer id, String time,Integer did,String account, Integer start, Integer limit) {
		return ddao.selectByPag(id, time,did, account,start, limit);
	}

	@Override
	public List<DetailsVO> selectByMonth(String time, Integer start, Integer limit) {
		return ddao.selectByMonth(time, start, limit);
	}
	
	public Integer selectByMonthCount(String time,Integer did,String account) {
		return ddao.selectByMonthCount(time,did,account);
	}
	
	@Override
	public Integer selectByDayCount(Integer id,String time) {
		return ddao.selectByDayCount(id,time);
	}

	@Override
	public List<DetailsVO> selectByAccount(String account) {
		return ddao.selectByAccount(account);
	}

	@Override
	public List<PayrollVO> selectByPayroll(String account) {
		return pdao.selectByPayroll(account);
	}

	@Override
	public Integer CountExam(Integer did, Integer state,String time) {
		return ddao.CountExam(did, state,time);
	}

	@Override
	public List<DetailsVO> selectExam(Integer did, Integer state, String time, Integer start, Integer limit) {
		return ddao.selectExam(did, state, time, start, limit);
	}

	@Override
	public List<DetailsVO> selectForJournal(Integer id, String time, Integer did, String account, Integer start,
			Integer limit) {
		return ddao.selectForJournal(id, time, did, account, start, limit);
	}

	
}
