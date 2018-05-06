package com.neu.shop.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.neu.shop.pojo.*;
import com.neu.shop.service.GoodsService;
import com.neu.shop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 文辉 on 2017/7/26.
 */
@Controller
@RequestMapping("/admin/order")
public class AdminOrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private GoodsService goodsService;

    @RequestMapping("/send")
    public String sendOrder(@RequestParam(value = "page",defaultValue = "1")Integer pn, Model model, HttpSession session) {

        return null;
    }

    @RequestMapping("/sendGoods")
    public String sendGoods(Integer orderid, HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null) {
            return "redirect:/admin/login";
        }
        Order order = new Order();
        order.setOrderid(orderid);
        order.setIssend(true);
        orderService.updateOrderByKey(order);
        return "redirect:/admin/order/send";
    }

    @RequestMapping("/receiver")
    public String receiveOrder(@RequestParam(value = "page",defaultValue = "1")Integer pn, Model model,HttpSession session) {
        return null;
    }

    @RequestMapping("/complete")
    public String completeOrder(@RequestParam(value = "page", defaultValue = "1") Integer pn, Model model, HttpSession session) {
        return null;
    }
}
