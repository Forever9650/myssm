package cn.bdqn.entity;

import lombok.Data;

import java.util.Date;
@Data

public class Dongtai {
    private Integer dtid;
    //动态内容
    private String dtcontent;
    //动态图片
    private String dtImage;
    //发表用户id
    private Integer user_id;
    //话题id对应话题表
    private Integer topic_id;
    //创建时间
    private Date dtcreatDate;
    //0公开1，仅关注，2仅自己，3陌生人
    private Integer dtStatus ;
    //点赞数
    private Integer likeCount ;
    //转发次数
    private Integer forCount;
    private String username;
    private Topic topic;
    //添加
    public Dongtai(Integer dtid, String dtcontent, String dtImage, Integer user_id, Integer topic_id, Integer dtStatus) {
        this.dtid = dtid;
        this.dtcontent = dtcontent;
        this.dtImage = dtImage;
        this.user_id = user_id;
        this.topic_id = topic_id;
        this.dtStatus = dtStatus;
    }

    public Dongtai() {
    }

    //修改
    public Dongtai(Integer dtid, Integer dtStatus, Integer likeCount, Integer forCount) {
        this.dtid = dtid;
        this.dtStatus = dtStatus;
        this.likeCount = likeCount;
        this.forCount = forCount;
    }
}
