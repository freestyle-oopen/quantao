package com.neu.shop.service;

import com.neu.shop.pojo.*;

import java.util.List;

/**
 * Created by 文辉 on 2017/7/19.
 */

public interface GoodsService {
    public List<Goods> loadAllGoods(int pageNo,int pageSize,Integer classify);

    int loadAllGoodsCount(Integer classify);

    List<Goods> loadAllPriceGoods(Integer pageNo, int pageSize, Integer startprice);

    int loadAllPriceGoodsCount(Integer price);

    List<Goods> loadSearchGoods(Integer pageNo, int pageSize, String search);
    int loadSearchGoodsCount(String search);
}
