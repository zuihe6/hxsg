package com.hxsg.core;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com.hxsg")
@MapperScan("com.hxsg.core.Dao")
public class HxsgCoreApplication {
    public static void main(String[] args) {
        SpringApplication.run(HxsgCoreApplication.class, args);
    }
}
