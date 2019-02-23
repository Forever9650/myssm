package cn.bdqn.dao;

import cn.bdqn.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    /**
     * @param user
     * @return
     */
    User login(User user);//用户名或手机号登录
    User add(User user);

    /**
     * @param username
     * @return
     */
    List<User> queryAll(@Param("username") String username);
    Integer addUser(User user);
    Integer updateUser(User user);
    //查看我关注的用户
    List<User> queryUserWhoILike(Integer userid);
    //或者关注我的用户
    List<User> queryUserWhoLikeMe(Integer userid);
}
