package com.rabbiter.library.jwt;



import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
@ConfigurationProperties(prefix = "jwt")
@Component  //把該類交給spring進行管理
public class JwtUtils {
    //密鎖
    private String secret;

    // 過期時間 毫秒
    private Long expiration;

    @Override
    public String toString() {
        return "JwtUtils{" +
                "secret='" + secret + '\'' +
                ", expiration=" + expiration +
                '}';
    }

    public String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }

    public Long getExpiration() {
        return expiration;
    }

    public void setExpiration(Long expiration) {
        this.expiration = expiration;
    }

    public JwtUtils() {
    }

    public JwtUtils(String secret, Long expiration) {
        this.secret = secret;
        this.expiration = expiration;
    }

    /**
     * 從數據聲明生成令牌
     *
     * @param claims 數據聲明
     * @return 令牌
     */
    private String generateToken(Map<String, Object> claims) {
        Date expirationDate = new Date(System.currentTimeMillis() + expiration);
        return Jwts.builder().setClaims(claims).setExpiration(expirationDate).signWith(SignatureAlgorithm.HS512, secret).compact();
    }

    /**
     * 從令牌中獲取數據聲明
     *
     * @param token 令牌
     * @return 數據聲明
     */
    public Claims getClaimsFromToken(String token) {
        Claims claims;
        try {
            claims = Jwts.parser().setSigningKey(secret).parseClaimsJws(token).getBody();
        } catch (Exception e) {
            claims = null;
        }
        return claims;
    }

    /**
     * 生成令牌
     *
     * @param username 用戶
     * @return 令牌
     */
    public String generateToken(String username,String userType) {
        Map<String, Object> claims = new HashMap<>(2);
        claims.put(Claims.SUBJECT,username);
        claims.put(Claims.ISSUED_AT, new Date());
        claims.put("userType",userType);
        return generateToken(claims);
    }

    /**
     * 從令牌中獲取用戶名
     *
     * @param token 令牌
     * @return 用戶名
     */
    public String getUsernameFromToken(String token) {
        String username;
        try {
            Claims claims = getClaimsFromToken(token);
            username = claims.getSubject();
        } catch (Exception e) {
            username = null;
        }
        return username;
    }

    /**
     * 判斷令牌是否過期
     *
     * @param token 令牌
     * @return 是否過期
     */
    public Boolean isTokenExpired(String token) {
        Claims claims = getClaimsFromToken(token);
        if(claims == null){
            return true;
        }
        Date expiration = claims.getExpiration();
        return expiration.before(new Date());
    }

    /**
     * 刷新令牌
     *
     * @param token 原令牌
     * @return 新令牌
     */
    public String refreshToken(String token) {
        String refreshedToken;
        try {
            Claims claims = getClaimsFromToken(token);
            claims.put(Claims.ISSUED_AT, new Date());
            refreshedToken = generateToken(claims);
        } catch (Exception e) {
            refreshedToken = null;
        }
        return refreshedToken;
    }

    /**
     * 驗證令牌
     *
     * @param token       令牌
     * @param username 用戶名
     * @return 是否有效
     */
    public Boolean validateToken(String token, String username) {
        String tokenUsername = getUsernameFromToken(token);
        return (username.equals(tokenUsername) && !isTokenExpired(token));
    }

    /**
     * 獲取token過期時間
     * @param token
     * @param
     * @return
     */
    public Long getExpireTime(String token){
        Long expireTime =  Jwts.parser()
                .setSigningKey(secret)
                .parseClaimsJws(token)
                .getBody().getExpiration().getTime();
        return expireTime;
    }
}