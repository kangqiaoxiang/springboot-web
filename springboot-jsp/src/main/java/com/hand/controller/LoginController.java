package com.hand.controller;

import com.hand.pojo.User;
import com.hand.service.UserService;
import com.hand.utils.DateUtils;
import com.hand.utils.Md5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Map;

/**
 * Created by Administrator on 2018/8/16.
 */
@Controller
public class LoginController {
    @Autowired
    private UserService userService;

    @RequestMapping("/index")
    public String hello(){
        return "index";
    }

    /**
     * 用户注册
     * @param map 页面参数
     * @return 跳转到首页
     */
    @RequestMapping("/regist")
    public String registUser(@RequestParam Map<String, Object> map){
        //MD5加密
        String pwd = (String) map.get("password");
        String password = Md5Utils.stringMD5(pwd).substring(0, 20);
        map.put("password",password);
        //年龄类型转换
        int age = Integer.parseInt(map.get("age").toString());
        Date date  = new Date();
        date = DateUtils.getNowDate(date);
        map.put("last_update_date", date);
        map.put("creation_date", date);
        map.put("age", age);
        userService.registerUser(map);
        return "index";
    }

    @RequestMapping("/login")
    public String Login(@RequestParam Map<String, Object> map, Model model, HttpServletRequest request) {
        //MD5加密
        String pwd = (String) map.get("password");
        String password = Md5Utils.stringMD5(pwd).substring(0, 20);
        map.put("password", password);
        User user = userService.login(map);
        String str = null;
        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            str = "list";
        } else {
            model.addAttribute("errormessage", "不好意思，用户名或密码错误");
            str = "index";
        }
        return str;
    }
}
