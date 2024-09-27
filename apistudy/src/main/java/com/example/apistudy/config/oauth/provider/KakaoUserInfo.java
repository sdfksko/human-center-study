package com.example.apistudy.config.oauth.provider;

import java.util.Map;

public class KakaoUserInfo implements OAuth2UserInfo{
    private Map<String, Object> attrs;

    public KakaoUserInfo(Map<String, Object> attrs) {
        this.attrs = attrs;
    }


    @Override
    public String getProvider() {
        return "kakao";
    }

    @Override
    public String getProviderId() {
        return attrs.get("id").toString();
    }

    @Override
    public String getEmail() {
        return null;
    }

    @Override
    public String getUsername() {
        return (String)((Map)attrs.get("properties")).get("name");
    }
}
