package com.yc.financial.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.yc.financial.vo.DetailsVO;
import com.yc.financial.vo.PayrollVO;

@Repository
public interface DetailsDAO {
	
	/**
	 * 查询凭证表
	 * @param details
	 * @return
	 */
	@Select("SELECT * FROM details_users")
	List<DetailsVO> selectByCheckVoucher(DetailsVO details);

	/**
	 * 查询工资表
	 * @param payroll
	 * @return
	 */
	@Select("SELECT * FROM PAYROLL")
	List<PayrollVO> selectBySalary(PayrollVO payroll);
	
	
	/**
	 * 查询工资表总数
	 * @param payroll
	 * @return
	 */
	@Select("SELECT COUNT(*) FROM PAYROLL")
	int countCountSalary(PayrollVO payroll);
	
	/**
	 * 查询指定类型
	 * @param types
	 * @return
	 */
	@Select("select * from details where types= #{types}")
	List<DetailsVO> selectTypes(String types);
	
	/**
	 * 分页查找
	 * @param id
	 * @param time
	 * @param did
	 * @param account
	 * @param start
	 * @param size
	 * @return
	 */
	List<DetailsVO> selectByPag(@Param("id")Integer id,@Param("time")String time,@Param("did")Integer did,
			@Param("account")String account,@Param("start")Integer start,@Param("size")Integer size);
	
	/**
	 * 通过月份查询
	 * @param time
	 * @param start
	 * @param limit
	 * @return
	 */
	List<DetailsVO> selectByMonth(@Param("time")String time, @Param("start")Integer start, @Param("limit")Integer limit);
	
	/**
	 * 通过月份查找总数据
	 * @param time
	 * @return
	 */
	Integer selectByMonthCount(@Param("time")String time,@Param("did")Integer did,@Param("account")String account);
	
	/**
	 * 通过天查找总数据
	 * @param time
	 * @return
	 */
	Integer selectByDayCount(@Param("id")Integer id,@Param("time")String time);
	
	/**
	 * 查找账号
	 * @param account
	 * @return
	 */
	@Select("SELECT * FROM DETAILS WHERE ACCOUNT=#{account}")
	List<DetailsVO> selectByAccount(String account);
	
	/**
	 * 统计审核状态为0的账单
	 * @param did
	 * @param state
	 * @param time
	 * @return
	 */
	Integer CountExam(@Param("did")Integer did,@Param("state")Integer state,@Param("time")String time);
	
	/**
	 * 查询审核状态为0的账单
	 * @param did
	 * @param state
	 * @param time
	 * @param start
	 * @param limit
	 * @return
	 */
	List<DetailsVO> selectExam(@Param("did")Integer did,@Param("state")Integer state,@Param("time")String time, @Param("start")Integer start, @Param("limit")Integer limit);

	/**
	 * 查询日记账单
	 * @param id
	 * @param time
	 * @param did
	 * @param account
	 * @param start
	 * @param limit
	 * @return
	 */
	List<DetailsVO> selectForJournal(@Param("id")Integer id, @Param("time")String time, @Param("did")Integer did, @Param("account")String account, @Param("start")Integer start,
			@Param("limit")Integer limit);

}
