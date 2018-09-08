package com.yc.financial.dao;

import java.util.List;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.yc.financial.vo.DeptVO;
import com.yc.financial.vo.DetailsVO;
import com.yc.financial.vo.UsersVO;
import com.yc.financial.vo.accountypeVO;

@Repository
public interface SubAccountDAO {
	
	/**
	 * 查找用户类型表
	 * @return
	 */
	@Select("SELECT * FROM ACCOUNTYPE")
	public List<accountypeVO> selectAccountType();

	/**
	 * 录凭证
	 * @param detail
	 * @return
	 */
	@Insert("INSERT INTO DETAILS VALUES(NULL,#{types},#{project},#{account},"
			+ "#{reportime},NULL,#{money},#{number},#{allmoney},0) ")
	public int insertaccount(DetailsVO detail);

	/**
	 * 加入流水表
	 * @param id
	 * @param did
	 * @return
	 */
	@Insert("INSERT INTO FLOWMETER(ID,DID,STATE,REMARKS) VALUES(#{id},#{did},0,NULL)")
	public int insertFlowmeter(@Param("id")Integer id,@Param("did")Integer did);
	
	/**
	 * 查找最大ID来获取用户账号
	 * @param account
	 * @return
	 */
	@Select("SELECT MAX(ID) FROM DETAILS WHERE ACCOUNT = #{account}")
	public int selectByID(String account);
	
}
