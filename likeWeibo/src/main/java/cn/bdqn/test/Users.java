package cn.bdqn.test;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
public class Users {
    private int userid;
    private String username;
    private String password;
    private String headImage;
    private String phone;
    private String email;
    private Integer role;
    private int status;
    private String signature;
    private Timestamp ucreateDate;
    private Integer age;
    private Integer sex;

    @Id
    @Column(name = "userid", nullable = false)
    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    @Basic
    @Column(name = "username", nullable = false, length = 20)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "password", nullable = false, length = 20)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "headImage", nullable = true, length = 1000)
    public String getHeadImage() {
        return headImage;
    }

    public void setHeadImage(String headImage) {
        this.headImage = headImage;
    }

    @Basic
    @Column(name = "phone", nullable = true, length = 15)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "email", nullable = true, length = 50)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "role", nullable = true)
    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    @Basic
    @Column(name = "status", nullable = false)
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Basic
    @Column(name = "signature", nullable = true, length = 100)
    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    @Basic
    @Column(name = "ucreateDate", nullable = false)
    public Timestamp getUcreateDate() {
        return ucreateDate;
    }

    public void setUcreateDate(Timestamp ucreateDate) {
        this.ucreateDate = ucreateDate;
    }

    @Basic
    @Column(name = "age", nullable = true)
    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    @Basic
    @Column(name = "sex", nullable = true)
    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Users users = (Users) o;
        return userid == users.userid &&
                status == users.status &&
                Objects.equals(username, users.username) &&
                Objects.equals(password, users.password) &&
                Objects.equals(headImage, users.headImage) &&
                Objects.equals(phone, users.phone) &&
                Objects.equals(email, users.email) &&
                Objects.equals(role, users.role) &&
                Objects.equals(signature, users.signature) &&
                Objects.equals(ucreateDate, users.ucreateDate) &&
                Objects.equals(age, users.age) &&
                Objects.equals(sex, users.sex);
    }

    @Override
    public int hashCode() {

        return Objects.hash(userid, username, password, headImage, phone, email, role, status, signature, ucreateDate, age, sex);
    }
}
