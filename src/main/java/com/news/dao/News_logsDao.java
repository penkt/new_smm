/**
 * 
 */
package com.news.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.news.entity.News_log;

/**
 * @author pxq
 * @date 2018年4月8日
 */
public interface News_logsDao {

	/**
	 * @return
	 */
	Integer SelectCount();

	/**
	 * @param startNo
	 * @param pagesize
	 * @return
	 */
	List<News_log> SelectByPage(@Param("startNo")Integer startNo, @Param("pageSize")Integer pagesize);

	/**
	 * @param news_log
	 */
	Integer InsertBySelect(News_log news_log);

	Integer DelectByLog_id(@Param("log_id")Integer log_id);
}
