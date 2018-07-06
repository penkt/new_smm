package com.news.config;

import com.github.pagehelper.PageHelper;
import com.news.enums.DataSourceType;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

@Configuration
@ConditionalOnClass({EnableTransactionManagement.class})
@Import({ DataBaseConfiguration.class})
@MapperScan(basePackages={"com.news.dao"},sqlSessionFactoryRef = "sqlSessionFactory")
public class MybatisConfiguration {
    @Value("${spring.datasource.type}")
    private Class<? extends DataSource> dataSourceType;

    @Value("${datasource.readSize}")
    private String dataSourceSize;
    @Resource(name = "writeDataSource")
    private DataSource dataSource;
    @Resource(name = "readDataSources")
    private List<DataSource> readDataSources;
    //XxxMapper.xml文件所在路径
    @Value("${comm.mybatis.mapperLocations}")
    private String mapperLocations;

    @Autowired
    private DataSource defaultDataSource;

    @Bean(name = "sqlSessionFactory")
    @ConditionalOnMissingBean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();

        //sqlSessionFactoryBean.setDataSource(roundRobinDataSouceProxy());
        sqlSessionFactoryBean.setDataSource(defaultDataSource);
        //设置mapper.xml文件所在位置
        sqlSessionFactoryBean.setMapperLocations( new PathMatchingResourcePatternResolver().getResources(mapperLocations));
        //添加分页插件、打印sql插件
        Interceptor[] plugins = new Interceptor[]{pageHelper(),new SqlPrintInterceptor()};
        sqlSessionFactoryBean.setPlugins(plugins);

        return sqlSessionFactoryBean.getObject();
    }

    /**
     * 有多少个数据源就要配置多少个bean
     *
     * @return
     */
    @Bean
    public AbstractRoutingDataSource roundRobinDataSouceProxy() {
        int size = Integer.parseInt(dataSourceSize);
        MyAbstractRoutingDataSource proxy = new MyAbstractRoutingDataSource(size);
        Map<Object, Object> targetDataSources = new HashMap<Object, Object>();
        //DataSource writeDataSource = SpringContextHolder.getBean("writeDataSource");
        // 写
        targetDataSources.put(DataSourceType.write.getType(), dataSource);
        // targetDataSources.put(DataSourceType.read.getType(),readDataSource);
        //多个读数据库时
        for (int i = 0; i < size; i++) {
            targetDataSources.put(i, readDataSources.get(i));
        }
        proxy.setDefaultTargetDataSource(defaultDataSource);
        proxy.setTargetDataSources(targetDataSources);
        return proxy;
    }

    /**
     * 分页插件
     * @return
     */
    @Bean
    public PageHelper pageHelper() {
        PageHelper pageHelper = new PageHelper();
        Properties p = new Properties();
        p.setProperty("offsetAsPageNum", "true");
        p.setProperty("rowBoundsWithCount", "true");
        p.setProperty("reasonable", "true");
        p.setProperty("returnPageInfo", "check");
        p.setProperty("params", "count=countSql");
        pageHelper.setProperties(p);
        return pageHelper;
    }
}
