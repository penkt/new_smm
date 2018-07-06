/**
 * 
 */
package com.news.config;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.news.entity.User_Info;
import com.news.utils.JspToHtml;

/**
 * @author pxq
 * @date 2018年4月7日
 */
public class LoginHandlerInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		User_Info user_Info = (User_Info) request.getSession().getAttribute("user_Info");
		if (user_Info == null) {
			String path = request.getContextPath();
			response.sendRedirect("/index");
			return false;
		}
		return true;
	}

	//因为后台用框架，无法抓取页面内容，网页可抓取
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		String requestURL = request.getRequestURL().toString();
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
		
		if (requestURL.contains("login/news_Info")) {
			String newpath=requestURL.replace(basePath, "");
			String gethtml = JspToHtml.gethtml(requestURL);
			File file=new File("C:\\Users\\apeng\\Desktop\\毕设项目\\news_ssm\\WebContent\\login\\news_Info\\");
			if (!file.exists()) {
				file.mkdirs();
			}
			JspToHtml.writeHtml("C:\\Users\\apeng\\Desktop\\毕设项目\\news_ssm\\WebContent\\login\\news_Info\\"+newpath+".html", gethtml);
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

	}
}
