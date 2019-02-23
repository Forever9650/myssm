package cn.bdqn.services;

import cn.bdqn.dao.TopicMapper;
import cn.bdqn.entity.Topic;
import cn.bdqn.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("topicService")
public class TopicServiceImpl implements TopicService {
    @Autowired
    private TopicMapper topicMapper;
    @Override
    public void queryAllTopicByLimit(Page<Topic> page) {
        Integer count = topicMapper.queryCount();
        page.setTotalCount(count);
        List<Topic> list = topicMapper.queryAll(page.getStart(), page.getPageSize());
        page.setList(list);
    }
}
