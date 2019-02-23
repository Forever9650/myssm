package cn.bdqn.entity;

import lombok.Data;

import java.util.Date;
@Data
public class Topic {
    //话题相关
    private  Integer tpid;
    //话题名
    private  String title;
    //话题创建时间
    private Date tpcreatDate;
    //谁创建的
    private  Integer creatByUserid;
    private Integer hot;
}
