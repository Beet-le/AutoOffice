package com.mrkj.ygl.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mrkj.ygl.entity.login.Sys_login;
import com.mrkj.ygl.service.CustomSystemService;
import com.mrkj.ygl.service.PlanWorkService;
import com.mrkj.ygl.standard.Util;

@Controller
public class Index {
	
	@Resource
	CustomSystemService css;
	@Resource
	PlanWorkService pws;
	
	@RequestMapping(value={"/index","/index.do","/index.html","index.action"})
	@RequiresAuthentication
	public ModelAndView index(HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView("main");
		
		HttpSession session = request.getSession();
		Sys_login loginEntity = (Sys_login)session.getAttribute("loginEntity");
		
		mav.addObject("loginEntity", loginEntity);
		
		return mav;
	} 
	
	@RequestMapping(value="/mainContent")
	public ModelAndView mainContent (HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView("plan/shouye");
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("UserName");
		
		//获取部门主管
		mav.addObject("bmzgs", css.selectUserByRole("0"));
		//获取最近7条上报数据
		mav.addObject("top7",pws.selectPlanWork(0,7,username));
		//总数
		long count = pws.selectPlanWorkCount(username);
		mav.addObject("count",count);
		//总数
		mav.addObject("row",7);
		
		if(count%7>0){
			mav.addObject("lastPage",count/7+1);
		}else{
			mav.addObject("lastPage",count/7);
		}
		
		return mav;
	}
	
}
