package com.mrkj.ygl.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.stat.TableStat.Mode;
import com.mrkj.ygl.entity.plan.PlanWork;
import com.mrkj.ygl.service.PlanWorkService;
import com.mrkj.ygl.service.SystemPluService;

@Controller
public class PlanWorkController {

	@Resource
	PlanWorkService ps;
	
	@Resource
	SimpleDateFormat sdf;
	@Resource
	SystemPluService syspluService;
	
	@RequestMapping("/savePlanWork")
	public ModelAndView savePlanWork (HttpServletRequest request,PlanWork planWork){
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("UserName");
		
		//填充实体类，设置ID
		planWork.setPlan_id(UUID.randomUUID().toString());
		//创建人
		planWork.setPlan_creat(username);
		//时间格式转化
		sdf.applyPattern("yyyy-MM-dd hh:mm:ss");
		//设置创建时间
		planWork.setPlan_creatime(sdf.format(new Date()));
		//根据用户名获取真实姓名
		Map<String, Object> result=syspluService
				                            .getWxnameByUsername(planWork.getPlan_to());
		//接收人姓名
		planWork.setPlan_update((String)result.get("wxname"));
		//更新时间
		planWork.setPlan_updatetime(sdf.format(new Date()));
		//标记,申报标记为1申报状态,2同意,3不同意
		planWork.setPlan_flag("1");
		//如果保存成功返回1，重新刷新前台页面，不等于1，则返回报错页面
		if (ps.savePlanWork(planWork)==1){
			mav.setViewName("redirect:/mainContent");
		}else {
			mav.setViewName("redirect:/500.jsp");
		}
		
		return mav;
		
	}
	
	@RequestMapping(value="/updatePlanWork")
	public ModelAndView updatePlanWork (HttpServletRequest request,PlanWork planWork){

		
		ps.updateHC(planWork);
		
		return goToday(request,null);
	}
	
	@RequestMapping(value="/getContent")
	@ResponseBody
	public Map<String,Object> getContent(HttpServletRequest request,Integer page){
		Map<String,Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("UserName");
		Integer tempPage = page;
		if (tempPage >0){
			tempPage = (tempPage-1)*7;
		}
		List<Map<String, Object>> pw7 = ps.selectPlanWork(tempPage,7,username);
		if (pw7!=null &&pw7.size()>0){
			map.put("success", true);
			map.put("data", pw7);
			map.put("page", page);
		}else{
			map.put("success", false);
		}
		
		return map;
	}
	
	@RequestMapping(value="/planGoToday")
	@ResponseBody
	public ModelAndView goToday (HttpServletRequest request,Integer page){
		ModelAndView mav = new ModelAndView("plan/planwork");
		
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("UserName");
		//获取最近7条上报数据
		mav.addObject("top7",ps.selectByPlanTo(0,7,username,"1"));
		//总数
		long count = ps.selectPlanToCount(username);
		mav.addObject("count",count);
		//行数
		mav.addObject("row",7);
		
		if(count%7>0){
			mav.addObject("lastPage",count/7+1);
		}else{
			mav.addObject("lastPage",count/7);
		}
		
		//查找已完成的
		mav.addObject("top7Over",ps.selectByPlanToFlag23(0,7,username,"1"));
		//总数
		long countOver = ps.selectPlanToCount23(username);
		mav.addObject("countOver",countOver);
		
		if(count%7>0){
			mav.addObject("lastPageOver",countOver/7+1);
		}else{
			mav.addObject("lastPageOver",countOver/7);
		}
		
		return mav;
	}
	
	@RequestMapping(value="/planGoAll")
	@ResponseBody
	public Map<String,Object> goAll (HttpServletRequest request,Integer page){
		Map<String,Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("UserName");
		Integer tempPage = page;
		if (tempPage >0){
			tempPage = (tempPage-1)*7;
		}
		List<Map<String, Object>> pw7 = ps.selectByPlanTo(tempPage,7,username,"1");
		if (pw7!=null &&pw7.size()>0){
			map.put("success", true);
			map.put("data", pw7);
			map.put("page", page);
		}else{
			map.put("success", false);
		}
		
		return map;
	}
	
	@RequestMapping(value="/planByid")
	@ResponseBody
	public Map<String,Object> planByid (String plan_id){
		return ps.selectById(plan_id);
	}
	
}
