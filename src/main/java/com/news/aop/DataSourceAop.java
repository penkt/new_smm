package com.news.aop;

import com.news.component.DataSourceContextHolder;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class DataSourceAop {
    private Logger logger= LoggerFactory.getLogger(DataSourceAop.class);

/*    @Before("execution(* com.news.dao..*.Select*(..)) || execution(* com.news.dao..*.get*(..))")
    public void setReadDataSourceType() {
        DataSourceContextHolder.read();
        logger.info("dataSource切换到：Read");
    }

    @Before("execution(* com.news.dao..*.Insert*(..)) || execution(* com.news..dao..*.Update*(..)) ||execution(* com.news..dao..*.Delect*(..))")
    public void setWriteDataSourceType() {
        DataSourceContextHolder.write();
        logger.info("dataSource切换到：write");
    }*/
}
