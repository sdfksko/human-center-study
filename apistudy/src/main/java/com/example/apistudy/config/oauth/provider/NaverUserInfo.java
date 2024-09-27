package com.example.apistudy.config.oauth.provider;

import java.util.Map;

public class NaverUserInfo implements OAuth2UserInfo{

    private Map<String, Object> attrs;

    private NaverUserInfo(Map<String, Object> attrs) {
        this.attrs = attrs;
    }

    @Override
    public String getProvider() {
        return "naver";
    }

    @Override
    public String getProviderId() {
        return (String)attrs.get("id");
    }

    @Override
    public String getEmail() {
        return (String)attrs.get("email");
    }

    @Override
    public String getUsername() {
        return (String)attrs.get("name");
    }
}
