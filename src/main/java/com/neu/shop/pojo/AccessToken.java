package com.neu.shop.pojo;

public class AccessToken {
    private long fid;
    private String faccesstoken;
    private Long fexpiresin;

    public AccessToken(String faccesstoken, Long fexpiresin) {
        this.faccesstoken = faccesstoken;
        this.fexpiresin = fexpiresin;
    }

    public AccessToken() {
        super();
    }

    public Long getFid(){
        return  fid;
    }

    public void setFid(long fid) {
        this.fid = fid;
    }

    public String getFaccesstoken() {
        return faccesstoken;
    }

    public void setFaccesstoken(String faccesstoken) {
        this.faccesstoken = faccesstoken;
    }

    public Long getFexpiresin() {
        return fexpiresin;
    }

    public void setFexpiresin(Long fexpiresin) {
        this.fexpiresin = fexpiresin;
    }
}