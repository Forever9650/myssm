package cn.bdqn.dao;

import cn.bdqn.entity.Topic;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TopicMapper {
    List<Topic> queryAll(@Param("start") Integer start , @Param("pageSize") Integer pageSize);
    Integer queryCount();

}
