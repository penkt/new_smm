/**
 * 
 */
package com.news.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.news.entity.News_log;
import com.news.entity.Role_Info;
import com.news.entity.User_Info;
import com.news.service.News_logService;
import com.news.service.Role_InfoService;

/**
 * @author pxq
 * @date 2018年4月4日
 */
@RequestMapping("login")
@Controller
public class RoleController {
	@Autowired
	Role_InfoService role_InfoService;
	@Autowired
	News_logService news_logService;
	@RequestMapping("rolelist")
	public ModelAndView userlist(Integer pageNo,Integer pageSize ,ModelAndView view){
		view.setViewName("WEB-INF/pages/roles/rolelist");
		Map<String, Object> map = role_InfoService.QueryByPage(pageNo,pageSize);
		view.addObject("map",map);
		return view;
	}
	@ResponseBody
	@RequestMapping("delrole")
	public String delectrole(Integer role_id,HttpServletRequest request) {
		User_Info user_Info = (User_Info) request.getSession().getAttribute("user_Info");
		news_logService.InserBySelect(new News_log(new Date(), "删除权限","权限id:"+role_id, user_Info.getUser_id(), 1));
	   Integer del=role_InfoService.DelectByRole_Id(role_id);
		String msg="";
		if (del>0) {
			msg="删除成功!";
		}else {
			msg="删除失败!";
		}
		return msg;
	}
	@RequestMapping("addrole")
	public ModelAndView addrolebf(Integer role_id,ModelAndView view) {
		view.setViewName("WEB-INF/pages/roles/addrole");
		if (role_id!=null) {
			Role_Info role=role_InfoService.SelectByRole_Id(role_id);
			view.addObject("role",role);
		}
		List<Role_Info> proles=role_InfoService.SelectParnet();
		view.addObject("proles",proles);
		return view;
	}
	@PostMapping("role")
	public ModelAndView addrole(Role_Info role_info,ModelAndView view,HttpServletRequest request) {
		User_Info user_Info = (User_Info) request.getSession().getAttribute("user_Info");
		news_logService.InserBySelect(new News_log(new Date(), "添加权限","权限名:"+role_info.getRole_name(), user_Info.getUser_id(), 1));
	    view.setViewName("redirect:/login/rolelist.html");
		int add=role_InfoService.InsertBySelect(role_info);
		return view;
	}
	@PutMapping("role/{role_id}")
	public ModelAndView updaterole(@PathVariable Integer role_id, Role_Info role_info,ModelAndView view,HttpServletRequest request) {
		User_Info user_Info = (User_Info) request.getSession().getAttribute("user_Info");
		news_logService.InserBySelect(new News_log(new Date(), "修改权限","权限名:"+role_info.getRole_name(), user_Info.getUser_id(), 1));
		view.setViewName("redirect:/login/rolelist.html");
		int add=role_InfoService.UpdateBySelect(role_info);
		return view;
	}
	@RequestMapping("prentrole")
	public ModelAndView prentroles(ModelAndView view){
		view.setViewName("WEB-INF/pages/roles/prentroles");
		List<Role_Info> prentroles = role_InfoService.SelectParnet();
		view.addObject("proles",prentroles);
		return view;
	}
}
