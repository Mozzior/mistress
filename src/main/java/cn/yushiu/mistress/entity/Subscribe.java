package cn.yushiu.mistress.entity;

import java.io.Serializable;
import lombok.Data;

/**
 * address_info
 * @author 
 */
@Data
public class Subscribe implements Serializable {
    /**
     * 地址ID
     */
    private Integer id;

    /**
     * 用户ID
     */
    private Integer uid;

    /**
     * 默认地址0非1是
     */
    private Boolean status;

    /**
     * 联系电话
     */
    private String tel;

    /**
     * 接收者姓名
     */
    private String reveivername;

    private static final long serialVersionUID = 1L;
}