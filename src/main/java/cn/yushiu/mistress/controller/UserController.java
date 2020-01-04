package cn.yushiu.mistress.controller;

import cn.yushiu.mistress.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * @author Administrator
 */
@Controller("/user")
public class UserController {

    @Autowired
    UserService userService;


}
