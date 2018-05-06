package com.neu.shop.controller.front;


import com.neu.shop.pojo.Classify;
import com.neu.shop.pojo.Goods;
import com.neu.shop.pojo.Page;
import com.neu.shop.service.CateService;
import com.neu.shop.service.ClassifyService;
import com.neu.shop.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MainController {

private static final int pageSize=10;
    @Autowired
    private ClassifyService classifyService;

    @Autowired
    private GoodsService goodsService;
//Zc&i4lLz>y,B         ren8EO_E3.@#FG%Llo
    @RequestMapping("/main")
    public String showAllGoods(Model model,Integer pageNo) {
        if(pageNo==null ||pageNo<1){
            pageNo=1;
        }
        List<Classify> classifies = classifyService.loadAllFirstClass();;
        List<Goods> goods = goodsService.loadAllGoods(pageNo,pageSize);
        int count = goodsService.loadAllGoodsCount();
        Integer total = count / pageSize;
        if((count%pageSize)>0){
            total++;
        }
        model.addAttribute("classifies", classifies);
        model.addAttribute("goods", goods);
        model.addAttribute("pageBean",new Page(pageNo,20));
        return "main1";
    }

}
