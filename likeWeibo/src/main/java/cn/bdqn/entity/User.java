package cn.bdqn.entity;

import lombok.*;

import java.util.Date;
@Data
public class User {
    private Integer userid;
    private String username;
    private String password;
    private String headImage;
    private String phone,email,signature;
    private Integer role;
    private Integer status;
    private Integer age;
    private Integer fans , like;

    private Integer sex;
    private Date ucreateDate;


}
