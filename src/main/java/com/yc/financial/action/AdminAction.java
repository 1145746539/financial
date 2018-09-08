package com.yc.financial.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.financial.service.AddTypeService;
import com.yc.financial.vo.accountypeVO;

@Controller
public class AdminAction {
	
	@Resource
	private AddTypeService addTypeservice;
	
	@RequestMapping(value = "/admin.do", produces = "application/json;charset=utf-8")
	public @ResponseBody String AddmyDept(Model model, HttpServletRequest request, accountypeVO accountype){
		String types = request.getParameter("types");
		
		Integer list = addTypeservice.addNewType(accountype);
		
		if(list > 0){
			return "1";
		}
		return "0";
	}
	
}
