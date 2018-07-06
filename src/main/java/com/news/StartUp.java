package com.news;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/*@SpringBootApplication(exclude = {
        DataSourceAutoConfiguration.class
})*/
/*
@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
*/
@SpringBootApplication
@EnableTransactionManagement
@EnableAspectJAutoProxy
public class StartUp {

	public static void main(String[] args) {
		SpringApplication.run(StartUp.class, args);
	}
}
