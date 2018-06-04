package com.neu.shop.controller;



import com.neu.shop.service.WeChatService;
import com.neu.shop.util.SignUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;


@Controller
@RequestMapping("/wechatCon")
public class WeChatController {


    @Autowired
    WeChatService weChatService;

    @RequestMapping(value = "/check.do",method = RequestMethod.GET)
    @ResponseBody
    public String  doGet(HttpServletRequest request, HttpServletResponse response) {
        //logger.info("验证请求来自微信服务器开始");
        // 微信加密签名
        String signature = request.getParameter("signature");
        // 时间戳
        String timestamp = request.getParameter("timestamp");
        // 随机数
        String nonce = request.getParameter("nonce");
        // 随机字符串
        String echostr = request.getParameter("echostr");

        if (SignUtil.checkSignature(signature, timestamp, nonce)) {
            //logger.info("验证请求来自微信服务器通过："+echostr);
            return echostr;
        }
        return  "";
    }

    @RequestMapping(value = "/check.do",method = RequestMethod.POST)
    public void doPost(String signature, String timestamp, String nonce, String echostr, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (SignUtil.checkSignature(signature, timestamp, nonce)) {
            //out.print(echostr);
            String respMessage = weChatService.processRequest(request);
            out.print(respMessage);
        }
        out.close();
        out = null;
    }

}
