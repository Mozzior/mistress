package cn.yushiu.mistress.service.impl;

import cn.yushiu.mistress.entity.User;
import cn.yushiu.mistress.mapper.UserDao;
import cn.yushiu.mistress.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDao.loadUserByUsername(username);
        if (user == null){
            throw new UsernameNotFoundException("账户不存在");
        }
        user.setRoles(userDao.getUserRolesByUid(user.getId()));
        return user;
    }
}
