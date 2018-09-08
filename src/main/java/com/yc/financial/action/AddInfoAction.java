/*package com.yc.financial.action;

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
import org.springframework.web.multipart.MultipartFile;

import com.yc.financial.service.AddInfoService;
import com.yc.financial.service.LoginService;
import com.yc.financial.service.RegistService;
import com.yc.financial.vo.DeptVO;
import com.yc.financial.vo.UsersVO;

@Controller
public class AddInfoAction {

	@Resource
	private AddInfoService addinfoService;
	
	@Resource
	private RegistService registservice;
	
	@Resource
	private LoginService loginService;
	
	@RequestMapping(value="/allregist.do",produces = "application/json;charset=utf-8")
	public String addinfo(@RequestParam("file") MultipartFile file,Model model,UsersVO users ,
			DeptVO dept,HttpSession session,HttpServletRequest request) throws IllegalStateException, IOException{
		//	判断图片是否为空
		if (!file.isEmpty()) {
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
		//	查找部门
		List<DeptVO> list=loginService.SelectByDept(dept);
		session.setAttribute("dept",list.get(0));
		String account = (String) session.getAttribute("account");
		users.setAccount(account);
		//	查找账号
		List<UsersVO> list1 = registservice.selectByAccount(users);
		//	取出前端dept的值
		DeptVO dept1 = (DeptVO) session.getAttribute("dept");
		String did = request.getParameter("did");
		//	查询用户ID以便于添加
		DeptVO dept2 = registservice.selectByStaffNum(did);
		//	设置参数得到数量
		int num = dept2.getStaff();
		//	判断是否是第一个注册该职位的
		if(num==0){
			//	根据员工ID修改员工数量
			registservice.UpdateStaffNum(1,did );
		}else if(num>0){
			//	根据员工ID修改员工数量
			registservice.UpdateStaffNum(dept2.getStaff() + 1,did );
		}else{
			System.out.println("报错了");
		}
		//	注册
		addinfoService.AddInfo(users);
		return "addInfo";
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
*/