package com.neu.shop.dao;

import com.neu.shop.pojo.Goods;
import com.neu.shop.pojo.GoodsExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface GoodsMapper {
    long countByExample(GoodsExample example);

    int deleteByExample(GoodsExample example);

    int deleteByPrimaryKey(Integer goodsid);

    int insert(Goods record);

    int insertSelective(Goods record);

    List<Goods> selectByExampleWithBLOBs(GoodsExample example);

    List<Goods> selectByExample(GoodsExample example);

    Goods selectByPrimaryKey(Integer goodsid);

    int updateByExampleSelective(@Param("record") Goods record, @Param("example") GoodsExample example);

    int updateByExampleWithBLOBs(@Param("record") Goods record, @Param("example") GoodsExample example);

    int updateByExample(@Param("record") Goods record, @Param("example") GoodsExample example);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKeyWithBLOBs(Goods record);

    int updateByPrimaryKey(Goods record);

    List<Goods> selectByExampleWithBLOBsLimit(GoodsExample digGoodsExample);

    List<Goods> loadAllGoods(Map<String,Integer> param);

    int loadAllGoodsCount(Map<String,Integer> param);

    List<Goods> loadAllPriceGoods(Map<String, Integer> param);

    int loadAllPriceGoodsCount(Map<String, Integer> param);

    List<Goods> loadSearchGoods(Map<String, String> param);
    int loadSearchGoodsCount(Map<String, String> param);
}