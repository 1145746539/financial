package com.yc.financial.dao;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

import com.yc.financial.vo.DeptVO;

@Repository
public interface AddDeptDao {
	
	/**
	 * 增加新部门
	 * @param deptvo
	 * @return
	 */
	@Insert("INSERT INTO DEPT VALUES(NULL, #{dname}, #{dlevel}, NULL, #{staff}, #{uplevel})")
	public Integer addDept(DeptVO deptvo);
	
}
