package com.mrkj.ygl.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class SystemPluService {

	@Resource
	JdbcTemplate jdbc;
	
	public List<Map<String,Object>> getDepartment (){
		String sql = "SELECT DISTINCT role_groupname,role_group "
				+ "FROM sys_role WHERE role_group <> '-1'";
		
		return jdbc.queryForList(sql);
	}
	
	public List<Map<String,Object>> getUserByRole (String role_group){
		String sql = "SELECT l.username,l.wxname FROM sys_login as l "
				+ "LEFT JOIN sys_login_role as lr ON l.login_id = lr.login_id "
				+ "WHERE lr.role_id IN (SELECT r.role_id FROM sys_role as r "
				+ "WHERE r.role_group = ?)";
		return jdbc.queryForList(sql,role_group);
	}
	
	public Map<String,Object> getWxnameByUsername (String username){
		String sql = "select wxname from sys_login where username = ?";
		Map<String, Object> result = jdbc.queryForMap(sql,username);
		
		return result;
	}
	
}
