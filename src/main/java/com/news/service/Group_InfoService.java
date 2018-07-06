/**
 * 
 */
package com.news.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.news.dao.Group_InfoDao;
import com.news.entity.Group_Info;

/**
 * @author pxq
 * @date 2018年4月3日
 */
@Service
public class Group_InfoService {

	@Autowired
	Group_InfoDao group_InfoDao;
	
	/**
	 * 
	 * @return
	 */
	public List<Group_Info> SelctAll() {
		return group_InfoDao.SelectAll();
	}

	/**
	 * @param group_id
	 * @return
	 */
	public Integer DelectByGroup_id(Integer group_id) {
		return group_InfoDao.DelectByGroup_id(group_id);
	}

	/**
	 * @param group_id
	 * @return
	 */
	public Group_Info SelectByGroup_id(Integer group_id) {
		return group_InfoDao.SelectById(group_id);
	}

	/**
	 * @param group_Info
	 * @return
	 */
	public Integer InsertByGroup(Group_Info group_Info) {
		return group_InfoDao.InsertByGroup(group_Info);
	}

	/**
	 * @param group_Info
	 * @return
	 */
	public Integer UpdateByGroup(Group_Info group_Info) {
		return group_InfoDao.UpdateByGroup(group_Info);
	}

}
