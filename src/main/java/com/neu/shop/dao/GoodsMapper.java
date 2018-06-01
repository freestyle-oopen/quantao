package com.neu.shop.dao;

import com.neu.shop.pojo.Goods;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface GoodsMapper {

    List<Goods> loadAllGoods(Map<String,Integer> param);

    int loadAllGoodsCount(Map<String,Integer> param);

    List<Goods> loadAllPriceGoods(Map<String, Integer> param);

    int loadAllPriceGoodsCount(Map<String, Integer> param);

    List<Goods> loadSearchGoods(Map<String, String> param);
    int loadSearchGoodsCount(Map<String, String> param);
}