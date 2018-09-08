package com.yc.financial.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yc.financial.service.SubAccountService;
import com.yc.financial.vo.DeptVO;
import com.yc.financial.vo.DetailsVO;
import com.yc.financial.vo.FlowmeterVO;
import com.yc.financial.vo.UsersVO;
import com.yc.financial.vo.accountypeVO;

@Controller
public class SubAccountAction {
	
	@Resource
	private SubAccountService subaccount;
	
	@RequestMapping("/subaccount")
	public String subaccount(Model model){
		List<accountypeVO> list = subaccount.selectAccountType();
		model.addAttribute("list", list);
		//弹窗标志位 
		model.addAttribute("sign", null);
		return "insAccount";
	}
	
	@RequestMapping("/insertaccount")
	public String insertaccount(DetailsVO detail,FlowmeterVO flowmeter,DeptVO dept,Model model,
			HttpServletRequest request,HttpSession session) throws ParseException{
		/**
		 * 存时间
		 */
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dd = df.format(date);
		java.util.Date udate = df.parse(dd);
		java.sql.Timestamp sdate = new java.sql.Timestamp(udate.getTime());//类型转换
		detail.setReportime(sdate);
		String allmoney = request.getParameter("allmoney");
		detail.setAllmoney(Double.parseDouble(allmoney));
		int i = subaccount.insertaccount(detail);
		List<accountypeVO> list = subaccount.selectAccountType();
		model.addAttribute("list", list);
		if(i>0){
			UsersVO users = (UsersVO) session.getAttribute("users");
			System.out.println(allmoney+ "......" + detail.getMoney() + "---" + users.getDid());
			//	流水表增加了1条数据
			int id = subaccount.selectByID(detail.getAccount());
			int did = subaccount.insertFlowmeter(id,2);
			//弹窗标志位
			model.addAttribute("sign", "ok");
			return "insAccount";
		}else{
			//弹窗标志位
			model.addAttribute("sign", "no");
			return "insAccount";
		}
	}
}
