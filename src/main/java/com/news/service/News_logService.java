/**
 * 
 */
package com.news.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.news.dao.News_logsDao;
import com.news.entity.News_log;
import com.news.utils.PageUtils;

import net.sf.json.JSONObject;

/**
 * @author pxq
 * @date 2018年4月8日
 */
@Service
public class News_logService {

	@Autowired
	News_logsDao news_logDao;
	/**
	 * @param pageNo
	 * @param pagesize
	 * @return
	 */
	public Map<String, Object> SelectByPage(Integer pageNo, Integer pagesize) {
		Map<String, Object> map=new HashMap<>();
		PageUtils page=new PageUtils(pageNo, pagesize, news_logDao.SelectCount(),"login/logslist.html",10);
		List<News_log> logs=new ArrayList<>();
		logs=news_logDao.SelectByPage(page.getStartNo(),pagesize);
		map.put("page", page);
		map.put("logs", logs);
		return map;
	}
	/**
	 * @param news_log
	 */
	public Integer InserBySelect(News_log news_log) {
		return news_logDao.InsertBySelect(news_log);
	}
	/**
	 * @param log_id
	 * @return
	 */
	public JSONObject DelectByLogs_id(Integer log_id) {
		 news_logDao.DelectByLog_id(log_id);
		 JSONObject json=new JSONObject();
		 json.put("msg", "删除成功!");
		 return json;
	}

}
