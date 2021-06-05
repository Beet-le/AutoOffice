package com.mrkj.ygl.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.mrkj.ygl.entity.plan.PlanWork;

@Service
public class PlanWorkService {

	@Resource
	JdbcTemplate jdbc;
	@Resource
	SimpleDateFormat sdf;
	/**
	 * 
	 * @param planWork
	 * @return
	 */
	
	public int savePlanWork (PlanWork planWork){
		//SQL语句，向plan_work表插入一条数据
		String saveSql = "INSERT INTO plan_work (plan_id,plan_content,plan_title,"
					   + "plan_creat,plan_to,plan_creatime,plan_updatetime,plan_flag,"
					   + "plan_update,plan_yxj,plan_fzd,plan_start,plan_end) "
					   + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		//根据以上SQL语句，给出对应参数
		int i = jdbc.update(saveSql  ,planWork.getPlan_id(),planWork.getPlan_content(),
							planWork.getPlan_title(),planWork.getPlan_creat(),
							planWork.getPlan_to(),planWork.getPlan_creatime(),
							planWork.getPlan_updatetime(),planWork.getPlan_flag(),
							planWork.getPlan_update(),planWork.getPlan_yxj(),
							planWork.getPlan_fzd(),planWork.getPlan_start(),
							planWork.getPlan_end());
		return i;
	}
	
	
	public List<Map<String,Object>> selectPlanWork (Integer page,Integer offset
			,String username){
		
		String sql = "SELECT * FROM plan_work where plan_creat = ? ORDER BY "
				+ "plan_creatime DESC LIMIT ?,?";
		
		if (offset == null){
			offset = 7;
		}
		
		if (page == null){
			page = 0;
		}
		
		List<Map<String, Object>> list = jdbc.queryForList(sql, username,page,offset);
		sdf.applyPattern("yyyy-MM-dd hh:mm:ss");
		for (Map<String, Object> map : list){
			Timestamp plan_creatime = (java.sql.Timestamp)map.get("plan_creatime");
			map.put("plan_creatime", sdf.format(new Date(plan_creatime.getTime())));
			Timestamp plan_updatetime = (java.sql.Timestamp)map.get("plan_updatetime");
			map.put("plan_updatetime", sdf.format(new Date(plan_updatetime.getTime())));
			Timestamp plan_start = (java.sql.Timestamp)map.get("plan_start");
			map.put("plan_start", sdf.format(new Date(plan_start.getTime())));
			Timestamp plan_end = (java.sql.Timestamp)map.get("plan_end");
			map.put("plan_end", sdf.format(new Date(plan_end.getTime())));
		}
		
		return list;
	}
	
	public long selectPlanWorkCount (String username){
		
		String sql = "SELECT count(plan_id) FROM plan_work WHERE plan_creat = ?";
		Map<String, Object> result = jdbc.queryForMap(sql,username);
		return (long)result.get("count(plan_id)");
	}
	
	public long selectPlanToCount (String username){
		
		String sql = "SELECT count(plan_id) FROM plan_work WHERE "
				+ "plan_to = ? AND plan_flag= 1";
		Map<String, Object> result = jdbc.queryForMap(sql,username);
		return (long)result.get("count(plan_id)");
	}
	
	public long selectPlanToCount23 (String username){
		
		String sql = "SELECT count(plan_id) FROM plan_work WHERE "
				+ "plan_to = ? AND plan_flag<> 1";
		Map<String, Object> result = jdbc.queryForMap(sql,username);
		return (long)result.get("count(plan_id)");
	}
	
	public List<Map<String,Object>> selectByPlanTo (Integer page,Integer offset
			,String username,String plan_flag){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		//根据plan_to与flag查找任务，1申报中,2同意,3不同意
		String sql = "SELECT plan_id," + "plan_content,plan_title,plan_creat,plan_to,"
		           + "plan_creatime,plan_updatetime,plan_flag,plan_update,plan_yxj,"
			       + "plan_fzd,plan_start,plan_end,wxname FROM plan_work pw LEFT JOIN "
	               + "sys_login sl ON pw.plan_creat = sl.username "
				   + "where plan_to = ? AND plan_flag= ? ORDER BY "
				   + "plan_creatime DESC LIMIT ?,?";
		//设置默认的偏移量
		if (offset == null){
			offset = 7;
		}
		//设置页数
		if (page == null){
			page = 0;
		}
		//执行SQL语句
		result = jdbc.queryForList(sql,username,plan_flag,page,offset);
		//SimpleDateFormat sdf日期格式化
		sdf.applyPattern("yyyy-MM-dd hh:mm:ss");
		//格式化时间格式
		for (Map<String, Object> map : result){
			Timestamp plan_creatime = (java.sql.Timestamp)map.get("plan_creatime");
			map.put("plan_creatime", sdf.format(new Date(plan_creatime.getTime())));
			Timestamp plan_updatetime = (java.sql.Timestamp)map.get("plan_updatetime");
			map.put("plan_updatetime", sdf.format(new Date(plan_updatetime.getTime())));
			Timestamp plan_start = (java.sql.Timestamp)map.get("plan_start");
			map.put("plan_start", sdf.format(new Date(plan_start.getTime())));
			Timestamp plan_end = (java.sql.Timestamp)map.get("plan_end");
			map.put("plan_end", sdf.format(new Date(plan_end.getTime())));
		}
		
		return result;
	}
	
	public List<Map<String,Object>> selectByPlanToFlag23 (Integer page,Integer offset
			,String username,String plan_flag){
		List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
		
		String sql = "SELECT plan_id,plan_content,plan_title,plan_creat,plan_to,"
		           + "plan_creatime,plan_updatetime,plan_flag,plan_update,plan_yxj,"
				   + "plan_fzd,plan_start,plan_end,wxname FROM plan_work pw "
				   + "LEFT JOIN sys_login sl ON pw.plan_creat = sl.username "
				   + "where plan_to = ? AND plan_flag<> ? "
				   + "ORDER BY plan_creatime DESC LIMIT ?,?";
		
		if (offset == null){
			offset = 7;
		}
		
		if (page == null){
			page = 0;
		}
		
		result = jdbc.queryForList(sql,username,plan_flag,page,offset);
		
		sdf.applyPattern("yyyy-MM-dd hh:mm:ss");
		for (Map<String, Object> map : result){
			Timestamp plan_creatime = (java.sql.Timestamp)map.get("plan_creatime");
			map.put("plan_creatime", sdf.format(new Date(plan_creatime.getTime())));
			Timestamp plan_updatetime = (java.sql.Timestamp)map.get("plan_updatetime");
			map.put("plan_updatetime", sdf.format(new Date(plan_updatetime.getTime())));
			Timestamp plan_start = (java.sql.Timestamp)map.get("plan_start");
			map.put("plan_start", sdf.format(new Date(plan_start.getTime())));
			Timestamp plan_end = (java.sql.Timestamp)map.get("plan_end");
			map.put("plan_end", sdf.format(new Date(plan_end.getTime())));
		}
		
		return result;
	}
	
	public Map<String,Object> selectById (String plan_id){
		Map<String,Object> result = null;
		
		String sql = "SELECT plan_id,plan_content,plan_title,plan_creat,plan_to,"
				   + "plan_creatime,plan_updatetime,plan_flag,plan_update,plan_yxj,"
				   + "plan_fzd,plan_start,plan_end FROM plan_work where plan_id=? ";
		result = jdbc.queryForMap(sql,plan_id);
		
		if (result!=null && !result.isEmpty()){
			Timestamp plan_creatime = (java.sql.Timestamp)result.get("plan_creatime");
			result.put("plan_creatime", sdf.format(new Date(plan_creatime.getTime())));
			Timestamp plan_updatetime = (java.sql.Timestamp)result.get("plan_updatetime");
		    result.put("plan_updatetime",sdf.format(new Date(plan_updatetime.getTime())));
			Timestamp plan_start = (java.sql.Timestamp)result.get("plan_start");
			result.put("plan_start", sdf.format(new Date(plan_start.getTime())));
			Timestamp plan_end = (java.sql.Timestamp)result.get("plan_end");
			result.put("plan_end", sdf.format(new Date(plan_end.getTime())));
		}
		
		return result;
	}
	
	//核查审批更新数据
	public int updateHC(PlanWork planWork){
		int result = 0;
		
		String sql = "UPDATE plan_work set plan_content = ?,plan_flag = ?,"
				+ "plan_updateTime = now()  WHERE plan_id = ?";
		result = jdbc.update(sql,planWork.getPlan_content(),planWork.getPlan_flag()
				,planWork.getPlan_id());
		
		return result;
	}
}