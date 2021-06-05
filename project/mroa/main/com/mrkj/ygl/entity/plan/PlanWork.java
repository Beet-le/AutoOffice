package com.mrkj.ygl.entity.plan;

public class PlanWork {
	
	//id
	private String plan_id;
	//申报内容
	private String plan_content;
	//申报标题
	private String plan_title;
	//创建人	申报人
	private String plan_creat;
	//审批人
	private String plan_to;
	//创建时间
	private String plan_creatime;
	//核查时间
	private String plan_updatetime;
	//标记,申报标记为1申报状态,2同意,3不同意
	private String plan_flag;
	//核查人
	private String plan_update;
	//优先级别
	private Integer plan_yxj;
	//复杂度
	private Integer plan_fzd;
	//工作开始时间
	private String plan_start;
	//工作结束时间
	private String plan_end;
	/**
	 * @return the plan_id
	 */
	public String getPlan_id() {
		return plan_id;
	}
	/**
	 * @param plan_id the plan_id to set
	 */
	public void setPlan_id(String plan_id) {
		this.plan_id = plan_id;
	}
	/**
	 * @return the plan_content
	 */
	public String getPlan_content() {
		return plan_content;
	}
	/**
	 * @param plan_content the plan_content to set
	 */
	public void setPlan_content(String plan_content) {
		this.plan_content = plan_content;
	}
	/**
	 * @return the plan_title
	 */
	public String getPlan_title() {
		return plan_title;
	}
	/**
	 * @param plan_title the plan_title to set
	 */
	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}
	/**
	 * @return the plan_creat
	 */
	public String getPlan_creat() {
		return plan_creat;
	}
	/**
	 * @param plan_creat the plan_creat to set
	 */
	public void setPlan_creat(String plan_creat) {
		this.plan_creat = plan_creat;
	}
	/**
	 * @return the plan_to
	 */
	public String getPlan_to() {
		return plan_to;
	}
	/**
	 * @param plan_to the plan_to to set
	 */
	public void setPlan_to(String plan_to) {
		this.plan_to = plan_to;
	}
	/**
	 * @return the plan_flag
	 */
	public String getPlan_flag() {
		return plan_flag;
	}
	/**
	 * @param plan_flag the plan_flag to set
	 */
	public void setPlan_flag(String plan_flag) {
		this.plan_flag = plan_flag;
	}
	/**
	 * @return the plan_update
	 */
	public String getPlan_update() {
		return plan_update;
	}
	/**
	 * @param plan_update the plan_update to set
	 */
	public void setPlan_update(String plan_update) {
		this.plan_update = plan_update;
	}
	/**
	 * @return the plan_yxj
	 */
	public Integer getPlan_yxj() {
		return plan_yxj;
	}
	/**
	 * @param plan_yxj the plan_yxj to set
	 */
	public void setPlan_yxj(Integer plan_yxj) {
		this.plan_yxj = plan_yxj;
	}
	/**
	 * @return the plan_fzd
	 */
	public Integer getPlan_fzd() {
		return plan_fzd;
	}
	/**
	 * @param plan_fzd the plan_fzd to set
	 */
	public void setPlan_fzd(Integer plan_fzd) {
		this.plan_fzd = plan_fzd;
	}
	/**
	 * @return the plan_start
	 */
	public String getPlan_start() {
		return plan_start;
	}
	/**
	 * @param plan_start the plan_start to set
	 */
	public void setPlan_start(String plan_start) {
		this.plan_start = plan_start;
	}
	/**
	 * @return the plan_end
	 */
	public String getPlan_end() {
		return plan_end;
	}
	/**
	 * @param plan_end the plan_end to set
	 */
	public void setPlan_end(String plan_end) {
		this.plan_end = plan_end;
	}
	/**
	 * @return the plan_creatime
	 */
	public String getPlan_creatime() {
		return plan_creatime;
	}
	/**
	 * @param plan_creatime the plan_creatime to set
	 */
	public void setPlan_creatime(String plan_creatime) {
		this.plan_creatime = plan_creatime;
	}
	/**
	 * @return the plan_updatetime
	 */
	public String getPlan_updatetime() {
		return plan_updatetime;
	}
	/**
	 * @param plan_updatetime the plan_updatetime to set
	 */
	public void setPlan_updatetime(String plan_updatetime) {
		this.plan_updatetime = plan_updatetime;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PlanWork [plan_id=" + plan_id + ", plan_content=" + plan_content + ", plan_title=" + plan_title
				+ ", plan_creat=" + plan_creat + ", plan_to=" + plan_to + ", plan_creatime=" + plan_creatime
				+ ", plan_updatetime=" + plan_updatetime + ", plan_flag=" + plan_flag + ", plan_update=" + plan_update
				+ ", plan_yxj=" + plan_yxj + ", plan_fzd=" + plan_fzd + ", plan_start=" + plan_start + ", plan_end="
				+ plan_end + "]";
	}
	
	
}
