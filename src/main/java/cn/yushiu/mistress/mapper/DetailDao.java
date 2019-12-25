package cn.yushiu.mistress.mapper;

import cn.yushiu.mistress.entity.Detail;

public interface DetailDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Detail record);

    int insertSelective(Detail record);

    Detail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Detail record);

    int updateByPrimaryKey(Detail record);
}