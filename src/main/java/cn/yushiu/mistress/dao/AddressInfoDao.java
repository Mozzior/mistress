package cn.yushiu.mistress.dao;

import cn.yushiu.mistress.entity.AddressInfo;

public interface AddressInfoDao {
    int deleteByPrimaryKey(Integer id);

    int insert(AddressInfo record);

    int insertSelective(AddressInfo record);

    AddressInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AddressInfo record);

    int updateByPrimaryKey(AddressInfo record);
}