package cn.yushiu.mistress.controller;

import cn.yushiu.mistress.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Administrator
 */
@RestController
public class UserController {

    @Autowired
    UserService userService;

    @Cacheable("userCache")
    @GetMapping("/sys/getUser")
    public String getUser(){
        String name = userService.loadUserByUsername("sys").getUsername();
        return name;
    }

    @CacheEvict("userCache")
    @GetMapping("/sys/delUser")
    public String setUser(){
        String name = userService.loadUserByUsername("sys").getUsername();
        return name;
    }
}
