package com.mrkj.ygl.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Service
public class CustomSystemService {

	@Resource
	JdbcTemplate jdbc;
	
	public List<Map<String,Object>> selectUserByRole (String group){
				
		String sql = "SELECT l.username,l.wxname FROM sys_login l LEFT JOIN "
				+ "sys_login_role lr ON l.username = lr.username LEFT JOIN sys_role r ON "
				+ "lr.role_id = r.role_id WHERE r.role_pid = ?";
		
		List<Map<String,Object>> result = jdbc.queryForList(sql,group);
		
		return result;
	}
	
}
