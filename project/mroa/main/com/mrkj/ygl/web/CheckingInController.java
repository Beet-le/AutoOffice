package com.mrkj.ygl.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mrkj.ygl.entity.ckin.CheckingIn;
import com.mrkj.ygl.service.CheckIngInService;
import com.mrkj.ygl.service.SystemPluService;

@Controller
public class CheckingInController {
	
	@Resource
	SimpleDateFormat sdf;
	@Resource
	CheckIngInService ckinService;
	@Resource
	SystemPluService syspluService;
	
	@RequestMapping(value="ckin")
	@ResponseBody
	public Map<String,Object> ckin (HttpServletRequest request,CheckingIn ckin){
		Map<String,Object> result = new HashMap<String, Object>();
		String username = (String)request.getSession().getAttribute("UserName");
		ckin.setCkin_id(UUID.randomUUID().toString());
		ckin.setUsername(username);
		Date today = new Date();
		sdf.applyPattern("yyyy-MM-dd");
		ckin.setCkin_date(sdf.format(today));
		sdf.applyPattern("hh:mm:ss");
		ckin.setCkin_times(sdf.format(today));
		if (ckinService.ckin(ckin)==1){								//判断打卡是否成功
			result.put("success", true);
			result.put("msg", "打卡时间:"+sdf.format(today));
		}else{
			result.put("success", false);
			result.put("msg", "每天打卡不得超过八次:"+sdf.format(today));
		}
		
		return result;
	}
	
	@RequestMapping(value="findCkin")
	@ResponseBody
	public Map<String,Object> findCkin (HttpServletRequest request,CheckingIn ckin){
		Map<String,Object> result = new HashMap<String, Object>();
		String username = (String)request.getSession().getAttribute("UserName");
		ckin.setUsername(username);
		Date today = new Date();
		sdf.applyPattern("yyyy-MM-dd");
		ckin.setCkin_date(sdf.format(today));
		sdf.applyPattern("hh:mm:ss");
		ckin.setCkin_times(sdf.format(today));
		result =ckinService.FindTodayCkin(ckin);
		if (result!=null){
			result.put("isEmpty", false);
		}else{
			result = new HashMap<String,Object>();
			result.put("isEmpty", true);
		}
		
		return result;
	}
	
	@RequestMapping(value="goCkin")
	public ModelAndView goCkin(HttpServletRequest request,String username
			,String defaultDay){
		ModelAndView mav = new ModelAndView("ckin/ckin");
		
		if (defaultDay==null){
			Date today = new Date();
			sdf.applyPattern("yyyy-MM-dd");
			mav.addObject("today", sdf.format(today));
		}else{
			mav.addObject("today", defaultDay);
		}
		
		if (username==null){
			mav.addObject("usname", request.getSession().getAttribute("UserName"));
		}else{
			mav.addObject("usname", username);
		}
		
		mav.addObject("department",syspluService.getDepartment());
		
		return mav;
	}
	
	@RequestMapping(value="getUser")
	@ResponseBody
	public List<Map<String,Object>> getUser(String role_group){
		
		return syspluService.getUserByRole(role_group);
		
	}
	
	@RequestMapping(value="monthCkin")
	@ResponseBody
	public List<Map<String,Object>> monthCkin(HttpServletRequest request,String start
			,String end,String username) throws ParseException{
		List<Map<String,Object>> result = new ArrayList<>();
		//获取6周42天内的数据
		result = ckinService.findMonthCkin(username, start, end);
		
		return result;
	}
	
	
}
