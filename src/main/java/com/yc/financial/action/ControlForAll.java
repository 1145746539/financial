package com.yc.financial.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.financial.dao.UsersDAO;
import com.yc.financial.service.CheckService;
import com.yc.financial.service.LoginService;
import com.yc.financial.vo.UsersVO;

@Controller
public class ControlForAll {

	@Resource
	private LoginService loginService;
	
	@Resource
	private CheckService checkService;
	
	@Resource
	private UsersDAO dao;
	

	@RequestMapping("/userlist.for")
	public String controlUserlist(Model model,HttpSession session){
		UsersVO users = (UsersVO) session.getAttribute("users");
		if(users.getDid()!=4){
			model.addAttribute("modi", "3");
			return "index";
		}
		return "userlist";
	}
	
	@RequestMapping("/selaccount.for")
	public String controlSelAccount(Model model,HttpSession session){
		return "selAccount";
	}
	
	@RequestMapping("/account.for")
	public String controlExamAccount(Model model,HttpSession session){
		UsersVO users = (UsersVO) session.getAttribute("users");
		if(users.getDid()==1){
			model.addAttribute("modi", "3");
			return "index";
		}
		return "examAccount";
	}
	
	@RequestMapping("/journal.for")
	public String controlJournal(Model model,HttpSession session){
		UsersVO users = (UsersVO) session.getAttribute("users");
		if(users.getDid()==1){
			model.addAttribute("modi", "3");
			return "index";
		}
		return "journal";
	}
	
	@RequestMapping("/payroll.for")
	public String controlPayroll(Model model,HttpSession session){
		return "selPayroll";
	}
	
	@RequestMapping("/countNum.for")
	public @ResponseBody String CountNum(Model model,HttpSession session){
		UsersVO users = (UsersVO) session.getAttribute("users");
		Integer Count=0;
		if(users.getDid() == 1){
			Count = dao.CountNum(users.getAccount(), 0);
		}else{
			Count = checkService.CountExam(users.getDid(),0, null);
		}
		
		return String.valueOf(Count);
	}
	
}
