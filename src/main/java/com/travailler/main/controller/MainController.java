package com.travailler.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by betterFLY on 2017-10-16.
 */

@Controller
public class MainController {

    @RequestMapping(value = "/main")
    public ModelAndView mainView(){
        ModelAndView mav = new ModelAndView("");
        return mav;
    }


}
