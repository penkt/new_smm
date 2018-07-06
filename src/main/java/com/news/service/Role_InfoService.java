/**
 * 
 */
package com.news.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.news.dao.Role_InfoDao;
import com.news.entity.Group_Info;
import com.news.entity.Role_Info;
import com.news.entity.User_Info;

/**
 * @author pxq
 * @date 2018年4月3日
 */
@Service
public class Role_InfoService {

	@Autowired
	Role_InfoDao role_InfoDao;
	/**
	 * @param role_parent
	 * @return
	 */
	public List<Role_Info> SelectByParentIds(Integer role_parent) {
		return role_InfoDao.SelectByParentIds(role_parent);
	}
	/**
	 * @return
	 */
	public List<Role_Info> SelectAll() {
		return role_InfoDao.SelectAll();
	}
	public Map<String, Object> QueryByPage(Integer pageNo, Integer pageSize) {
		Map<String, Object> map=new HashMap<>();
		Integer sizeNo=pageSize == null || pageSize == 0 ? 10 : pageSize;
		Integer page=pageNo== null || pageNo==0 ? 1 : pageNo;
		PageHelper.startPage(page,sizeNo);  
		List<Role_Info> roles = SelectAll();
		PageInfo<Role_Info> pageInfo = new PageInfo<>(roles,5);  
		List<Role_Info> proles = role_InfoDao.SelectParentAll();
		map.put("pageInfo",pageInfo);  
		map.put("proles", proles);
		return map;
	}
	/**
	 * @param role_id
	 * @return
	 */
	public Integer DelectByRole_Id(Integer role_id) {
		return role_InfoDao.DelectByRole_Id(role_id);
	}
	/**
	 * @param role_id
	 * @return
	 */
	public Role_Info SelectByRole_Id(Integer role_id) {
		return role_InfoDao.SelectByRole_Id(role_id);
	}
	/**
	 * @return
	 */
	public List<Role_Info> SelectParnet() {
		return role_InfoDao.SelectParentAll();
	}
	/**
	 * @param role_info
	 * @return
	 */
	public int InsertBySelect(Role_Info role_info) {
		return role_InfoDao.InsertBySelect(role_info);
	}
	/**
	 * @param role_info
	 * @return
	 */
	public int UpdateBySelect(Role_Info role_info) {
		return role_InfoDao.UpdateBySelect(role_info);
	}
	/**
	 * @param role_ids
	 * @return
	 */
	public List<Role_Info> SelectByIds(List<Integer> role_ids) {
		return role_InfoDao.SelectByIds(role_ids);
	}
	/**
	 * @param croles
	 * @return
	 */
	public List<Role_Info> SelectByusercRols(List<Integer> croles,Integer role_parent) {
		return role_InfoDao.SelectByusercRols(croles,role_parent);
	}

}
