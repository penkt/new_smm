package com.news.component;

import com.news.enums.DataSourceType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DataSourceContextHolder {
    private static final Logger log = LoggerFactory.getLogger(DataSourceContextHolder.class);


    private static final ThreadLocal<String> local = new ThreadLocal<String>();

    public static ThreadLocal<String> getLocal() {
        return local;
    }

    /**
     * 读可能是多个库
     */
    public static void read() {
        log.debug("read");
        local.set(DataSourceType.read.getType());
    }

    /**
     * 写只有一个库
     */
    public static void write() {
        log.debug("write");
        local.set(DataSourceType.write.getType());
    }

    public static String getJdbcType() {
        return local.get();
    }
}
