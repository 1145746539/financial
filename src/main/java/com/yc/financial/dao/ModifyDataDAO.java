package com.yc.financial.dao;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Controller;

import com.yc.financial.vo.UsersVO;

@Controller
public interface ModifyDataDAO {
	
	/**
	 * 根据用户编号查找用户信息
	 * @param user
	 * @return
	 */
	@Select("SELECT * FROM USERS WHERE UID=#{uid}")
	public UsersVO selectByUid(UsersVO user);

	/**
	 * 修改资料
	 * @param user
	 * @return
	 */
	@Update("UPDATE USERS SET UNAME=#{uname},PHONE=#{phone},EMAIL=#{email},DID=#{did},SEX=#{sex},UPIC=#{upic} WHERE UID=#{uid}")
	public Integer update(UsersVO user);
	
}
