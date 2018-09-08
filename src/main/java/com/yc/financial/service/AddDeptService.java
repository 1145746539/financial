package com.yc.financial.service;

import com.yc.financial.vo.DeptVO;

public interface AddDeptService {
	
	/**
	 * 新增部门
	 * @param deptvo
	 * @return
	 */
	public Integer addNewDept(DeptVO deptvo);
	
}
