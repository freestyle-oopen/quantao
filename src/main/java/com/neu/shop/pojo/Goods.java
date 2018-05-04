package com.neu.shop.pojo;

import java.util.Date;
import java.util.List;

public class Goods {
    private int id;

    private String title;

    private float price;

    private String guideUrl;

    private String url;

    private String icon;

    private int userId;

    private Date creatTime;

    private float rebate;

    private int coupon;

    private int source;

    private int freeShipping;

    private int isShelf;

    private int firstClass;

    private int secondClass;

    private int saleNum;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getGuideUrl() {
        return guideUrl;
    }

    public void setGuideUrl(String guideUrl) {
        this.guideUrl = guideUrl;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    public float getRebate() {
        return rebate;
    }

    public void setRebate(float rebate) {
        this.rebate = rebate;
    }

    public int getCoupon() {
        return coupon;
    }

    public void setCoupon(int coupon) {
        this.coupon = coupon;
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

    public int getIsShelf() {
        return isShelf;
    }

    public void setIsShelf(int isShelf) {
        this.isShelf = isShelf;
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

    public int getSaleNum() {
        return saleNum;
    }

    public void setSaleNum(int saleNum) {
        this.saleNum = saleNum;
    }
}