/**
 * 
 */
package com.news.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * @author pxq
 * @date 2018年4月8日
 */
public class MyFileUtis {
	// 复制方法
	public static void copy(String src, String des) throws Exception {
		// 初始化文件复制
		File file1 = new File(src);
		// 把文件里面内容放进数组
		File[] fs = file1.listFiles();
		// 初始化文件粘贴
		File file2 = new File(des);
		// 判断是否有这个文件有不管没有创建
		if (!file2.exists()) {
			file2.mkdirs();
		}
		// 遍历文件及文件夹
		for (File f : fs) {
			if (f.isFile()) {
				// 文件
				fileCopy(f.getPath(), des + "\\" + f.getName()); // 调用文件拷贝的方法
			} else if (f.isDirectory()) {
				// 文件夹
				copy(f.getPath(), des + "\\" + f.getName());// 继续调用复制方法 递归的地方,自己调用自己的方法,就可以复制文件夹的文件夹了
			}
		}

	}

	/**
	 * 文件复制的具体方法
	 */
	public static void fileCopy(String src, String des) throws Exception {
		// io流固定格式
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(src));
		BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(des));
		int i = -1;// 记录获取长度
		byte[] bt = new byte[2014];// 缓冲区
		while ((i = bis.read(bt)) != -1) {
			bos.write(bt, 0, i);
		}
		bis.close();
		bos.close();
		// 关闭流
	}

	public static List<String> readAllFiles(String fileDir) {
		List<File> fileList = new ArrayList<File>();
		List<String> filenames = new ArrayList<>();
		File file = new File(fileDir);
		File[] files = file.listFiles();// 获取目录下的所有文件或文件夹
		if (files == null) {// 如果目录为空，直接退出
			return null;
		}
		// 遍历，目录下的所有文件
		for (File f : files) {
			if (f.isFile()) {
				fileList.add(f);
			} else if (f.isDirectory()) {
				System.out.println(f.getAbsolutePath());
				readAllFiles(f.getAbsolutePath());
			}
		}
		for (File f1 : fileList) {
			filenames.add(f1.getName());
		}
		return filenames;
	}

}
