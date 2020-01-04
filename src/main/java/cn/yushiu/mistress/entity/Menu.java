package cn.yushiu.mistress.entity;

import java.io.Serializable;
import java.util.List;

import lombok.Data;

/**
 * menu
 * @author 
 */
@Data
public class Menu implements Serializable {
    /**
     * 菜单ID
     */
    private Integer id;

    /**
     * 菜单地址
     */
    private String url;

    /**
     * 菜单名
     */
    private String name;

    /**
     * 父菜单
     */
    private Integer parentid;

    /**
     * 可用
     */
    private Boolean eabled;

    /**
     * 角色
     */
    private List<Role> roles;

    private static final long serialVersionUID = 1L;
}