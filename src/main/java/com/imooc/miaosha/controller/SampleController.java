package com.imooc.miaosha.controller;/**
 * Created by Administrator on 2019/3/10.
 */

import com.imooc.miaosha.domain.User;
import com.imooc.miaosha.rabbitmq.MQSender;
import com.imooc.miaosha.redis.RedisService;
import com.imooc.miaosha.result.Result;
import com.imooc.miaosha.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.imooc.miaosha.redis.UserKey;

/**
 * @author jeeshv
 * @Description
 * @Date
 **/
@Controller
@RequestMapping("/demo")
public class SampleController {

    @Autowired
    private UserService userService;
    @Autowired
    private RedisService redisService;
    @Autowired
    private MQSender mqSender;

    @RequestMapping("/")
    @ResponseBody
    String home() {
        return "Hello World!";
    }

    @RequestMapping("/mq")
    @ResponseBody
    String mq() {
        mqSender.send("hello imooc");
        return "Hello World!";
    }

     /**
      *  @author jeeshv
      *  @Description 仿jsp插件测试
      *  @Date 23:41 2019/3/11
      **/
    @RequestMapping("/thymeleaf")
    @ResponseBody
    public String thymeleaf(Model model){
        model.addAttribute("name","JIM");
        return "hello";
    }

     /**
      *  @author jeeshv
      *  @Description 查询测试
      *  @Date 23:41 2019/3/11
      **/
    @RequestMapping("/db/get")
    @ResponseBody
    public Result<User> doget(){
        User user = userService.getById(1);
        return Result.success(user);
    }

    @RequestMapping("/redis/get")
    @ResponseBody
    public Result<User> redisGet() {
        User  user  = redisService.get(UserKey.getById, ""+1, User.class);
        return Result.success(user);
    }

    @RequestMapping("/redis/set")
    @ResponseBody
    public Result<Boolean> redisSet() {
        User user  = new User();
        user.setId(1);
        user.setName("1111");
        redisService.set(UserKey.getById, ""+1, user);//UserKey:id1
        return Result.success(true);
    }
     /**
      *  @author jeeshv
      *  @Description 事务测试
      *  @Date 23:41 2019/3/11
      **/
    @RequestMapping("/db/tx")
    @ResponseBody
    public Result<Boolean> dbtx(){
        boolean tx = userService.tx();
        return Result.success(tx);
    }
}
