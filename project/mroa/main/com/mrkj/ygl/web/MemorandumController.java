package com.mrkj.ygl.web;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mrkj.ygl.entity.mome.Memorandum;
import com.mrkj.ygl.service.MemorandumService;

@Controller
public class MemorandumController {

	@Resource
	MemorandumService memoService;
	
	@RequestMapping(value="saveMemorandum")
	public ModelAndView savaMemorandum (HttpServletRequest request,Memorandum memo){
		ModelAndView mav = new ModelAndView("redirect:/mainContent");
		
		String memo_id = memo.getMemo_id();
		String username = (String)request.getSession().getAttribute("UserName");
		if (memo_id==null||"".equals(memo_id.trim())){
			//保存
			memo.setMemo_id(UUID.randomUUID().toString());
			memo.setUsername(username);
			memoService.saveMemorandum(memo);
			
		}
		
		return mav;
	}
	
	@RequestMapping(value="findAllMemorandum")
	@ResponseBody
	public Map<String,Object> findAllMemorandum (HttpServletRequest request){
		
		String username = (String)request.getSession().getAttribute("UserName");

		return memoService.selectMemorandum(username);
	}
}
