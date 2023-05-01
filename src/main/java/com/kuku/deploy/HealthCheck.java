package com.kuku.deploy;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/check")
public class HealthCheck {

    @Value("${jwt.secret-key}")
    private String secretKey;

    @Value("${jwt.access-token-expired-time}")
    private String accessExpiredTime;

    @GetMapping
    public String healthCheck() {
        return secretKey;
    }

    @GetMapping("/token1")
    public String accessToken() {
        return accessExpiredTime;
    }
}
