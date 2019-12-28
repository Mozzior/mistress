package cn.yushiu.mistress.mapper;

import cn.yushiu.mistress.entity.ProductImage;

public interface ProductImageDao {
    int deleteByPrimaryKey(Integer id);

    int insert(ProductImage record);

    int insertSelective(ProductImage record);

    ProductImage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProductImage record);

    int updateByPrimaryKey(ProductImage record);
}