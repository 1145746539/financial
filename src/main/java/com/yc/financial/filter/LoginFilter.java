package com.yc.financial.filter;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yc.financial.action.LoginAction;
import com.yc.financial.service.LoginService;
import com.yc.financial.service.impl.LoginServiceImpl;
import com.yc.financial.vo.UsersVO;

@WebFilter("/LoginFilter")
public class LoginFilter implements Filter {
   
    public LoginFilter() {
    }

	public void destroy() {
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();
		
		
		String path = httpRequest.getRequestURI();
		System.out.println("URI是："+path);
		
		UsersVO user = (UsersVO)session.getAttribute("users");
		System.out.println("用户："+user);
		System.out.println("请求1："+path.indexOf("financial/login.jsp")+path.contains("login.do"));
		System.out.println("请求2："+path.endsWith("css"));
		System.out.println("请求3："+path.endsWith("js"));
		//用户未登陆
		if(user==null || "".equals(user)){
			//判断是否用户登录页面
			if(path.indexOf("financial/login.jsp")>-1||path.contains("login.do")||path.contains("allregist.do")){
				//登录页
				System.out.println("请求成功");
				chain.doFilter(httpRequest, httpResponse);
				return;
			}else if(path.endsWith("css") || path.endsWith("js")||path.endsWith("png")
					||path.endsWith("jpg")||path.endsWith("woff") ||path.endsWith("ttf") 
					||path.endsWith("ico")||path.contains("seldept.do")||path.contains("addtype.jsp")){
				//css和js
				System.out.println("请求成功");
				chain.doFilter(request, response);
				return;
			}else if(path.contains("manage/") || path.contains("regis.do")){
				System.out.println("请求成功");
				chain.doFilter(request, response);
				return;
			}else{
				httpResponse.sendRedirect("/financial/login.jsp");
			}
		}else{
			if (httpRequest.getHeader("x-requested-with") != null && httpRequest.getHeader("x-requested-with").equals("XMLHttpRequest")) { 
	            // ajax请求
				System.out.println("请求成功");
				chain.doFilter(request, response);
				return;
	        } 
			//
			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
