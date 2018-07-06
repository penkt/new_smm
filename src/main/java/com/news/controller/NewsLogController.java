/**
 * 
 */
package com.news.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.news.entity.News_log;
import com.news.entity.User_Info;
import com.news.service.News_logService;

import net.sf.json.JSONObject;

/**
 * @author pxq
 * @date 2018年4月8日
 */
@RequestMapping("login")
@Controller
public class NewsLogController {

	@Autowired
	News_logService news_logservice;

	@RequestMapping("logslist")
	public ModelAndView userlist(Integer pageNo, Integer pagesize, ModelAndView view) {
		pagesize = 10;
		view.setViewName("WEB-INF/pages/logs/logslist");
		Map<String, Object> map = news_logservice.SelectByPage(pageNo, pagesize);
		view.addObject("map", map);
		return view;
	}

	@ResponseBody
	@RequestMapping("delectlogs")
	public JSONObject delectnews(Integer log_id, HttpServletRequest request) {
		User_Info user = (User_Info) request.getSession().getAttribute("user_Info");
		news_logservice.InserBySelect(new News_log(new Date(), "删除日志", "日志id:" + log_id, user.getUser_id(), 1));
		JSONObject json = news_logservice.DelectByLogs_id(log_id);
		json.toString();
		return json;
	}
}
