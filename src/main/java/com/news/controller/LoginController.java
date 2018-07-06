/**
 * 
 */
package com.news.controller;



import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.news.entity.Group_Info;
import com.news.entity.News_log;
import com.news.entity.Role_Info;
import com.news.entity.User_Info;
import com.news.service.Group_InfoService;
import com.news.service.News_logService;
import com.news.service.Role_InfoService;
import com.news.service.User_InfoService;

import net.sf.json.JSONObject;

@Controller
public class LoginController {

	@Autowired
	User_InfoService user_InfoService;
	@Autowired
	Role_InfoService role_InfoService;
	@Autowired
	Group_InfoService group_InfoService;
	@Autowired
	News_logService news_logService;
	
	@RequestMapping("/index")
	public ModelAndView index(ModelAndView view) {
		view.setViewName("WEB-INF/login");
		return view;
	}
	
	
	@ResponseBody
	@PostMapping ("login_in")
	public JSONObject longin(HttpServletRequest request) {
		String user_name=request.getParameter("user_name");
		String user_password=request.getParameter("user_password");
		JSONObject jsonObject = user_InfoService.SelectByName(user_name,user_password);
		if ("1".equals(jsonObject.get("success"))) {
			User_Info user_Info=user_InfoService.SelectByName(user_name);
			request.getSession().setAttribute("user_Info", user_Info);
		}
		String ip_address = request.getRemoteAddr();
		request.getSession().setAttribute("ip_address", ip_address);
		jsonObject.toString();
		return jsonObject;
	}
	
	@RequestMapping("register")
	public ModelAndView login_in(ModelAndView view) {
		view.setViewName("WEB-INF/pages/register");
		List<Group_Info> group_infos = group_InfoService.SelctAll();
		view.addObject("group_infos", group_infos);
		return view;
	}
		
	
	@RequestMapping("login")
	public ModelAndView login_in(ModelAndView view,HttpServletRequest request,Map<String, Object> map) {
		User_Info user=(User_Info) request.getSession().getAttribute("user_Info");
		if (user==null) {
			view.setViewName("redirect:/index");
		}else {
			view.setViewName("WEB-INF/pages/login_in");
			User_Info user_Info=user_InfoService.SelectByName(user.getUser_name());
			view.addObject("user_Info",user_Info);
			map=user_InfoService.SelectuserInfoXG(user_Info);
			view.addObject("map",map);
		}
		return view;
	}
	@ResponseBody
	@RequestMapping("login/selectroles")
	public List<Role_Info> selectroles(Integer role_parent,HttpServletRequest request){
		User_Info user_Info=(User_Info) request.getSession().getAttribute("user_Info");
		List<Integer> croles= new ArrayList<>();
		Group_Info group = group_InfoService.SelectByGroup_id(user_Info.getUser_groupid());
		String role_ids = group.getRole_ids();
		String[] split = role_ids.split(",");
		for (int i = 0; i < split.length; i++) {
			croles.add(Integer.valueOf(split[i]));
		}
		user_Info.getUser_groupid();
		List<Role_Info> selectroles = role_InfoService.SelectByusercRols(croles,role_parent);
	    return selectroles;
	}
	@RequestMapping("loginout")
	public ModelAndView  loginout(ModelAndView view,HttpServletRequest request) {
		User_Info user=(User_Info) request.getSession().getAttribute("user_Info");
		News_log news_log=new News_log(new Date(),"退出系统", "",user.getUser_id(), 1);
		Integer loginout = news_logService.InserBySelect(news_log);
		request.getSession().setAttribute("user_Info", null);
		view.setViewName("redirect:/index");
		return view;
	}
}
