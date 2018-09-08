package com.yc.financial.dao;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

import com.yc.financial.vo.accountypeVO;

@Repository
public interface AddTypeDao {
	
	@Insert("INSERT INTO ACCOUNTYPE VALUES(NULL, #{types})")
	public Integer addAccountype(accountypeVO accountype);
}
