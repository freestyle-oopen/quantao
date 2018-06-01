package com.neu.shop.service.impl;

import com.neu.shop.dao.GoodsMapper;
import com.neu.shop.pojo.*;
import com.neu.shop.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 文辉 on 2017/7/19.
 */

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

    @Autowired(required = false)
    GoodsMapper goodsMapper;

    @Override
    public List<Goods> loadAllGoods(int pageNo,int pageSize,Integer classify) {
        Map<String ,Integer> param=new HashMap<String, Integer>();
        param.put("startNo",(pageNo-1)*pageSize);
        param.put("endNo",pageSize);
        param.put("classify",classify);
        return goodsMapper.loadAllGoods(param);
    }

    @Override
    public int loadAllGoodsCount(Integer classify) {
        Map<String ,Integer> param=new HashMap<String, Integer>();
        param.put("classify",classify);
        return goodsMapper.loadAllGoodsCount(param);
    }

    @Override
    public List<Goods> loadAllPriceGoods(Integer pageNo, int pageSize, Integer price) {
        Map<String ,Integer> param=new HashMap<String, Integer>();
        param.put("endprice",price);
        if(price==10){
        }else if(price == 20){
         param.put("startprice",9);
        }else{
            return null;
        }
        param.put("startNo",(pageNo-1)*pageSize);
        param.put("endNo",pageSize);
        return goodsMapper.loadAllPriceGoods(param);
    }

    @Override
    public int loadAllPriceGoodsCount(Integer price) {
        Map<String ,Integer> param=new HashMap<String, Integer>();
        param.put("endprice",price);
        if(price==10){
        }else if(price == 20){
            param.put("startprice",9);
        }else{
            return 0;
        }
        return goodsMapper.loadAllPriceGoodsCount(param);
    }

    @Override
    public List<Goods> loadSearchGoods(Integer pageNo, int pageSize, String search) {
        Map<String ,String> param=new HashMap<String, String>();
        param.put("startNo",(pageNo-1)*pageSize+"");
        param.put("endNo",pageSize+"");
        param.put("search",search);
        return goodsMapper.loadSearchGoods(param);
    }

    @Override
    public int loadSearchGoodsCount(String search) {
        Map<String ,String> param=new HashMap<String, String>();
        param.put("search",search);
        return goodsMapper.loadSearchGoodsCount(param);
    }
}
