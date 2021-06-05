package com.mrkj.ygl.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.mrkj.ygl.entity.mome.Memorandum;

@Service
public class MemorandumService {

	@Resource
	JdbcTemplate jdbc;
	
	public int saveMemorandum(Memorandum memo){
		
		String sql = "INSERT INTO memorandum (memo_id,memo_xqzs,memo_ylzs,memo_title"
				+ ",memo_content,memo_year,memo_month,memo_day,username) "
				+ "VALUES (?,?,?,?,?,?,?,?,?)";
		
		return jdbc.update(sql,memo.getMemo_id(),memo.getMemo_xqzs(),memo.getMemo_ylzs()
				,memo.getMemo_title(),memo.getMemo_content(),memo.getMemo_year()
				,memo.getMemo_month(),memo.getMemo_day(),memo.getUsername());
	}
	
	public int updateMemorandum(Memorandum memo){
		
		String sql = "UPDATE memorandum SET memo_xqzs=?,memo_ylzs=?,memo_title=?"
				+ ",memo_content=?,memo_year=?,memo_month=?,memo_day=?,username=? "
				+ "WHERE memo_id = ?";
		
		int result = jdbc.update(sql,memo.getMemo_xqzs(),memo.getMemo_ylzs()
				,memo.getMemo_title(),memo.getMemo_content(),memo.getMemo_year()
				,memo.getMemo_month(),memo.getMemo_day(),memo.getUsername()
				,memo.getMemo_id());
		
		return result;
	}
	
	public Map<String,Object> selectMemorandum(String username){
		
		Map<String,Object> result = new HashMap<>();
		
		String sql = "SELECT memo_id as id,memo_xqzs as xqzs,memo_ylzs as ylzs"
				+ ",memo_title as title,memo_content as description,memo_year as year"
				+ ",memo_month as month,memo_day as day FROM memorandum "
				+ "WHERE username = ?";
		List<Map<String, Object>> list = jdbc.queryForList(sql,username);
		result.put("events", list);
		
		return result;
	}
}
