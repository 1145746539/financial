package com.yc.financial.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface ExamDAO {
	
	/**
	 * 审核报账，修改状态值
	 * @param id
	 * @param did
	 * @param note
	 * @param state
	 * @return
	 */
	@Update("UPDATE flowmeter set state=#{state} , remarks=#{note} WHERE id=#{id} AND did=#{did}")
	public Integer updataFlowOne(@Param("id")Integer id, @Param("did")Integer did,@Param("note")String note,@Param("state")int state);
	
	/**
	 * 录凭证的时候，往流水表加入一条数据
	 * @param id
	 * @param did
	 * @return
	 */
	@Insert("INSERT INTO FLOWMETER(ID,DID,STATE,REMARKS) VALUES(#{id},#{did},0,NULL)")
	public int insertFlowmeter(@Param("id")Integer id,@Param("did")Integer did);
	
	/**
	 * 总经理审核通过之后，修改明细表的状态为通过
	 * @param id
	 * @param state
	 * @return
	 */
	@Update("UPDATE details SET state=#{state} WHERE id=#{id}")
	public Integer updataDetails(@Param("id")Integer id,@Param("state")Integer state);

}
