package cn.yushiu.mistress.mapper;

import cn.yushiu.mistress.entity.Role;

public interface RoleDao {
    int deleteByPrimaryKey(Boolean id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Boolean id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
}