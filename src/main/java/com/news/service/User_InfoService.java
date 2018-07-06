/**
 * 
 */
package com.news.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.news.dto.TokenModel;
import com.news.manager.TokenManager;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.news.dao.Group_InfoDao;
import com.news.dao.News_InfoDao;
import com.news.dao.News_logsDao;
import com.news.dao.Role_InfoDao;
import com.news.dao.User_InfoDao;
import com.news.entity.Group_Info;
import com.news.entity.News_Info;
import com.news.entity.News_log;
import com.news.entity.Role_Info;
import com.news.entity.User_Info;
import com.news.utils.MD5Utils;

import net.sf.json.JSONObject;

@Service
public class User_InfoService {

	@Autowired
	User_InfoDao user_InfoDao;
	@Autowired
	Group_InfoDao group_InfoDao;
	@Autowired
	Role_InfoDao role_InfoDao;
	@Autowired
	News_logsDao news_logsDao;
	@Autowired
	News_InfoDao news_InfoDao;

	@Autowired
	private TokenManager tokenManager;
	/**
	 * @param user_name
	 * @param user_password
	 * @return
	 */
	public JSONObject SelectByName(String user_name, String user_password) {
		JSONObject jsonpObject=new JSONObject();
		User_Info user=user_InfoDao.SelectByName(user_name);
		if (user==null) {
			jsonpObject.put("success",-1);
			jsonpObject.put("msg", "用户名不存在!");
			return jsonpObject;
		}else {
			if (!user.getUser_password().equals(MD5Utils.string2MD5(user_password))) {
				News_log news_log=new News_log(new Date(),"登录系统", "密码错误",user.getUser_id(), 0);
				news_logsDao.InsertBySelect(news_log);
				jsonpObject.put("msg", "您输入的密码不正确!");
				jsonpObject.put("success",0);
				return jsonpObject;
			}else if(user.getIs_flag()==0) {
				News_log news_log=new News_log(new Date(),"登录系统","账号正在审核中", user.getUser_id(), 0);
				news_logsDao.InsertBySelect(news_log);
				jsonpObject.put("success",0);
				jsonpObject.put("msg", "您的账号正在审核中!");
				return jsonpObject;
			}else if(user.getIs_flag()==-1) {
				News_log news_log=new News_log(new Date(),"登录系统","账号审核未通过", user.getUser_id(), 1);
				news_logsDao.InsertBySelect(news_log);
				jsonpObject.put("success",0);
				jsonpObject.put("msg", "您的账号审核未通过，请联系管理员!");
				return jsonpObject;
			}else {
				News_log news_log=new News_log(new Date(),"登录系统","成功登录", user.getUser_id(), 1);
				news_logsDao.InsertBySelect(news_log);
				//生成一个token，保存用户登录状态
				TokenModel model = tokenManager.createToken(String.valueOf(user.getUser_id()));
				jsonpObject.put("token",model);
				jsonpObject.put("msg", "即将进入新闻管理!");
				jsonpObject.put("url", "login");
				jsonpObject.put("success","1");
				return jsonpObject;
			}
		}
		
	}

	/**
	 * @param user_name
	 * @return
	 */
	public User_Info SelectByName(String user_name) {
		return	user_InfoDao.SelectByName(user_name);
	}

	/**
	 * @param user_Info
	 * @return
	 */
	public Map<String, Object> SelectuserInfoXG(User_Info user_Info) {
		Map<String, Object> map=new HashMap<>();
		Group_Info group_Info=group_InfoDao.SelectById(user_Info.getUser_groupid());
		String role_ids = group_Info.getRole_ids();
		String[] split = role_ids.split(",");
		//用户权限
		List<Integer> role_id=new ArrayList<>();
		for (int i = 0; i < split.length; i++) {
			if(StringUtils.isNotBlank(split[i])){
				role_id.add(Integer.valueOf(split[i]));
			}
		}
		List<Role_Info> role_pinfos=role_InfoDao.SelectByParetanduser(role_id);
		List<Integer> role_id2=new ArrayList<>();
		for (int i = 0; i < role_pinfos.size(); i++) {
			role_id2.add(Integer.valueOf(role_pinfos.get(i).getRole_parent()));
		}
		role_pinfos=role_InfoDao.SelectByParetanduser2(role_id2);
		if(user_Info.getUser_roles()!=null || "".equals(user_Info.getUser_roles())) {
			//其他权限
			List<Integer> otherrole_id=new ArrayList<>();
			String user_roles = user_Info.getUser_roles();
			String[] split2 = user_roles.split(",");
			for (int i = 0; i < split2.length; i++) {
				if(StringUtils.isNotBlank(split2[i])){
					otherrole_id.add(Integer.valueOf(split2[i]));
				}
			}
			List<Role_Info> other_roles=role_InfoDao.SelectOtherRoles(otherrole_id,role_id);
			map.put("other_roles", other_roles);
		}
		map.put("user_Info", user_Info);
		map.put("group_Info", group_Info);
		map.put("role_pinfos", role_pinfos);
		return map;
	}

	/**
	 * @param user_Info
	 * @return
	 */
	public Integer InsertBySelect(User_Info user_Info) {
		return user_InfoDao.InsertBySelect(user_Info);
	}

	/**
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> QueryByPage(Integer pageNo, Integer pageSize) {
		Map<String, Object> map=new HashMap<>();
		Integer sizeNo=pageSize == null || pageSize == 0 ? 10 : pageSize;
		Integer page=pageNo== null || pageNo==0 ? 1 : pageNo;
		PageHelper.startPage(page,sizeNo);  
		List<User_Info> users=user_InfoDao.SelectAll();
		PageInfo<User_Info> pageInfo = new PageInfo<>(users,5);  
		List<Group_Info> groups = group_InfoDao.SelectAll();
		map.put("pageInfo",pageInfo);  
		map.put("groups", groups);
		List<Role_Info> roles = role_InfoDao.SelectAll();
		map.put("roles", roles);
		return map;
	}

	/**
	 * @param user_id
	 * @return
	 */
	public JSONObject deluser(Integer user_id) {
		JSONObject jsonObject=new JSONObject();
		Integer del=user_InfoDao.DelectByid(user_id);
		if (del>0) {
			jsonObject.put("msg","删除成功");
		}else {
			jsonObject.put("msg","删除失败");
		}
		jsonObject.toString();
		return jsonObject;
	}

	/**
	 * @param user_id
	 * @return
	 */
	public User_Info SelectByid(Integer user_id) {
		return user_InfoDao.SelectByid(user_id);
	}

	/**
	 * @param user_Info
	 */
	public Integer UpdataBySelect(User_Info user_Info) {
		return user_InfoDao.UpdataBySelect(user_Info);
	}

	/**
	 * 
	 */
	//@Transactional
	public void contextLoads() {
		User_Info user_Info=new User_Info();
		user_Info.setUser_groupid(1);
		user_Info.setUser_name("username");
		Integer insertBySelect = user_InfoDao.InsertBySelect(user_Info);
		System.out.println("insertBySelect"+insertBySelect);
		News_Info news_Info=new News_Info();
		news_Info.setUser_id(11);
		//int i=10/0;
		Integer insertBySelect2 = news_InfoDao.InsertBySelect(news_Info);
		System.out.println("insertBySelect2"+insertBySelect2);
		
	}
}
