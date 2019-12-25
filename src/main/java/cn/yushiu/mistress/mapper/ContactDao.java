package cn.yushiu.mistress.mapper;

import cn.yushiu.mistress.entity.Contact;

public interface ContactDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Contact record);

    int insertSelective(Contact record);

    Contact selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Contact record);

    int updateByPrimaryKey(Contact record);
}