/**
 * 
 */
package com.news.entity;

import java.util.Date;

import com.alibaba.druid.sql.dialect.oracle.ast.stmt.OracleConstraint.Initially;

/**
 * @author pxq
 * @date 2018年4月4日
 */
public class News_Info {

	private Integer news_id;
	private Integer user_id;
	private String news_title;
	private String news_name;
	private String news_desc;
	private String news_keywords;
	private Date create_time;
	private String news_content;
	private Integer is_flag;
	/**
	 * @return the news_id
	 */
	public Integer getNews_id() {
		return news_id;
	}
	/**
	 * @param news_id the news_id to set
	 */
	public void setNews_id(Integer news_id) {
		this.news_id = news_id;
	}
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
	 * @return the news_title
	 */
	public String getNews_title() {
		return news_title;
	}
	/**
	 * @param news_title the news_title to set
	 */
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	/**
	 * @return the news_name
	 */
	public String getNews_name() {
		return news_name;
	}
	/**
	 * @param news_name the news_name to set
	 */
	public void setNews_name(String news_name) {
		this.news_name = news_name;
	}
	/**
	 * @return the news_desc
	 */
	public String getNews_desc() {
		return news_desc;
	}
	/**
	 * @param news_desc the news_desc to set
	 */
	public void setNews_desc(String news_desc) {
		this.news_desc = news_desc;
	}
	/**
	 * @return the news_keywords
	 */
	public String getNews_keywords() {
		return news_keywords;
	}
	/**
	 * @param news_keywords the news_keywords to set
	 */
	public void setNews_keywords(String news_keywords) {
		this.news_keywords = news_keywords;
	}
	/**
	 * @return the create_time
	 */
	public Date getCreate_time() {
		return create_time;
	}
	/**
	 * @param create_time the create_time to set
	 */
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	/**
	 * @return the news_content
	 */
	public String getNews_content() {
		return news_content;
	}
	/**
	 * @param news_content the news_content to set
	 */
	public void setNews_content(String news_content) {
		this.news_content = news_content;
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
	
}
