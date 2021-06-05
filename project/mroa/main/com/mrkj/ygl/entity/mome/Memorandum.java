package com.mrkj.ygl.entity.mome;

public class Memorandum {

	private String memo_id;
	//心情指数
	private Integer memo_xqzs;
	//压力指数
	private Integer memo_ylzs;
	private String memo_title;
	private String memo_content;
	private String memo_year;
	private String memo_month;
	private String memo_day;
	private String username;
	
	/**
	 * @return the memo_id
	 */
	public String getMemo_id() {
		return memo_id;
	}
	/**
	 * @param memo_id the memo_id to set
	 */
	public void setMemo_id(String memo_id) {
		this.memo_id = memo_id;
	}
	/**
	 * @return the memo_xqzs
	 */
	public Integer getMemo_xqzs() {
		return memo_xqzs;
	}
	/**
	 * @param memo_xqzs the memo_xqzs to set
	 */
	public void setMemo_xqzs(Integer memo_xqzs) {
		this.memo_xqzs = memo_xqzs;
	}
	/**
	 * @return the memo_ylzs
	 */
	public Integer getMemo_ylzs() {
		return memo_ylzs;
	}
	/**
	 * @param memo_ylzs the memo_ylzs to set
	 */
	public void setMemo_ylzs(Integer memo_ylzs) {
		this.memo_ylzs = memo_ylzs;
	}
	/**
	 * @return the memo_title
	 */
	public String getMemo_title() {
		return memo_title;
	}
	/**
	 * @param memo_title the memo_title to set
	 */
	public void setMemo_title(String memo_title) {
		this.memo_title = memo_title;
	}
	/**
	 * @return the memo_content
	 */
	public String getMemo_content() {
		return memo_content;
	}
	/**
	 * @param memo_content the memo_content to set
	 */
	public void setMemo_content(String memo_content) {
		this.memo_content = memo_content;
	}
	/**
	 * @return the memo_year
	 */
	public String getMemo_year() {
		return memo_year;
	}
	/**
	 * @param memo_year the memo_year to set
	 */
	public void setMemo_year(String memo_year) {
		this.memo_year = memo_year;
	}
	/**
	 * @return the memo_month
	 */
	public String getMemo_month() {
		return memo_month;
	}
	/**
	 * @param memo_month the memo_month to set
	 */
	public void setMemo_month(String memo_month) {
		this.memo_month = memo_month;
	}
	/**
	 * @return the memo_day
	 */
	public String getMemo_day() {
		return memo_day;
	}
	/**
	 * @param memo_day the memo_day to set
	 */
	public void setMemo_day(String memo_day) {
		this.memo_day = memo_day;
	}
	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}
	/**
	 * @param username the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Memorandum [memo_id=" + memo_id + ", memo_xqzs=" + memo_xqzs + ", memo_ylzs=" + memo_ylzs
				+ ", memo_title=" + memo_title + ", memo_content=" + memo_content + ", memo_year=" + memo_year
				+ ", memo_month=" + memo_month + ", memo_day=" + memo_day + "]";
	}

}
