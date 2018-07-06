/**
 * 
 */
package com.news.entity;

/**
 * @author pxq
 * @date 2018年4月3日
 */
public class Role_Info {

	private Integer role_id;
	private Integer role_parent;
	private String role_name;
	private String role_url;
	/**
	 * @return the role_id
	 */
	public Integer getRole_id() {
		return role_id;
	}
	/**
	 * @param role_id the role_id to set
	 */
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	
	/**
	 * @return the role_parent
	 */
	public Integer getRole_parent() {
		return role_parent;
	}
	/**
	 * @param role_parent the role_parent to set
	 */
	public void setRole_parent(Integer role_parent) {
		this.role_parent = role_parent;
	}
	/**
	 * @return the role_name
	 */
	public String getRole_name() {
		return role_name;
	}
	/**
	 * @param role_name the role_name to set
	 */
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	/**
	 * @return the role_url
	 */
	public String getRole_url() {
		return role_url;
	}
	/**
	 * @param role_url the role_url to set
	 */
	public void setRole_url(String role_url) {
		this.role_url = role_url;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Role_Info [role_id=" + role_id + ", role_parent=" + role_parent + ", role_name=" + role_name
				+ ", role_url=" + role_url + "]";
	}

	
}
