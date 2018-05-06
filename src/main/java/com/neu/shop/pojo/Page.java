package com.neu.shop.pojo;

public class Page {
    private int page;
    private int total;
    public Page(){}
   public Page(int page,int total){
       this.page=page;
       this.total=total;
   }
    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
}
