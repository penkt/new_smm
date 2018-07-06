package com.news.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;


@Configuration
@PropertySource("classpath:mybatis/mybatis.properties")
public class DataBaseConfiguration {
    private static final Logger log = LoggerFactory.getLogger(DataBaseConfiguration.class);


    @Value("${spring.datasource.type}")
    private Class<? extends DataSource> dataSourceType;

    @Bean(name = "writeDataSource", destroyMethod = "close", initMethod = "init")
    @Primary
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource writeDataSource() {
        log.info("-------------------- writeDataSource init ---------------------");
        return DataSourceBuilder.create().type(dataSourceType).build();
    }

    /**
     * 有多少个从库就要配置多少个
     *
     * @return
     */
    @Bean(name = "readDataSource1")
    @ConfigurationProperties(prefix = "spring.slave")
    public DataSource readDataSourceOne() {
        log.info("-------------------- readDataSourceOne init ---------------------");
        return DataSourceBuilder.create().type(dataSourceType).build();
    }

    /*    @Bean(name = "readDataSource2")
        @ConfigurationProperties(prefix = "spring.read2")
        public DataSource readDataSourceTwo() {
            log.info("-------------------- readDataSourceTwo init ---------------------");
            return DataSourceBuilder.create().type(dataSourceType).build();
        }*/
    @Bean("readDataSources")
    public List<DataSource> readDataSources() {
        List<DataSource> dataSources = new ArrayList<>();
        dataSources.add(readDataSourceOne());
        //dataSources.add(readDataSourceTwo());
        return dataSources;
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}
