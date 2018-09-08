package com.yc.financial.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.yc.financial.vo.DeptVO;
import com.yc.financial.vo.DetailsVO;
import com.yc.financial.vo.UsersVO;
/**
 * 对用户方面的Dao操作
 * @author 朱毅东
 *
 */
@Repository
public interface SelUserlistDAO {
	
	/**
	 * 查看用户表
	 * @return
	 */
	@Select("SELECT * FROM USERS")
	public List<UsersVO> selectUserlist();
	
	/**
	 * 模糊查询姓名。查找信息
	 * @param uname
	 * @return
	 */
	@Select("SELECT * FROM USERS WHERE UNAME LIKE CONCAT('%', #{UNAME},'%') ")
	public List<UsersVO> selByUname(String uname);
	
	/**
	 * pages指返回记录行的偏移量   rows指定返回记录行的最大数目
	 * @param pages
	 * @param rows
	 * @return
	 */
	@Select("SELECT * FROM USERS LIMIT #{PAGES},#{ROWS}")
	public List<UsersVO> seluserPage(int pages, int rows);
	
	/**
	 * 查总记录数
	 * @param users
	 * @return
	 */
	@Select("SELECT COUNT(*) CNT FROM USERS WHERE 1=1")
	public int count(UsersVO users);
	
	/**
	 *  按条件分页查询
	 * @param uname
	 * @param did
	 * @param start
	 * @param size
	 * @return
	 */
	List<UsersVO> selectByPag(@Param("uname")String uname,@Param("did")Integer did,@Param("start")Integer start,@Param("size")Integer size);
	
}
