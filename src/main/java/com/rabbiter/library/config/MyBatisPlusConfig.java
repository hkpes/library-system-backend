package com.rabbiter.library.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.ExceptionSorter;
import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.sql.SQLException;
import java.util.Properties;

@Configuration //表明該類是一個配置類
@MapperScan("com.rabbiter.library.mapper") //掃描配置，mapper下的接口
public class MyBatisPlusConfig {
    @Value("${spring.datasource.driver-class-name}")
    private String jdbcDriver;
    @Value("${spring.datasource.url}")
    private String jdbcUrl;
    @Value("${spring.datasource.username}")
    private String jdbcUsername;
    @Value("${spring.datasource.password}")
    private String jdbcPassword;

    // 最新版
    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor() {
        MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
        interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
        return interceptor;
    }

    @Bean(name="dataSource")
    public DruidDataSource createDataSource() throws Exception {
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setUrl(jdbcUrl);
        dataSource.setUsername(jdbcUsername);
        dataSource.setPassword(jdbcPassword);

        // 關閉鏈接後不自動commit
        dataSource.setDefaultAutoCommit(false);
        // 設置鏈接異常處理
        dataSource.setBreakAfterAcquireFailure(true);
        // 將SQLException抛出重要配置
        dataSource.setFailFast(true);
        dataSource.setConnectionErrorRetryAttempts(0);
        // 配置自定義的異常處理器
        dataSource.setExceptionSorter(new CustomExceptionSorter());

        // 關閉Druid連接池內部的異常處理
//    dataSource.setFilters("stat");
        return dataSource;
    }
}


class CustomExceptionSorter implements ExceptionSorter {

    @Override
    public boolean isExceptionFatal(SQLException e) {
        // 將所有異常視為致命異常 即抛出到上層
        // 打印異常推找信息
        e.printStackTrace();
        return true;
    }

    @Override
    public void configFromProperties(Properties properties) {
        // 配置信息可以為空
    }
}