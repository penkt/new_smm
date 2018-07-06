/**
 * 
 */
package com.news.utils;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;

import javax.servlet.http.HttpServlet;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class JspToHtml extends HttpServlet {

	private static long star = 0;
	private static long end = 0;
	private static long ttime = 0;

	/**
	 * 获取页面转换后的内容
	 * 
	 * @param httpUrl
	 *            访问地址url
	 * @param bianma
	 *            格式编码
	 * @return
	 */
	public static String getHtmlCode(String httpUrl, String bianma) {
		Date before = new Date();
		star = before.getTime();
		String htmlCode = "";
		try {
			InputStream in;
			URL url = new java.net.URL(httpUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection = (HttpURLConnection) url.openConnection();
			connection.setRequestProperty("User-Agent", "Mozilla/4.0");
			connection.connect();
			in = connection.getInputStream();
			java.io.BufferedReader breader = new BufferedReader(new InputStreamReader(in, bianma));
			String currentLine;
			while ((currentLine = breader.readLine()) != null) {
				htmlCode += currentLine;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Date after = new Date();
			end = after.getTime();
			ttime = end - star;
		}
		return htmlCode;
	}

	/**
	 * 将转化后的内容保存
	 * 
	 * @param filePath
	 *            保存地址+文件名
	 * @param info
	 *            页面内容
	 */
	public static synchronized void writeHtml(String filePath, String info) {
		try {
			OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(filePath), "UTF-8");
			out.write(info);
			out.flush();
		} catch (Exception ex) {
			ex.getMessage();
		}
	}

	// main调用
	public static void main(String[] args) {
		String gethtml = gethtml("http://localhost:8080/login/news_Info/13");
		System.out.println("gethtml" + gethtml);
	}

	// 抓取html
	public static String gethtml(String url) {
		String html = "";
		try {
			Document doc = Jsoup.connect(url).timeout(60000).get();
			html = doc.toString();
		} catch (IOException e1) {

		}
		return html;
	}

}
