package com.hand;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Created by Administrator on 2018/8/16.
 */

@SpringBootApplication
@MapperScan("com.hand.Mapper")
public class App{
    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
        System.out.println("启动完毕");
    }
}
