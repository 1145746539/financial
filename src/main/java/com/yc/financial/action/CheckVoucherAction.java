package com.yc.financial.action;

import java.sql.Timestamp;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.financial.service.CheckService;
import com.yc.financial.util.StringUtils;
import com.yc.financial.vo.DetailsVO;
import com.yc.financial.vo.PayrollVO;
import com.yc.financial.vo.UsersVO;

@Controller
public class CheckVoucherAction {
	
	@Resource
	private CheckService checkservice;

	@RequestMapping(value="/voucher.do",produces = "application/json;charset=utf-8")
	public @ResponseBody String login(String op,PayrollVO payroll,DetailsVO details,
			Model model,HttpServletRequest request,HttpServletResponse response
			,String demoReload,Integer page,Integer limit,Integer id,HttpSession session){
		String time = request.getParameter("time");
		/**
		 * 判断参数是否为空
		 */
		if(StringUtils.isBlank(time)){
			time = null;
		}
		if(StringUtils.isBlank(String.valueOf(id))){
			id = null;
		}
		UsersVO users = (UsersVO) session.getAttribute("users");
		Integer start = (page-1)*limit;
		if("checkvoucher".equals(op)){			//	查看报账信息
			System.out.println("did是："+users.getDid());
			Integer CountVoucher = checkservice.selectByMonthCount(time,users.getDid(),users.getAccount());
			List<DetailsVO> Voucherlist = checkservice.selectByPag(id, time,users.getDid(),users.getAccount(), start, limit);
			//格式化时间
			formattime(Voucherlist);
			JSONObject voucherJson = new JSONObject();
			voucherJson.put("code", 0);
			voucherJson.put("msg", "");
			voucherJson.put("count", CountVoucher);
			voucherJson.put("data", Voucherlist);
			return voucherJson.toString();
		}else if("journal".equals(op)){			//查看日记账
			Integer CountVoucher = checkservice.selectByDayCount(id,time);
			List<DetailsVO> Voucherlist = checkservice.selectForJournal(id, time,users.getDid(),users.getAccount(), start, limit);
			//格式化时间
			formattime(Voucherlist);
			JSONObject voucherJson = new JSONObject();
			voucherJson.put("code", 0);
			voucherJson.put("msg", "");
			voucherJson.put("count", CountVoucher);
			voucherJson.put("data", Voucherlist);
			return voucherJson.toString();
		}else if("examAccount".equals(op)){		//审核报账
			Integer CountVoucher = checkservice.CountExam(users.getDid(),0, time);
			List<DetailsVO> Voucherlist = checkservice.selectExam(users.getDid(), 0, time, start, limit);
			//格式化时间
			formattime(Voucherlist);
			JSONObject voucherJson = new JSONObject();
			voucherJson.put("code", 0);
			voucherJson.put("msg", "");
			voucherJson.put("count", CountVoucher);
			voucherJson.put("data", Voucherlist);
			return voucherJson.toString();
		}else if("salary".equals(op)){			//工资表
			List<PayrollVO> Salarylist = checkservice.selectByPayroll(users.getAccount());
			int CountSalary = checkservice.countCountSalary(payroll);
			JSONObject salaryJson = new JSONObject();
			salaryJson.put("code", 0);
			salaryJson.put("msg", "");
			salaryJson.put("count", CountSalary);
			salaryJson.put("data", Salarylist);
			return salaryJson.toString();
		}else{     
			return "404";
		}
	}

	private void formattime(List<DetailsVO> Voucherlist) {
		for(int i =0 ; i<Voucherlist.size();i++){
			//报账时间
			Timestamp sdate = Voucherlist.get(i).getReportime();
			String timeStr=sdate.toString().substring(0, sdate.toString().indexOf("."));
			Voucherlist.get(i).setFormatReport(timeStr);
			System.out.println("格式化后的时间："+Voucherlist.get(i).getFormatReport());
			//审核时间
			if(Voucherlist.get(i).getAuditime()!=null){
				Timestamp Adate = Voucherlist.get(i).getAuditime();
				String timeA=Adate.toString().substring(0, Adate.toString().indexOf("."));
				Voucherlist.get(i).setFormatAudi(timeA);
			}
		}
	}

}
