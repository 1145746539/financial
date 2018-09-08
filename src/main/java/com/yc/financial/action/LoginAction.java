package com.yc.financial.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.financial.service.LoginService;
import com.yc.financial.service.RegistService;
import com.yc.financial.service.SelUserlistService;
import com.yc.financial.util.MD5Utils;
import com.yc.financial.vo.DeptVO;
import com.yc.financial.vo.UsersVO;

@Controller
public class LoginAction {
	
	@Resource
	private LoginService loginService;
	
	@Resource
	private SelUserlistService ulistservice;
	
	@Resource
	private RegistService registservice;
	
	private MD5Utils md5;
	
	@RequestMapping("/login.do")
	public String login(UsersVO users,
			HttpServletRequest request,Integer count,
			HttpSession session,Model model,DeptVO dept){
		//	密文转换登录
		String upwd = md5.GetMD5Code(request.getParameter("upwd"));
		users.setUpwd(upwd);
		List<UsersVO> list=loginService.Login(users);
		if(list.size()>0){
			if (list.get(0).getUname() == null) {
				// 证明是个新的账号
				String account = list.get(0).getAccount();
				//将账号存起来
				model.addAttribute("account", account);
				//存账号密码
				session.setAttribute("users", list.get(0));
				System.out.println("新的账号");
				//返回到完善资料页面
				return "addInfo";
			} else { // 老账号
			DeptVO list1=registservice.selectDeptByDid(list.get(0).getDid());
			//	意味登陆成功
			session.setAttribute("users", list.get(0));
			session.setAttribute("dept",list1);
			List<DeptVO> list2=ulistservice.selectDept();
			session.setAttribute("list2", list2);
			//	得到users里的值
			UsersVO users1 = (UsersVO) session.getAttribute("users");
			count = loginService.CountDid(users1.getDid());
			String upic = list.get(0).getUpic();
			String pic = null;
			if(upic!=null){
				pic = upic.substring(upic.lastIndexOf('\\'));
			}
			session.setAttribute("fileName", pic);
			model.addAttribute("modi", "2");
			return "index";
		}
	}else{
			request.setAttribute("del", "1");
			return "login";
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request){
		request.getSession().invalidate();
		return "login";
	}
	
}
