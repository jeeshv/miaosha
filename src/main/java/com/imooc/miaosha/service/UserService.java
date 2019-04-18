package com.imooc.miaosha.service;/**
 * Created by Administrator on 2019/3/11.
 */

import com.imooc.miaosha.dao.UserDao;
import com.imooc.miaosha.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Queue;

/**
 * @author jeeshv
 * @Description
 * @Date
 **/
@Service
public class UserService {
    @Autowired
    private UserDao userDao;
    public User getById(int id) {
        return userDao.getById(id);
    }

    @Transactional
    public boolean tx() {
        User user = new User(3,"fuck");
        userDao.insert(user);
        User user1 = new User(1,"111");
        userDao.insert(user1);
        return true;
    }
}
