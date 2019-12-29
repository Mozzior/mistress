package cn.yushiu.mistress.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class CoreController {
    @GetMapping("/{page}")
    public String page(@PathVariable String page){
        return page;
    }
}
