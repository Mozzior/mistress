package cn.yushiu.mistress.mapper;

import cn.yushiu.mistress.entity.Menu;
import cn.yushiu.mistress.entity.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    List<Menu> getAllMenus();

    List<Role> getRoles();
}