package com.yc.financial.dao;

import java.util.List;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.yc.financial.vo.UsersVO;

@Repository
public interface UsersDAO {
	
	/**
	 * 查询用户密码进行登录
	 * @param users
	 * @return
	 */
	@Select("SELECT * FROM USERS WHERE ACCOUNT=#{account} AND UPWD=#{upwd}")
	List<UsersVO> selectByLogin(UsersVO users);
	
	/**
	 * 执行注册功能
	 * @param users
	 * @return
	 */
	@Insert("INSERT INTO USERS (ACCOUNT,UPWD,DID) VALUES(#{account},#{upwd},#{did})")
	Integer selectByRegist(UsersVO users);
	
	/**
	 * 完善个人资料
	 * @param users
	 * @return
	 */
	
	@Update("UPDATE USERS SET UNAME=#{uname},UPWD=#{upwd},PHONE=#{phone},EMAIL=#{email},SEX=#{sex},UPIC=#{upic} WHERE ACCOUNT=#{account}")
	Integer AddInfo(UsersVO users);
	
	/**
	 * 查询用户编号
	 * @param user
	 * @return
	 */
	@Select("SELECT * FROM USERS WHERE UID=#{uid}")
	public UsersVO selectByUid(UsersVO user);

	/**
	 * 查询用户账号
	 * @param users
	 * @return
	 */
	@Select("SELECT * FROM USERS WHERE ACCOUNT=#{account}")
	List<UsersVO> selectByAccount(UsersVO users);
	
	/**
	 * 查询用户编号
	 * @param user
	 * @return
	 */
	@Select("SELECT * FROM USERS WHERE DID=#{did}")
	public UsersVO selectByDid(UsersVO user);
	
	/**
	 * 查询部门编号
	 * @param users
	 * @return
	 */
	@Select("SELECT COUNT(state) FROM FLOWMETER WHERE DID=#{did}")
	public Integer CountDid(Integer did);
	
	/**
	 * 未处理报账显示的数据
	 * @param account
	 * @param state
	 * @return
	 */
	@Select("SELECT COUNT(*) FROM details WHERE account=#{account} and STATE=#{state}")
	public Integer CountNum(@Param("account")String account,@Param("state")Integer state);
	
}
