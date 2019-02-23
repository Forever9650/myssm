package cn.bdqn.services;

import cn.bdqn.entity.Dongtai;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DongtaiService {
    //添加动态
    Integer addDongtai(Dongtai dt);
    //修改  只有点赞 转发 和范围长度
    Integer updateDongtai(Dongtai dt);
    //删除
    Integer deleteDongtai(Integer dtid);
    //查看别人的  全部，有通过用户id查 ， 通过话题查topic_id ,内容的模糊查询
    List<Dongtai> queryAllOthers(@Param("userid") Integer userid , @Param("sort") Integer sort,
                                 @Param("topicid") Integer topicid, @Param("dtcontent") String dtcontent
    );
    //查看自己的
    List<Dongtai> queryAllSelf(@Param("userid") Integer userid);
    //查看自己关注的人的动态
    List<Dongtai> queryLikeDongtai(@Param("userid") Integer userid , @Param("isIncl") Integer isIncl);
    List<Dongtai> queryULike( List<Integer> userids);
    //关注人的userid
    List<Integer> queryLikeUserId(Integer userid);
}
