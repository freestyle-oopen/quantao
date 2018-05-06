package com.neu.shop.pojo;

import java.util.Date;
import java.util.List;

public class Goods {
    private long id;
    private String title;
    private String icon;
    private String url;
    private String shopName;
    private float price;
    private int saleNum;
    private float rebate;//回扣
    private int isShelf;
    private String guideShortUrl;
    private String guideLongUrl;
    private String guideKey;
    private int source;//来源
    private int freeShipping;//是否包邮
    private int couponTotal;
    private int couponCount;
    private String couponValue;
    private Date couponStart;
    private Date creatEnd;
    private Date creatTime;
    private String couponLongUrl;
    private String couponKey;
    private String couponShortUrl;
    private String isPlan;
    private int firstClass;
    private int secondClass;

    private int page;

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getSaleNum() {
        return saleNum;
    }

    public void setSaleNum(int saleNum) {
        this.saleNum = saleNum;
    }

    public float getRebate() {
        return rebate;
    }

    public void setRebate(float rebate) {
        this.rebate = rebate;
    }

    public int getIsShelf() {
        return isShelf;
    }

    public void setIsShelf(int isShelf) {
        this.isShelf = isShelf;
    }

    public String getGuideShortUrl() {
        return guideShortUrl;
    }

    public void setGuideShortUrl(String guideShortUrl) {
        this.guideShortUrl = guideShortUrl;
    }

    public String getGuideLongUrl() {
        return guideLongUrl;
    }

    public void setGuideLongUrl(String guideLongUrl) {
        this.guideLongUrl = guideLongUrl;
    }

    public String getGuideKey() {
        return guideKey;
    }

    public void setGuideKey(String guideKey) {
        this.guideKey = guideKey;
    }

    public int getSource() {
        return source;
    }

    public void setSource(int source) {
        this.source = source;
    }

    public int getFreeShipping() {
        return freeShipping;
    }

    public void setFreeShipping(int freeShipping) {
        this.freeShipping = freeShipping;
    }

    public int getCouponTotal() {
        return couponTotal;
    }

    public void setCouponTotal(int couponTotal) {
        this.couponTotal = couponTotal;
    }

    public int getCouponCount() {
        return couponCount;
    }

    public void setCouponCount(int couponCount) {
        this.couponCount = couponCount;
    }

    public String getCouponValue() {
        return couponValue;
    }

    public void setCouponValue(String couponValue) {
        this.couponValue = couponValue;
    }

    public Date getCouponStart() {
        return couponStart;
    }

    public void setCouponStart(Date couponStart) {
        this.couponStart = couponStart;
    }

    public Date getCreatEnd() {
        return creatEnd;
    }

    public void setCreatEnd(Date creatEnd) {
        this.creatEnd = creatEnd;
    }

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    public String getCouponLongUrl() {
        return couponLongUrl;
    }

    public void setCouponLongUrl(String couponLongUrl) {
        this.couponLongUrl = couponLongUrl;
    }

    public String getCouponKey() {
        return couponKey;
    }

    public void setCouponKey(String couponKey) {
        this.couponKey = couponKey;
    }

    public String getCouponShortUrl() {
        return couponShortUrl;
    }

    public void setCouponShortUrl(String couponShortUrl) {
        this.couponShortUrl = couponShortUrl;
    }

    public String getIsPlan() {
        return isPlan;
    }

    public void setIsPlan(String isPlan) {
        this.isPlan = isPlan;
    }

    public int getFirstClass() {
        return firstClass;
    }

    public void setFirstClass(int firstClass) {
        this.firstClass = firstClass;
    }

    public int getSecondClass() {
        return secondClass;
    }

    public void setSecondClass(int secondClass) {
        this.secondClass = secondClass;
    }
}