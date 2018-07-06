/**
 * 
 */
package com.news.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.news.entity.User_Info;

/**
 * @author pxq
 * @date 2018年4月8号
 */
public interface User_InfoDao {

	/**
	 * @param user_name
	 * @return
	 */
	User_Info SelectByName(@Param("user_name")String user_name);

	/**
	 * @param user_id
	 * @return
	 */
	User_Info SelectByid(@Param("user_id")int user_id);

	/**
	 * @param user_Info
	 * @return
	 */
	Integer InsertBySelect(User_Info user_Info);

	/**
	 * @return
	 */
	List<User_Info> SelectAll();

	/**
	 * @param user_id
	 * @return
	 */
	Integer DelectByid(Integer user_id);

	/**
	 * @param user_Info
	 */
	Integer UpdataBySelect(User_Info user_Info);

	
}
