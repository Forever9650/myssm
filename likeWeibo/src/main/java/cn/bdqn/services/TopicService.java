package cn.bdqn.services;

import cn.bdqn.entity.Topic;
import cn.bdqn.util.Page;

public interface TopicService {
   void queryAllTopicByLimit(Page<Topic> page);
}
