package com.neu.shop.controller.admin;

import com.neu.shop.pojo.Admin;
import com.neu.shop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.MessageDigest;

/**
 * Created by 文辉 on 2017/7/19.
 */
@Controller
@RequestMapping("/admin")
public class LoginController {

    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public String adminLogin() {
        return "adminLogin";
    }

    @RequestMapping("/confirmLogin")
    public String confirmLogin(Admin admin, Model model, HttpServletRequest request) {
        Admin selectAdmin = adminService.selectByName(admin);
        if (selectAdmin == null) {
            model.addAttribute("errorMsg", "用户名或密码错误");
            return "adminLogin";
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("admin", selectAdmin);
            return "redirect:/admin/user/show";
        }
    }

    @RequestMapping("/logout")
    public String adminLogout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("admin");
        return "redirect:/admin/login";
    }

    /*@RequestMapping("/index")
    public String showAdminIndex() {
        return "user";
    }*/





    public  String MD5(String key) {
        //这个数组在转十六进制字符串的时候用
        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        try {
            //先将要加密的字符串转换成byte字节数组
            byte[] btInput = key.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式 下面就是将byte数组转换成十六进制的字符串的代码了
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            return null;
        }
    }
}
