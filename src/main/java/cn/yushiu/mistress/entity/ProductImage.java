package cn.yushiu.mistress.entity;

import java.io.Serializable;
import lombok.Data;

/**
 * product_image
 * @author 
 */
@Data
public class ProductImage implements Serializable {
    /**
     * 商品图片ID
     */
    private Integer id;

    /**
     * 商品ID
     */
    private Integer pid;

    /**
     * 图片地址
     */
    private String url;

    private static final long serialVersionUID = 1L;
}