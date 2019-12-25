package cn.yushiu.mistress.mapper;

import cn.yushiu.mistress.entity.Subscribe;

public interface SubscribeDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Subscribe record);

    int insertSelective(Subscribe record);

    Subscribe selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Subscribe record);

    int updateByPrimaryKey(Subscribe record);
}