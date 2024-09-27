package com.example.apistudy.config.oauth;

import com.example.apistudy.config.auth.PrincipalDetails;
import com.example.apistudy.config.oauth.provider.GoogleUserInfo;
import com.example.apistudy.config.oauth.provider.KakaoUserInfo;
import com.example.apistudy.config.oauth.provider.OAuth2UserInfo;
import com.example.apistudy.dto.UserDTO;
import com.example.apistudy.entity.User;
import com.example.apistudy.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class OAuth2PrincipalDetailsService extends DefaultOAuth2UserService {

    @Autowired
    private UserRepository userRepository;



    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = super.loadUser(userRequest);
        System.out.println("ReigistrationId: " +
                userRequest.getClientRegistration().getRegistrationId());
        System.out.println("AccessToken: " + userRequest.getAccessToken().getTokenValue());
        System.out.println("getAttributes: " + oAuth2User.getAttributes());
        OAuth2UserInfo oAuth2UserInfo = null;
        String Provider = userRequest.getClientRegistration().getRegistrationId();
        if(Provider.equals("google")) {
            // 구글 로그인 요청
            System.out.println("구글 로그인 요청");
            oAuth2UserInfo = new GoogleUserInfo(oAuth2User.getAttributes());
        } else if(Provider.equals("naver")) {
            // 네이버 로그인 요청
            System.out.println("네이버 로그인 요청");

        } else if(Provider.equals("kakao")) {
            // 카카오 로그인 요청
            System.out.println("카카오 로그인 요청");
            oAuth2UserInfo = new KakaoUserInfo(oAuth2User.getAttributes());
        }


        String providerId = oAuth2UserInfo.getProviderId();
        String password = "+";
        String email = oAuth2UserInfo.getEmail();
        String provider = Provider;
        String username = userRequest.getClientRegistration().getRegistrationId() +
                "_" + oAuth2User.getAttribute("sub");
        String role = "ROLE_USER";

        User userEntity = userRepository.findByUsername(username);

        if(Objects.isNull(userEntity)) {
            UserDTO userDTO = new UserDTO();
            userDTO.setPassword(password);
            userDTO.setProviderId(providerId);
            userDTO.setProvider(provider);
            userDTO.setEmail(email);
            userDTO.setUsername(username);
            userDTO.setRole(role);

            userEntity = userDTO.toEntity();

            userRepository.save(userEntity);
        }
        return new PrincipalDetails(userEntity, oAuth2User.getAttributes());
    }
}
