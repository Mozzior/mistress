package cn.yushiu.mistress.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * user
 * @author 
 */
@Data
public class User implements UserDetails {
    /**
     * 用户ID
     */
    private Integer id;

    /**
     * 用户头像
     */
    private String faceimg;

    /**
     * 用户名
     */
    private String username;

    /**
     * 用户密码
     */
    private String userpass;

    /**
     * 生日
     */
    private Date birthday;

    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 用户等级
     */
    private Boolean grade;

    /**
     * 账户是否可用
     */
    private Boolean enabled;

    /**
     * 账户是否被锁
     */
    private Boolean locked;

    /**
     * 权限
     */
    private List<Role> roles;

    private static final long serialVersionUID = 1L;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        for (Role role:roles ) {
            authorities.add(new SimpleGrantedAuthority(role.getName()));
        }
        return authorities;
    }

    @Override
    public String getPassword() {
        return getUserpass();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return !locked;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return enabled;
    }
}