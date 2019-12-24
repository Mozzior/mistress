package cn.yushiu.mistress.dao;

import cn.yushiu.mistress.entity.Menu_role;

public interface Menu_roleDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Menu_role record);

    int insertSelective(Menu_role record);

    Menu_role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Menu_role record);

    int updateByPrimaryKey(Menu_role record);
}