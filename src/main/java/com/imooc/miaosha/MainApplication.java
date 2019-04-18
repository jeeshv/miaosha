package com.imooc.miaosha;/**
 * Created by Administrator on 2019/3/10.
 */

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.support.SpringBootServletInitializer;

/**
  *  @author jeeshv
  *  @Description springboot启动类，要放在所有包的最外侧
  *  @Date 10:30 2019/3/10
  **/
@SpringBootApplication
public class MainApplication {

    public static void main(String[] args) {
        SpringApplication.run(MainApplication.class, args);
    }

}

