/**
 * 
 */
package com.news.controller;

import com.news.entity.News_Info;
import com.news.entity.News_log;
import com.news.entity.User_Info;
import com.news.service.News_InfoService;
import com.news.service.News_logService;
import com.news.utils.MyFileUtis;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;

/**
 * @author pxq
 * @date 2018年4月4日
 */
@Controller
public class NewsController {

	@Autowired
	News_InfoService news_InfoService;
	@Autowired
	News_logService news_logService;

	// 新闻管理组独有权限
	@RequestMapping(value= {"login/newslist","newslist"})
	public ModelAndView userlist(Integer pageNo, Integer pagesize, ModelAndView view) {
		pagesize = 10;
		view.setViewName("WEB-INF/pages/news/newslist");
		Map<String, Object> map = news_InfoService.SelectByPage(pageNo, pagesize, null);
		view.addObject("map", map);
		return view;
	}

	@RequestMapping("login/addnews")
	public ModelAndView news(Integer news_id, ModelAndView view) {
		if (news_id != null) {
			News_Info news_Info = news_InfoService.SelctByNews_id(news_id);
			view.addObject("news_Info", news_Info);
		}
		view.setViewName("WEB-INF/pages/news/news");
 		return view;
	}

	@ResponseBody
	@RequestMapping("login/delectnews")
	public JSONObject delectnews(Integer news_id, HttpServletRequest request) {
		User_Info user = (User_Info) request.getSession().getAttribute("user_Info");
		news_logService.InserBySelect(new News_log(new Date(), "删除新闻", "新闻id:" + news_id, user.getUser_id(), 1));
		JSONObject json = news_InfoService.DelectByNews_id(news_id);
		json.toString();
		return json;
	}

	// 暂定用户为分组为7，采编部5，审核部6,新闻管理员为8 管理员1
	@PostMapping("login/news_Info")
	public ModelAndView addnews_ifno(News_Info news_Info, ModelAndView view, HttpServletRequest request) {
		User_Info user_Info = (User_Info) request.getSession().getAttribute("user_Info");
		news_logService
				.InserBySelect(new News_log(new Date(), "发布新闻", news_Info.getNews_name(), user_Info.getUser_id(), 1));
		copyFiles(request);
		if (user_Info.getUser_groupid() == 7) {
			view.setViewName("redirect:/login/mynewslist.html");
		}
		if (user_Info.getUser_groupid() == 6) {
			view.setViewName("redirect:/login/shenhelist.html");
		}
		if (user_Info.getUser_groupid() == 8 || user_Info.getUser_groupid() == 1) {
			view.setViewName("redirect:/login/newslist.html");
		}
		news_Info.setUser_id(user_Info.getUser_id());
		news_Info.setCreate_time(new Date());
		Integer add = news_InfoService.InsertBySelect(news_Info);
		return view;
	}

	@PutMapping("news_Info/{news_id}")
	public ModelAndView editnews_ifno(@PathVariable Integer news_id, News_Info news_Info, ModelAndView view,
			HttpServletRequest request) {
		User_Info user_Info = (User_Info) request.getSession().getAttribute("user_Info");
		news_logService.InserBySelect(new News_log(new Date(), "修改新闻",
				"新闻id:" + news_id + "新闻标题:" + news_Info.getNews_name(), user_Info.getUser_id(), 1));
		Integer edit = news_InfoService.UpdateBySelect(news_Info);
		copyFiles(request);
		if (user_Info.getUser_groupid() == 7) {
			view.setViewName("redirect:/login/mynewslist.html");
		}
		if (user_Info.getUser_groupid() == 6) {
			view.setViewName("redirect:/login/shenhelist.html");
		}
		if (user_Info.getUser_groupid() == 8 || user_Info.getUser_groupid() == 1) {
			view.setViewName("redirect:/login/newslist.html");
		}
		return view;
	}

	// 审核部独有
	@RequestMapping(value = { "login/shenhelist" })
	public ModelAndView shenhenews(Integer pageNo, Integer pagesize, ModelAndView view) {
		pagesize = 10;
		view.setViewName("WEB-INF/pages/news/shenhelist");
		Map<String, Object> map = news_InfoService.SelectByPage(pageNo, pagesize, null);
		view.addObject("map", map);
		return view;
	}

	@GetMapping("login/shnews/{news_id}")
	public ModelAndView shnws(@PathVariable Integer news_id, ModelAndView view) {
		Map<String, Object> amp = news_InfoService.SelctByNes_id(news_id);
		view.addObject("map", amp);
		view.setViewName("WEB-INF/pages/news/shnews");
		return view;
	}

	@ResponseBody
	@RequestMapping("shnewinfo")
	public boolean shnewinfo(Integer is_flag, Integer news_id, HttpServletRequest request) {
		News_Info news_Info = new News_Info();
		news_Info.setNews_id(news_id);
		news_Info.setIs_flag(is_flag);
		User_Info user_Info = (User_Info) request.getSession().getAttribute("user_Info");
		news_logService.InserBySelect(
				new News_log(new Date(), "审核新闻", "新闻id:" + news_id + ",状态改为:" + is_flag, user_Info.getUser_id(), 1));
		Integer isflag = news_InfoService.UpdateBySelect(news_Info);
		if (isflag > 0) {
			return true;
		}
		return true;
	}

	// 采编部独有
	@RequestMapping(value = { "login/editlist" })
	public ModelAndView editlist(Integer pageNo, Integer pagesize, ModelAndView view) {
		pagesize = 10;
		view.setViewName("WEB-INF/pages/news/editlist");
		Map<String, Object> map = news_InfoService.SelectByPage(pageNo, pagesize, null);
		view.addObject("map", map);
		return view;
	}

	// 新闻发布用户
	@RequestMapping(value = { "login/mynewslist" })
	public ModelAndView mynewslist(Integer pageNo, Integer pagesize, ModelAndView view, HttpServletRequest request) {
		pagesize = 10;
		view.setViewName("WEB-INF/pages/news/mynewslist");
		User_Info user_Info = (User_Info) request.getSession().getAttribute("user_Info");
		Map<String, Object> map = news_InfoService.SelectByPage(pageNo, pagesize, user_Info);
		view.addObject("map", map);
		return view;
	}

	public void copyFiles(HttpServletRequest request){
		try {
			String filePath = request.getSession().getServletContext().getRealPath("/") + "/ueditor/jsp/upload/image";
			System.out.println(filePath);
			MyFileUtis.copy(filePath, "D:\\JAVA\\ssm_news\\img");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
