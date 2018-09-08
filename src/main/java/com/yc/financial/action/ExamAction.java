package com.yc.financial.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.financial.service.ExamService;
import com.yc.financial.vo.UsersVO;

@Controller
public class ExamAction {
	
	@Resource
	private ExamService serv;

	/**
	 * 审核
	 */
	@RequestMapping(value="/examOne")
	public @ResponseBody String examOne(HttpServletRequest request , String ex){
		UsersVO user = (UsersVO) request.getSession().getAttribute("users");
		String note = request.getParameter("note");
		Integer id = Integer.parseInt(request.getParameter("id"));
		Integer did = user.getDid();
		int state = 0;
		System.out.println("note="+note);
		//初级审核。修改流水表第一步。 id 明细表id  did 部门等级  note 备注  state  状态
		if(ex.equals("pass")){
			//成功，修改状态值
			state = 1;
			serv.updataFlowOne(id, did, note,state);
			/*判断等级  did=2 我现在是财务部 。   成功后往流水表加数据
				did=3 我现在是财务部经理 。   成功后往流水表加数据 
			 	did=4 我现在是总经理 。  成功后修改账单明细表的状态  0 ==》 1
			 */
			if(did==2){
				did=3;
				serv.insertFlow(id,did);
				return String.valueOf(state);
			}else if(did==3){
				did=4;
				serv.insertFlow(id,did);
				return String.valueOf(state);
			}else if(did==4){
				serv.updataDetails(id, state);
			}
		}else{
			//失败，修改流水状态值,修改账单明细表
			state = 2;
			serv.updataFlowOne(id, did, note,state);
			serv.updataDetails(id, state);
			return String.valueOf(state);
		}
		return String.valueOf(state);
	}
}
