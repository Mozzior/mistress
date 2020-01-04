package cn.yushiu.mistress.entity;

import java.io.Serializable;
import lombok.Data;

/**
 * role
 * @author 
 */
@Data
public class Role implements Serializable {
    /**
     * 权限ID
     */
    private Integer id;

    /**
     * 权限名
     */
    private String name;

    /**
     * 权限描述
     */
    private String desc;

    private static final long serialVersionUID = 1L;
}