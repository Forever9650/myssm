package cn.bdqn.services;

import cn.bdqn.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    User login(User user);
    Integer addUser(User user);
    List<User> queryAll(@Param("username") String username);
    Integer updateUser(User user);
    //查看我关注的用户
    List<User> queryUserWhoILike(Integer userid);
    //或者关注我的用户
    List<User> queryUserWhoLikeMe(Integer userid);
}
