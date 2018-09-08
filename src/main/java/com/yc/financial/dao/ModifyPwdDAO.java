package com.yc.financial.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface ModifyPwdDAO {
	
	/**
	 * 修改密码
	 * @param upwd
	 * @param email
	 * @return
	 */
	@Update("UPDATE USERS SET UPWD = #{upwd} WHERE EMAIL=#{email}")
	public Integer update(@Param("upwd")String upwd,@Param("email")String email);

	/**
	 * 根据邮箱查找用户
	 * @param email
	 * @return
	 */
	@Select("SELECT * FROM USERS WHERE EMAIL=#{email}")
	public Integer selectByEmail(String email);
	
}
