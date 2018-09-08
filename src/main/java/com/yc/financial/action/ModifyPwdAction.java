package com.yc.financial.action;

import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.financial.dao.ModifyPwdDAO;

@Controller
public class ModifyPwdAction {
	
	@Resource
	private ModifyPwdDAO dao;
	
	@RequestMapping(value="/modifyPwd")
	public String modifyPwd(String email,String VerificationCode,HttpSession session,
			String newPwd1,String newPwd2,Model model){
		String ver = (String) session.getAttribute("Ver");
		//	判断原密码与新密码是否核实，以及邮箱验证码
		if(newPwd1.equals(newPwd2) && VerificationCode.equals(ver)){
			String upwd = newPwd1;
			dao.update(upwd, email);
			model.addAttribute("modify", true);
			return "modifypwd";
		}
		model.addAttribute("modify", false);
		return "modifypwd";
	}
	
	@RequestMapping(value="/modifyEmail")
	public @ResponseBody String modifyEmail(String email,HttpSession session,String jspType){
		if(email.endsWith("@qq.com") || email.endsWith("@163.com") || email.endsWith("@126.com")){
			//修改资料界面和修改密码界面公用一个验证。默认修改资料
			Integer sign = null;
			//密码修改页面
			if(jspType.equals("pwd")){
				sign = dao.selectByEmail(email);
				//数据库中没找到这个邮箱
				if(sign ==null){
					return "null";
				}
				
			}
			try {
				HtmlEmail Email=new HtmlEmail();
				Email.setHostName("smtp.163.com");
				Email.setCharset("utf-8");
				Email.addTo(email);
				Email.setFrom("18397716367@163.com","报账平台");
				Email.setAuthentication("18397716367@163.com", "zs1997");//此处填写邮箱地址和客户端授权码
				Email.setSubject("报账平台");
				String math=getMath();
				session.setAttribute("Ver", math);
				session.setAttribute("email", email);
				Email.setMsg(math);
				Email.send();
			} catch (EmailException e) {
				e.printStackTrace();
			}
			return "yes";
		}else{
			return "no";
		}
	
	}

	private String getMath() {
		String code = "";
		Random r=new Random();
		for(int i=0;i<6;i++){
			code+=r.nextInt(10);
		}
		return code;
	}

	
	

}
