/**
 * 
 */
package com.news.entity;

import java.util.Date;

/**
 * @author pxq
 * @date 2018年4月8日
 */
public class News_log {

	private Integer log_id;
	private Date create_time;
	private String ip_address;
	private String doing;
	private String log_name;
	private Integer user_id;
	private Integer is_flag;
	/**
	 * @return the log_id
	 */
	public Integer getLog_id() {
		return log_id;
	}
	/**
	 * @param log_id the log_id to set
	 */
	public void setLog_id(Integer log_id) {
		this.log_id = log_id;
	}
	/**
	 * @return the create_time
	 */
	public Date getCreate_time() {
		return create_time;
	}
	/**
	 * @param create_time the create_time to set
	 */
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	/**
	 * @return the ip_address
	 */
	public String getIp_address() {
		return ip_address;
	}
	/**
	 * @param ip_address the ip_address to set
	 */
	public void setIp_address(String ip_address) {
		this.ip_address = ip_address;
	}
	/**
	 * @return the doing
	 */
	public String getDoing() {
		return doing;
	}
	/**
	 * @param doing the doing to set
	 */
	public void setDoing(String doing) {
		this.doing = doing;
	}
	/**
	 * @return the user_id
	 */
	public Integer getUser_id() {
		return user_id;
	}
	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	
	/**
	 * @return the is_flag
	 */
	public Integer getIs_flag() {
		return is_flag;
	}
	/**
	 * @param is_flag the is_flag to set
	 */
	public void setIs_flag(Integer is_flag) {
		this.is_flag = is_flag;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	
	
	@Override
	public String toString() {
		return "News_log [log_id=" + log_id + ", create_time=" + create_time + ", ip_address=" + ip_address + ", doing="
				+ doing + ", user_id=" + user_id + "]";
	}
	/**
	 * @return the log_name
	 */
	public String getLog_name() {
		return log_name;
	}
	/**
	 * @param log_name the log_name to set
	 */
	public void setLog_name(String log_name) {
		this.log_name = log_name;
	}
	/**
	 * @param create_time
	 * @param doing
	 * @param user_id
	 * @param is_flag
	 */
	public News_log(Date create_time, String doing,String log_name, Integer user_id, Integer is_flag) {
		super();
		this.create_time = create_time;
		this.doing = doing;
		this.user_id = user_id;
		this.log_name=log_name;
		this.is_flag = is_flag;
	}
	/**
	 * @param create_time
	 * @param ip_address
	 * @param doing
	 * @param user_id
	 * @param is_flag
	 */
	public News_log(Date create_time, String ip_address, String doing,String log_name, Integer user_id, Integer is_flag) {
		super();
		this.create_time = create_time;
		this.ip_address = ip_address;
		this.doing = doing;
		this.log_name=log_name;
		this.user_id = user_id;
		this.is_flag = is_flag;
	}
	/**
	 * 
	 */
	public News_log() {
		super();
	}
	
}
