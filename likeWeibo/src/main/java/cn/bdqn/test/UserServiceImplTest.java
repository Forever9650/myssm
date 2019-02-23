package cn.bdqn.test;

import cn.bdqn.entity.User;
import cn.bdqn.services.UserService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;


public class UserServiceImplTest {
    private UserService service ;
    @Before
    public void setUp() throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        service = (UserService) context.getBean("userService");
    }

    @Test
    public void login() {
        User u = new User();
        u.setUsername("18310412907");
        u.setPassword("1234");
        User user = service.login(u);
        System.out.println(user);

    }
    @Test
    public void testQueryAll(){
        List<User> list = service.queryAll("a");
        for(User user:list){
            System.out.println(user);
        }
    }
    @Test
    public void testWhoLikeMe(){
        for(User user :service.queryUserWhoILike(3)){
            System.err.println(user);
        }
    }

    @Test
    public void testAddUser(){
        User user = new User();
        user.setUsername("testImg");
        user.setPassword("1234");
        user.setHeadImage("image");
        user.setPhone("120");
        user.setEmail("2601059174@qq.com");
        Integer count = service.addUser(user);
        System.out.println(count);

    }
}