/**
 * 
 */
package com.news.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.news.entity.Role_Info;

/**
 * @author pxq
 * @date 2018年4月3日
 */
public interface Role_InfoDao {

	/**
	 * @param role_ids
	 * @return
	 */
	public List<Role_Info> SelectByIds(@Param("role_ids")List<Integer> role_ids);

	/**
	 * @param role_parents
	 * @return
	 */
	public List<Role_Info> SelectByParentIds(@Param("role_parent")Integer role_parents);

	/**
	 * @return
	 */
	public List<Role_Info> SelectAll();

	/**
	 * @return
	 */
	public List<Role_Info> SelectParentAll();

	/**
	 * @param role_id
	 * @return
	 */
	public Integer DelectByRole_Id(@Param("role_id")Integer role_id);

	/**
	 * @param role_id
	 * @return
	 */
	public Role_Info SelectByRole_Id(@Param("role_id")Integer role_id);

	/**
	 * @param role_info
	 * @return
	 */
	public int InsertBySelect(Role_Info role_info);

	/**
	 * @param role_info
	 * @return
	 */
	public int UpdateBySelect(Role_Info role_info);

	/**
	 * @param role_id
	 * @return
	 */
	public List<Role_Info> SelectByParetanduser(@Param("role_ids")List<Integer> role_id);

	/**
	 * @param croles
	 * @return
	 */
	public List<Role_Info> SelectByusercRols(@Param("role_ids")List<Integer> croles,@Param("role_parent")Integer role_parent);

	/**
	 * @param otherrole_id
	 * @param role_id
	 * @return
	 */
	public List<Role_Info> SelectOtherRoles(@Param("otherrole")List<Integer> otherrole_id,@Param("grole") List<Integer> role_id);

	/**
	 * @param role_id2
	 * @return
	 */
	public List<Role_Info> SelectByParetanduser2(@Param("role_ids")List<Integer> role_id2);


	
}
