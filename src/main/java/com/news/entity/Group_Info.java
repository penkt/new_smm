/**
 * 
 */
package com.news.entity;

/**
 * @author pxq
 * @date 2018年4月3日
 */
public class Group_Info {
	
	private Integer group_id;
	private Integer group_prentid;
	private String group_name;
	private String role_ids;
	
	/**
	 * @return the group_id
	 */
	public Integer getGroup_id() {
		return group_id;
	}
	/**
	 * @param group_id the group_id to set
	 */
	public void setGroup_id(Integer group_id) {
		this.group_id = group_id;
	}
	/**
	 * @return the group_prentid
	 */
	public Integer getGroup_prentid() {
		return group_prentid;
	}
	/**
	 * @param group_prentid the group_prentid to set
	 */
	public void setGroup_prentid(Integer group_prentid) {
		this.group_prentid = group_prentid;
	}
	/**
	 * @return the group_name
	 */
	public String getGroup_name() {
		return group_name;
	}
	/**
	 * @param group_name the group_name to set
	 */
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	/**
	 * @return the role_ids
	 */
	public String getRole_ids() {
		return role_ids;
	}
	/**
	 * @param role_ids the role_ids to set
	 */
	public void setRole_ids(String role_ids) {
		this.role_ids = role_ids;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Group_Info [group_id=" + group_id + ", group_prentid=" + group_prentid + ", group_name=" + group_name
				+ ", role_ids=" + role_ids + "]";
	}
	
}
