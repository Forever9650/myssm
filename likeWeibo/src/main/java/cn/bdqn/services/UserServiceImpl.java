package cn.bdqn.services;

import cn.bdqn.dao.UserMapper;
import cn.bdqn.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired//转发
    private UserMapper userMapper;
    @Override
    public User login(User user) {
        return userMapper.login(user);
    }

    @Override
    public Integer addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public List<User> queryAll(String username) {
        return userMapper.queryAll(username);
    }

    @Override
    public Integer updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public List<User> queryUserWhoILike(Integer userid) {
        return userMapper.queryUserWhoILike(userid);
    }

    @Override
    public List<User> queryUserWhoLikeMe(Integer userid) {
        return userMapper.queryUserWhoLikeMe(userid);
    }
}
