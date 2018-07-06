/**
 * 
 */
package com.news.dao;

import java.util.List;

import com.news.entity.Group_Info;

/**
 * @author pxq
 * @date 2018年4月3日
 */
public interface Group_InfoDao {

	/**
	 * @param group_id
	 * @return
	 */
	public Group_Info SelectById(Integer group_id);

	/**
	 * @return
	 */
	public List<Group_Info> SelectAll();

	/**
	 * @param group_id
	 * @return
	 */
	public Integer DelectByGroup_id(Integer group_id);

	/**
	 * @param group_Info
	 * @return
	 */
	public Integer InsertByGroup(Group_Info group_Info);

	/**
	 * @param group_Info
	 * @return
	 */
	public Integer UpdateByGroup(Group_Info group_Info);

}
