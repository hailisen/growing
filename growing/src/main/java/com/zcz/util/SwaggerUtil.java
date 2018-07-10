package com.zcz.util;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * Configuration 配置注解，自动在本类上下文加载一些环境变量信息
 * EnableWebMvc
 * EnableSwagger2 使swagger2生效
 * ComponentScan("com.Controller") 需要扫描的包路径
 */
@EnableSwagger2
@ComponentScan(basePackages = "com.zcz.controller")
public class SwaggerUtil extends WebMvcConfigurationSupport {

    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.any())
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {
//        return new ApiInfoBuilder()
//                .title("测试API")
//                .termsOfServiceUrl("localhost:8080/")
//                .contact("郭刘帅")
//                .version("1.1")
//                .build();
        return new ApiInfo("测试API",//大标题 title
         "Swagger测试demo",//小标题
         "1.9",//版本
         "localhost:8080/",//termsOfServiceUrl
         "郭刘帅",//作者
         "Blog",//链接显示文字
         "localhost:8080/"//网站链接
         );

    }
}
