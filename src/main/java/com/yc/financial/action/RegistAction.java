package com.yc.financial.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yc.financial.service.AddInfoService;
import com.yc.financial.service.LoginService;
import com.yc.financial.service.RegistService;
import com.yc.financial.util.MD5Utils;
import com.yc.financial.vo.DeptVO;
import com.yc.financial.vo.UsersVO;

@Controller
public class RegistAction {

	private MD5Utils md5;
	
	@Resource
	private LoginService loginService;
	
	@Resource
	private RegistService registservice;
	
	@Resource
	private AddInfoService addInfoservice;
	
	@RequestMapping(value = "/regist.do", produces = "application/json;charset=utf-8")
	public @ResponseBody String regist(UsersVO users, Model model, HttpServletRequest request, HttpSession session) {
		// 获取前端参数
		String account = request.getParameter("account");
		String newpwd =  request.getParameter("newpwd");
		Integer did = Integer.parseInt(request.getParameter("did"));
		// 将数据库以密文形式存入
		String upwd = md5.GetMD5Code(newpwd);
		users.setUpwd(upwd);
		Integer list = registservice.Regist(users);
		DeptVO dept2 = registservice.selectDeptByDid(users.getDid());
		if (list > 0) {
			registservice.UpdateStaffNum(dept2.getStaff() + 1,users.getDid());
			return "1";
		}
		return "0";
	}
	
	@RequestMapping(value="/seldept.do")
	public String selDept(Model model){
		List<DeptVO> list1 = registservice.selectDept();
		model.addAttribute("list1", list1);
		if(list1.size()>0){
			//查到值了
			for(DeptVO list : list1){
				System.out.println(list);
			}
		}
		return "/manage/addstaff";
	}
	
	@RequestMapping(value="/allregist.do")
	public String allRegist(@RequestParam("file") MultipartFile file,UsersVO users, 
			HttpServletRequest request,HttpSession session) throws IllegalStateException, IOException{
		
		//	判断图片是否为空
		if (!file.isEmpty()) {
			System.out.println("进来了2");
			String oldName = file.getOriginalFilename();
			String fileName = changeName(oldName);
			//	定义图片路径
	    	File f = new File("f:\\picture\\"+fileName);
	    	session.setAttribute("fileName", fileName);
	    	file.transferTo(f) ;
	    	users.setUpic(f.getPath());
		}else {
			//没上传
			users.setUpic(null);
		}
		// 将数据库以密文形式存入
		String upwd = md5.GetMD5Code(users.getUpwd());
		users.setUpwd(upwd);
		Integer list2 = addInfoservice.AddInfo(users);
		if(list2>0){
			//通过账号密码查这个人
			List<UsersVO> list=loginService.Login(users);
			session.setAttribute("users", list.get(0));
			DeptVO list1=registservice.selectDeptByDid(list.get(0).getDid());
			session.setAttribute("dept",list1);
		}
		return "index";
	}
	
	//	图片命名
	public static String changeName(String oldName){
        Random r = new Random();
        Date d = new Date();
        String newName = oldName.substring(oldName.indexOf('.'));
        newName = r.nextInt(99999999) + d.getTime() + newName;
        return newName;
    }
}