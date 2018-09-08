package com.yc.financial.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.yc.financial.vo.PayrollVO;

@Repository
public interface PayrollDAO {

	/**
	 * 根据用户查找工资表
	 * @param account
	 * @return
	 */
	@Select("SELECT * FROM payroll_users WHERE ACCOUNT = #{account}")
	List<PayrollVO> selectByPayroll(String account);

}
