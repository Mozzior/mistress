package cn.yushiu.mistress.mapper;

import cn.yushiu.mistress.entity.Categories;

public interface CategoriesDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Categories record);

    int insertSelective(Categories record);

    Categories selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Categories record);

    int updateByPrimaryKey(Categories record);
}