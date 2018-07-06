/**
 * 
 */
package com.news.entity;

/**
 * @author pxq
 * @date 2018
 */
public class User_Info {

	private Integer user_id;
	private String user_name;
	private String user_password;
	private String user_img;
	private Integer user_groupid;
	private String user_roles;
	private Integer is_flag;
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
	 * @return the user_name
	 */
	public String getUser_name() {
		return user_name;
	}
	/**
	 * @param user_name the user_name to set
	 */
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	/**
	 * @return the user_password
	 */
	public String getUser_password() {
		return user_password;
	}
	/**
	 * @param user_password the user_password to set
	 */
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	/**
	 * @return the user_img
	 */
	public String getUser_img() {
		return user_img;
	}
	/**
	 * @param user_img the user_img to set
	 */
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	/**
	 * @return the user_groupid
	 */
	public Integer getUser_groupid() {
		return user_groupid;
	}
	/**
	 * @param user_groupid the user_groupid to set
	 */
	public void setUser_groupid(Integer user_groupid) {
		this.user_groupid = user_groupid;
	}
	/**
	 * @return the user_roles
	 */
	public String getUser_roles() {
		return user_roles;
	}
	/**
	 * @param user_roles the user_roles to set
	 */
	public void setUser_roles(String user_roles) {
		this.user_roles = user_roles;
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
		return "User_Info [user_id=" + user_id + ", user_name=" + user_name + ", user_password=" + user_password
				+ ", user_img=" + user_img + ", user_groupid=" + user_groupid + ", user_roles=" + user_roles + "]";
	}
	
	
}
