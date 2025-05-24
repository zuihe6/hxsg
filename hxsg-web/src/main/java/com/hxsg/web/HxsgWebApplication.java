package com.hxsg.web;

import com.hxsg.core.configuration.CoreAutoConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

@SpringBootApplication(scanBasePackages = {
        "com.hxsg.core",   // 当前模块路径
        "com.hxsg.web"   // 被依赖模块路径
})
@Import(CoreAutoConfiguration.class)   // 显式导入配置
public class HxsgWebApplication {
    public static void main(String[] args) {
        SpringApplication.run(HxsgWebApplication.class, args);
    }
}
