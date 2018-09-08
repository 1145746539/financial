package com.yc.financial.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.yc.financial.vo.DeptVO;
import com.yc.financial.vo.DetailsVO;
import com.yc.financial.vo.UsersVO;

@Repository
public interface DeptDAO {

	/**
	 * 根据部门编号查找部门信息
	 * @param did
	 * @return
	 */
	@Select("SELECT * FROM DEPT WHERE DID = #{did}")
	public DeptVO selectDeptByDid(Integer did);
	
	/**
	 * 修改指定部门人数数量
	 * @param staff
	 * @param did
	 * @return
	 */
	@Update("UPDATE DEPT SET STAFF=#{staff} WHERE DID= #{did}")
	public Integer	UpdateStaffNum(@Param("staff")Integer staff,@Param("did")Integer did);
	
	/**
	 * 查询部门信息
	 * @return
	 */
	@Select("SELECT * FROM DEPT")
	public List<DeptVO> selectDept();
	
}