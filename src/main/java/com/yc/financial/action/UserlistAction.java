package com.yc.financial.action;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.financial.service.LoginService;
import com.yc.financial.service.SelUserlistService;
import com.yc.financial.util.StringUtils;
import com.yc.financial.vo.DeptVO;
import com.yc.financial.vo.UsersVO;

@Controller
public class UserlistAction {
	@Resource
	UsersVO users;

	@Resource
	private LoginService loginService;
	
	@Resource
	private SelUserlistService ulistservice;
	
	@RequestMapping(value="/userlist.do",produces = "application/json;charset=utf-8")
	public @ResponseBody String selUserlist(String op, HttpServletRequest req, Model model, 
			Integer page,Integer limit,HttpSession session,DeptVO dept) throws IOException, ServletException {
		
		//	从前台获得值做非空判断
		String uname = req.getParameter("uname");
		System.out.println("uname="+uname);
		if(StringUtils.isBlank(uname)){
			uname = null;
		}
		String sdid=req.getParameter("did");
		System.out.println(sdid + "........");
		Integer did = null;
		if(StringUtils.isBlank(sdid)){
			did = null;
		}else{
			did=Integer.parseInt(sdid);
		}
		System.out.println("did="+did);
		
		//从哪里开始分页
		Integer start = (page-1)*limit;
		if("fenye".equals(op)){
			//查询员工列表总数
			int ret = ulistservice.count(users);
			
			//开始分页
			List<UsersVO> Userslist = ulistservice.selectByPag(uname, did,start, limit);
			
			JSONObject JsonOb = new JSONObject();
			JsonOb.put("code", 0);
			JsonOb.put("msg", "");
			JsonOb.put("count", ret);
			JsonOb.put("data", Userslist);
			
			return JsonOb.toString();
		} else{
			return "404";
		}
	}

}
