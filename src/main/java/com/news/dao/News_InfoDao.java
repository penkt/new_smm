/**
 * 
 */
package com.news.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.news.entity.News_Info;

/**
 * @author pxq
 * @date 2018年4月4日
 */
public interface News_InfoDao {

	/**
	 * @return
	 */
	Integer SelectCount();

	/**
	 * @param startNo
	 * @param pageSize
	 * @return
	 */
	List<News_Info> SelectByPage(@Param("startNo")Integer startNo, @Param("pageSize") Integer pageSize, @Param("user_id")Integer user_id);

	/**
	 * @param news_id
	 * @return
	 */
	Integer DelectByNews_id(@Param("news_id")Integer news_id);

	/**
	 * @param news_id
	 * @return
	 */
	News_Info SelectByNes_id(@Param("news_id")Integer news_id);

	/**
	 * @param news_Info
	 * @return
	 */
	Integer InsertBySelect(News_Info news_Info);

	/**
	 * @param news_Info
	 * @return
	 */
	Integer UpdateBySelect(News_Info news_Info);

	/**
	 * @param news_id
	 * @return
	 */
	Integer SelectNextPage(@Param("news_id") Integer news_id);

	/**
	 * @param news_id
	 * @return
	 */
	Integer SelectPrevPage(@Param("news_id")Integer news_id);

	
}
