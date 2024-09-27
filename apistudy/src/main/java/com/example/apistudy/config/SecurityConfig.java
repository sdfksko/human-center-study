package com.example.apistudy.config;

import com.example.apistudy.config.oauth.OAuth2PrincipalDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfig {

    @Autowired
    private OAuth2PrincipalDetailsService oAuth2PrincipalDetailsService;

    @Bean
    BCryptPasswordEncoder encodePw() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
            .csrf(AbstractHttpConfigurer::disable)

                .authorizeHttpRequests((authorizeHttpRequests)
                        -> authorizeHttpRequests.requestMatchers("/user/**").authenticated()
                                                .anyRequest().permitAll()
                ).formLogin(formLogin ->
                        formLogin.loginPage("/loginForm")
                                .loginProcessingUrl("/login")
                                .defaultSuccessUrl("/success")
                ).logout(logout ->
                        logout.logoutSuccessUrl("/loginForm")
                ).oauth2Login(oauth2Login ->
                        oauth2Login.loginPage("/loginForm")
                                .userInfoEndpoint(userInfoEndpointConfig ->
                                        userInfoEndpointConfig.userService(oAuth2PrincipalDetailsService))
                );


        return http.build();
    }
}
