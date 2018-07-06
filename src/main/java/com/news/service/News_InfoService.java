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

import com.news.dao.News_InfoDao;
import com.news.entity.News_Info;
import com.news.entity.User_Info;
import com.news.utils.PageUtils;

import net.sf.json.JSONObject;

/**
 * @author pxq
 * @date 2018年4月4日
 */
@Service
public class News_InfoService {

	@Autowired
	News_InfoDao news_Infodao;

	/**
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Map<String, Object> SelectByPage(Integer pageNo, Integer pageSize,User_Info user_Info) {
		Map<String, Object> map=new HashMap<>();
		PageUtils page=new PageUtils(pageNo, pageSize, news_Infodao.SelectCount(),"login/newslist",10);
		List<News_Info> news=new ArrayList<>();
		if (user_Info !=null) {
			news=news_Infodao.SelectByPage(page.getStartNo(),pageSize,user_Info.getUser_id());
		}else {
			news=news_Infodao.SelectByPage(page.getStartNo(),pageSize,null);
		}
		map.put("page",page);
		map.put("news", news);
		return map;
	}

	/**
	 * @param news_id
	 * @return
	 */
	public JSONObject DelectByNews_id(Integer news_id) {
		JSONObject jsonObject=new JSONObject();
		Integer del=news_Infodao.DelectByNews_id(news_id);
		jsonObject.put("msg", "删除失败!");
		if (del>0) {
			jsonObject.put("msg", "删除成功!");
		}
		return jsonObject;
	}

	public News_Info SelctByNews_id(Integer news_id) {
		return news_Infodao.SelectByNes_id(news_id);
	}
	/**
	 * @param news_id
	 * @return
	 */
	public Map<String, Object> SelctByNes_id(Integer news_id) {
		Map<String, Object> map=new HashMap<>();
		News_Info news_Info = news_Infodao.SelectByNes_id(news_id);
		map.put("news_Info", news_Info);
		Integer nextpage=news_Infodao.SelectNextPage(news_id);
		Integer prevpage=news_Infodao.SelectPrevPage(news_id);
		map.put("nextpage", nextpage);
		map.put("prevpage", prevpage);
		return map;
	}

	/**
	 * @param news_Info
	 * @return
	 */
	public Integer InsertBySelect(News_Info news_Info) {
		news_Info.setIs_flag(0);
		return news_Infodao.InsertBySelect(news_Info);
	}

	/**
	 * @param news_Info
	 * @return
	 */
	public Integer UpdateBySelect(News_Info news_Info) {
		return news_Infodao.UpdateBySelect(news_Info);
	}
	
}
