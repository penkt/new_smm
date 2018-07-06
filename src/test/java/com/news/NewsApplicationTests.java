package com.news;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import com.news.entity.News_Info;
import com.news.entity.User_Info;
import com.news.service.News_InfoService;
import com.news.service.User_InfoService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class NewsApplicationTests {
	
	@Autowired
	User_InfoService User_InfoService;
	@Autowired
	News_InfoService News_InfoService;
	

	@Test
	public void contextLoads() {
		User_InfoService.contextLoads();
		
	}

}
