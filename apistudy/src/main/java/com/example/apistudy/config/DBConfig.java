package com.example.apistudy.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration  // Spring 설정 파일임을 명시
public class DBConfig {

    @Bean   // Spring에서 관리하는 저장소인 Bean에 등록(jpa)
    public DataSource dataSource() {
        HikariConfig hikariConfig = new HikariConfig();
        // oracle
//        hikariConfig.setDriverClassName("oracle.jdbc.OracleDriver");
//        hikariConfig.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:orcl");
//        hikariConfig.setUsername("boarduser1");
//        hikariConfig.setPassword("1234");
        // mysql
        hikariConfig.setDriverClassName("com.mysql.cj.jdbc.Driver");
        hikariConfig.setJdbcUrl("jdbc:mysql://localhost:3306/test?useSSL=false&useUnicode=true&serverTimezone=Asia/Seoul");
        hikariConfig.setUsername("root");
        hikariConfig.setPassword("1234");

        hikariConfig.setPoolName("article-pool");
        hikariConfig.setMaximumPoolSize(3);

        return new HikariDataSource(hikariConfig);
    }
}
