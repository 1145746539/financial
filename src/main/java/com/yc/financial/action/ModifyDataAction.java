package com.yc.financial.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yc.financial.service.ModifyDataService;
import com.yc.financial.vo.UsersVO;

@Controller
public class ModifyDataAction {
	
	@Resource
	private ModifyDataService service;
	
	@RequestMapping(value="/intoMdData")
	public String updatePicture(@RequestParam("file") MultipartFile file,
			UsersVO user,String VerificationCode,String newemail,HttpServletRequest reuqest,
			HttpSession session ) throws IllegalStateException, IOException{
		//	判断图片是否为空
		if (!file.isEmpty()) {
			String oldName = file.getOriginalFilename();
			String fileName = changeName(oldName);
	    	File f = new File("f:\\picture\\"+fileName);
	    	session.setAttribute("fileName", fileName);
	    	file.transferTo(f) ;
	    	user.setUpic(f.getPath());
		}else {
			//没修改图片
			user.setUpic(service.selectByUid(user).getUpic());
		}
		//	取得前端得到的邮箱和验证码
	    	String Veremail = (String) session.getAttribute("email");
	    	String ver = (String) session.getAttribute("Ver");
	    	//	判断验证码已经邮箱验证
	    	if(ver!=null && VerificationCode!=null&&newemail!=null){
	    		//修改了邮箱
	    		if(Veremail.equals(newemail) && ver.equals(VerificationCode)){
		    		user.setEmail(Veremail);
		    		Integer in = service.update(user);
		    		if(in!=null){
		    			//修改成功
		    			reuqest.setAttribute("modi", "1");
		    			return "index";
		    		}
		    	}
	    	}else{
	    		//没修改邮箱
	    		user.setEmail(service.selectByUid(user).getEmail());
	    	}
	    	//	修改资料
	    	Integer in = service.update(user);
	    	if(in!=null){
	    		reuqest.setAttribute("modi", "1");
	    	}
			return "index";
	}
	
	public static String changeName(String oldName){
        Random r = new Random();
        Date d = new Date();
        String newName = oldName.substring(oldName.indexOf('.'));
        newName = r.nextInt(99999999) + d.getTime() + newName;
        return newName;
    }

}
