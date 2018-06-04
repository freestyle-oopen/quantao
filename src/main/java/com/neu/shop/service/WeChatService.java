package com.neu.shop.service;

import com.neu.shop.pojo.AccessToken;

import javax.servlet.http.HttpServletRequest;

public interface WeChatService {
     AccessToken accessToken();
    void updateAccessToken(AccessToken accessToken);
     AccessToken getAccessToken();
    String processRequest(HttpServletRequest request);

    String getOpenId(String code);
}
