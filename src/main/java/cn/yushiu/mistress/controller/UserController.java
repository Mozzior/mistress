package cn.yushiu.mistress.controller;

import cn.yushiu.mistress.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author Administrator
 */
@Controller("/user")
public class UserController {

    @Autowired
    UserService userService;

    @GetMapping("/login")
    public String toLogin(){
        return "login";
    }
}
