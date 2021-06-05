package com.mrkj.ygl.entity.ckin;

public class CheckingIn {

	private String ckin_id;
	private String ckin_content;
	private String ckin_times;
	private String ckin_date;
	private String username;
	
	/**
	 * @return the ckin_id
	 */
	public String getCkin_id() {
		return ckin_id;
	}
	/**
	 * @param ckin_id the ckin_id to set
	 */
	public void setCkin_id(String ckin_id) {
		this.ckin_id = ckin_id;
	}
	/**
	 * @return the ckin_content
	 */
	public String getCkin_content() {
		return ckin_content;
	}
	/**
	 * @param ckin_content the ckin_content to set
	 */
	public void setCkin_content(String ckin_content) {
		this.ckin_content = ckin_content;
	}
	/**
	 * @return the ckin_times
	 */
	public String getCkin_times() {
		return ckin_times;
	}
	/**
	 * @param ckin_times the ckin_times to set
	 */
	public void setCkin_times(String ckin_times) {
		this.ckin_times = ckin_times;
	}
	/**
	 * @return the ckin_date
	 */
	public String getCkin_date() {
		return ckin_date;
	}
	/**
	 * @param ckin_date the ckin_date to set
	 */
	public void setCkin_date(String ckin_date) {
		this.ckin_date = ckin_date;
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
		return "CheckingIn [ckin_id=" + ckin_id + ", ckin_content=" + ckin_content + ", ckin_times=" + ckin_times
				+ ", ckin_date=" + ckin_date + ", username=" + username + "]";
	}
	
}
