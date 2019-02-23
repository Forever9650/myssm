package cn.bdqn.test;

import cn.bdqn.entity.Topic;
import cn.bdqn.services.TopicService;
import cn.bdqn.util.Page;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

public class TopicServiceImplTest {
    private TopicService service;
    @Before
    public void setUp() throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        service = (TopicService) context.getBean("topicService");
    }

    @Test
    public void queryAllTopicByLimit() {
        Page<Topic> page = new Page<>();
        page.setPageSize(5);
        page.setPageNo(1);
        service.queryAllTopicByLimit(page);
        for(Topic t : page.getList()){
            System.err.println(t);
        }


    }
}