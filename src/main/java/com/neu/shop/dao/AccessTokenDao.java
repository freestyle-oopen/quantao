package com.neu.shop.dao;

import com.neu.shop.pojo.AccessToken;
import org.springframework.stereotype.Component;

@Component
public interface AccessTokenDao {

     AccessToken getAccessToken();

    void updateAccessToken(AccessToken accessToken);
}