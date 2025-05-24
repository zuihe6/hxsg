package com.hxsg.core.configuration;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
@EntityScan("com.hxsg.core.dao")   // 扫描实体
@EnableJpaRepositories("com.hxsg.Dao")   // 扫描Repository
public class CoreAutoConfiguration {
    // 可在此定义核心模块的Bean 
}