/**
 * 
 */
package com.news.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.news.entity.Group_Info;
import com.news.entity.Role_Info;
import com.news.service.Group_InfoService;
import com.news.service.Role_InfoService;

/**
 * @author pxq
 * @date 2018年4月4日
 */
@RequestMapping("login")
@Controller
public class GroupController {

	@Autowired
	Group_InfoService group_InfoService;
	@Autowired
	Role_InfoService role_InfoService;

	@RequestMapping("grouplist")
	public ModelAndView grouplist(ModelAndView view) {
		view.setViewName("WEB-INF/pages/group/grouplist");
		List<Group_Info> groups = group_InfoService.SelctAll();
		List<Role_Info> roles = role_InfoService.SelectAll();
		view.addObject("groups",groups);
		view.addObject("roles",roles);
		return view;
	}
	
	@RequestMapping("addgroup")
	public ModelAndView addgroupbf(Integer group_id,ModelAndView view) {
		view.setViewName("WEB-INF/pages/group/addgroup");
		if (group_id !=null) {
			Group_Info group_Info=group_InfoService.SelectByGroup_id(group_id);
			view.addObject("group",group_Info);
		}
		
		List<Role_Info> proles = role_InfoService.SelectParnet();
		List<Role_Info> roles = role_InfoService.SelectAll();
		view.addObject("proles",proles);
		view.addObject("roles",roles);
		return view;
	}
	@ResponseBody
	@RequestMapping("delgroup")
	public String delgroup(Integer group_id) {
		Integer del=group_InfoService.DelectByGroup_id(group_id);
		return "删除成功!";
	}
	@PostMapping("group")
	public ModelAndView addgroup(Group_Info group_Info,ModelAndView view) {
		view.setViewName("redirect:/login/grouplist.html");
		Integer add=group_InfoService.InsertByGroup(group_Info);
		return view;
	}
	@PutMapping("group/{group_id}")
	public ModelAndView updategroup(@PathVariable Integer group_id, Group_Info group_Info,ModelAndView view) {
		view.setViewName("redirect:/login/grouplist.html");
		Integer add=group_InfoService.UpdateByGroup(group_Info);
		return view;
	}
}
