/**
 * 
 */
package com.news.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.google.common.collect.Maps;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.news.entity.Group_Info;
import com.news.entity.News_log;
import com.news.entity.Role_Info;
import com.news.entity.User_Info;
import com.news.service.Group_InfoService;
import com.news.service.News_logService;
import com.news.service.Role_InfoService;
import com.news.service.User_InfoService;
import com.news.utils.MD5Utils;

import net.sf.json.JSONObject;

/**
 * @author pxq
 * @date 2018年4月3日
 */
@Controller
@RequestMapping("/login")
public class UserInfoController {

	@Autowired
	Role_InfoService role_InfoService;
	@Autowired
	Group_InfoService group_InfoService;
	@Autowired
	User_InfoService user_InfoService;
	@Autowired
	News_logService news_logService;

	@RequestMapping("/userlist")
	public ModelAndView userlist(Integer pageNo, Integer pageSize, ModelAndView view) {
		view.setViewName("WEB-INF/pages/user/userlist");
		Map<String, Object> map = user_InfoService.QueryByPage(pageNo, pageSize);
		view.addObject("map", map);
		return view;
	}

	@RequestMapping("/adduser")
	public ModelAndView adduser(Integer user_id, ModelAndView view) {
		view.setViewName("WEB-INF/pages/user/adduser");
		if (user_id != null) {
			User_Info user = user_InfoService.SelectByid(user_id);
			view.addObject("user", user);
			String user_roles = user.getUser_roles();
			if (user_roles != null) {
				String[] split = user_roles.split(",");
				List<Integer> roles = new ArrayList<>();
				for (int i = 0; i < split.length; i++) {
					roles.add(Integer.valueOf(split[i]));
				}
				view.addObject("roles", roles);
			}
		}
		List<Role_Info> role_Infos = role_InfoService.SelectAll();
		view.addObject("role_Infos", role_Infos);
		List<Group_Info> group_infos = group_InfoService.SelctAll();
		view.addObject("group_infos", group_infos);
		return view;
	}

	@PostMapping("/user")
	public ModelAndView add(User_Info user_Info, ModelAndView view,HttpServletRequest request) {
		User_Info user = (User_Info) request.getSession().getAttribute("user_Info");
		news_logService.InserBySelect(new News_log(new Date(), "添加用户", "用户名:" + user_Info.getUser_name(), user.getUser_id(), 1));
        view.setViewName("redirect:/login/userlist.html");
		user_Info.setUser_password(MD5Utils.string2MD5(user_Info.getUser_password()));
		user_InfoService.InsertBySelect(user_Info);
		return view;
	}

	@PostMapping("/userzc")
	@ResponseBody
	public Map<String,Object> userzc(User_Info user_Info, ModelAndView view) {
		Map<String,Object> result= Maps.newConcurrentMap();
		user_Info.setUser_password(MD5Utils.string2MD5(user_Info.getUser_password()));
		user_Info.setIs_flag(0);
		User_Info tmpUser=user_InfoService.SelectByName(user_Info.getUser_name());
		if(tmpUser!=null){
			result.put("code","99999");
			result.put("msg","当前用户名已经存在，请直接登录！");
			return result;
		}
		int c=user_InfoService.InsertBySelect(user_Info);
		if(c>0){
			result.put("code","000000");
			result.put("msg","success");
			return result;
		}else{
			result.put("code","999999");
			result.put("msg","系统异常");
			return result;
		}
	}


	@ResponseBody
	@RequestMapping("/deluser")
	public JSONObject deluser(Integer user_id,HttpServletRequest request) {
		User_Info user = (User_Info) request.getSession().getAttribute("user_Info");
		news_logService.InserBySelect(new News_log(new Date(), "删除用户", "用户id:" +user_id, user.getUser_id(), 1));
        return user_InfoService.deluser(user_id);
	}

	@PutMapping("/user/{user_id}")
	public ModelAndView upuser(@PathVariable Integer user_id, User_Info user_Info, ModelAndView view,HttpServletRequest request) {
		view.setViewName("redirect:/login/userlist.html");
		User_Info user = (User_Info) request.getSession().getAttribute("user_Info");
		if (user_id==user.getUser_id()) {
			news_logService.InserBySelect(new News_log(new Date(), "修改用户", "用户名为:" +user_Info.getUser_name(), user.getUser_id(), 1));
		}else {
			News_log news_log=new News_log(new Date(),"修改资料", "修改密码",user.getUser_id(), 1);	
		}
		Integer up = user_InfoService.UpdataBySelect(user_Info);
		return view;
	}

	@RequestMapping("/myself")
	public ModelAndView myself(Integer user_id, ModelAndView view) {
		User_Info user = user_InfoService.SelectByid(user_id);
		view.addObject("user", user);
		Group_Info group = group_InfoService.SelectByGroup_id(user.getUser_groupid());
		view.addObject("group", group);
		String user_roles = user.getUser_roles();
		if (user_roles != null) {
			String[] split = user_roles.split(",");
			List<Integer> roles = new ArrayList<>();
			for (int i = 0; i < split.length; i++) {
				if(StringUtils.isNotBlank(split[i])){
					roles.add(Integer.valueOf(split[i]));
				}
			}
			view.addObject("roles", roles);
		}
		view.setViewName("WEB-INF/pages/user/myself");
		return view;
	}

	@RequestMapping("/upmypic")
	public ModelAndView upmypic(Integer user_id, ModelAndView view) {
		view.setViewName("WEB-INF/pages/user/upmypic");
		view.addObject("user_id", user_id);
		return view;
	}

	@RequestMapping("/upimg/{user_id}")
	public ModelAndView multipartResolver(@RequestParam("flie_name") MultipartFile flie_name,
			@PathVariable Integer user_id, HttpServletRequest request, ModelAndView view) throws IOException {
		view.setViewName("redirect:/login/mynewslist.html");
		User_Info user=(User_Info) request.getSession().getAttribute("user_Info");
		News_log news_log=new News_log(new Date(),"修改资料", "修改头像",user.getUser_id(), 1);
		String filePath = request.getSession().getServletContext().getRealPath("/") + "upload/";
		File disfile = new File(filePath);
		if (!disfile.exists()) {
			disfile.mkdirs();
		}
		if (!flie_name.isEmpty()) {
			try {
				filePath = filePath + File.separator + flie_name.getOriginalFilename();
				flie_name.transferTo(new File(filePath));
				User_Info user_Info = new User_Info();
				user_Info.setUser_img(flie_name.getOriginalFilename());
				user_Info.setUser_id(user_id);
				user_InfoService.UpdataBySelect(user_Info);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return view;
	}

}
