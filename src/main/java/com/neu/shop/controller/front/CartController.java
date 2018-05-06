package com.neu.shop.controller.front;

import com.neu.shop.pojo.*;
import com.neu.shop.service.GoodsService;
import com.neu.shop.service.ShopCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by 文辉 on 2017/7/24.
 */
@Controller
public class CartController {

    @Autowired
    private ShopCartService shopCartService;

    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/addCart")
    public String addCart(ShopCart shopCart, HttpServletRequest request) {return null;
    }

    @RequestMapping("/showcart")
    public String showCart(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if(user == null) {
            return "redirect:/login";
        }
        return "shopcart";
    }

    @RequestMapping("/cartjson")
    @ResponseBody
    public Msg getCart(HttpSession session) {
      return null;
    }

    @RequestMapping(value = "/deleteCart/{goodsid}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteCart(@PathVariable("goodsid")Integer goodsid, HttpSession session) {
      return null;
    }

    @RequestMapping("/update")
    @ResponseBody
    public Msg updateCart(Integer goodsid,Integer num,HttpSession session) {
       return null;
    }
}
