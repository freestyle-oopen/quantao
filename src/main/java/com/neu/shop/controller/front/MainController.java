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

private static final int pageSize=96;
    private static final int pageSizemain=300;

    private static final int pagetwo=300;
    private static final int pagesousuo=200;
    @Autowired
    private ClassifyService classifyService;

    @Autowired
    private GoodsService goodsService;
//Zc&i4lLz>y,B         ren8EO_E3.@#FG%Llo
    @RequestMapping("/main")
    public String showAllGoods(Model model,Integer pageNo,Integer classify) {
        if(pageNo==null ||pageNo<1){
            pageNo=1;
        }

       // List<Classify> classifies = classifyService.loadAllFirstClass();;
        List<Goods> goods = goodsService.loadAllGoods(pageNo,pageSize,classify);
        int count = goodsService.loadAllGoodsCount(classify);
        Integer total = count / pageSize;
        if((count%pageSize)>0){
            total++;
        }
        //model.addAttribute("classifies", classifies);
        model.addAttribute("goods", goods);
        model.addAttribute("pageBean",new Page(pageNo,20));
        return "main2";
    }
    @RequestMapping("/class")
    public String showClass(Model model,Integer pageNo,Integer classify) {
        if(pageNo==null ||pageNo<1){
            pageNo=1;
        }
        // List<Classify> classifies = classifyService.loadAllFirstClass();;
        List<Goods> goods = goodsService.loadAllGoods(pageNo,pageSize,classify);
        int count = goodsService.loadAllGoodsCount(classify);
        Integer total = count / pageSize;
        if((count%pageSize)>0){
            total++;
        }
        //model.addAttribute("classifies", classifies);
        model.addAttribute("goods", goods);
        model.addAttribute("pageBean",new Page(pageNo,total));
        model.addAttribute("classify", classify);

        return "classgoods";
    }
    @RequestMapping("/freetwo")
    public String two(Model model,Integer pageNo,Integer price) {
        if(pageNo==null ||pageNo<1){
            pageNo=1;
        }
        // List<Classify> classifies = classifyService.loadAllFirstClass();;
        List<Goods> goods = goodsService.loadAllPriceGoods(pageNo,pagetwo,price);
        int count = goodsService.loadAllPriceGoodsCount(price);
        Integer total = count / pagetwo;
        if((count%pagetwo)>0){
            total++;
        }
        //model.addAttribute("classifies", classifies);
        model.addAttribute("goods", goods);
        model.addAttribute("pageBean",new Page(pageNo,20));
        if(price==20){
            return "two";
        }
       return "nice";
    }


    @RequestMapping("/search")
    public String souduo(Model model,Integer pageNo,String search) {
        if(pageNo==null ||pageNo<1){
            pageNo=1;
        }
        // List<Classify> classifies = classifyService.loadAllFirstClass();;
        List<Goods> goods = goodsService.loadSearchGoods(pageNo,pagesousuo,search);
        int count = goodsService.loadSearchGoodsCount(search);
        Integer total = count / pagesousuo;
        if((count%pagesousuo)>0){
            total++;
        }
        model.addAttribute("search", search);
        model.addAttribute("goods", goods);
        model.addAttribute("pageBean",new Page(pageNo,total));
        return "sousuo";
    }
}
