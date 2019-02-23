package cn.bdqn.test;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
public class Dongtai {
    private int dtid;
    private String dtcontent;
    private String dtImage;
    private int userId;
    private Integer topicId;
    private Timestamp dtcreatDate;
    private Integer dtStatus;
    private Integer likeCount;
    private Integer forCount;

    @Id
    @Column(name = "dtid", nullable = false)
    public int getDtid() {
        return dtid;
    }

    public void setDtid(int dtid) {
        this.dtid = dtid;
    }

    @Basic
    @Column(name = "dtcontent", nullable = false, length = 500)
    public String getDtcontent() {
        return dtcontent;
    }

    public void setDtcontent(String dtcontent) {
        this.dtcontent = dtcontent;
    }

    @Basic
    @Column(name = "dtImage", nullable = true, length = 500)
    public String getDtImage() {
        return dtImage;
    }

    public void setDtImage(String dtImage) {
        this.dtImage = dtImage;
    }

    @Basic
    @Column(name = "user_id", nullable = false)
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Basic
    @Column(name = "topic_id", nullable = true)
    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    @Basic
    @Column(name = "dtcreatDate", nullable = false)
    public Timestamp getDtcreatDate() {
        return dtcreatDate;
    }

    public void setDtcreatDate(Timestamp dtcreatDate) {
        this.dtcreatDate = dtcreatDate;
    }

    @Basic
    @Column(name = "dtStatus", nullable = true)
    public Integer getDtStatus() {
        return dtStatus;
    }

    public void setDtStatus(Integer dtStatus) {
        this.dtStatus = dtStatus;
    }

    @Basic
    @Column(name = "likeCount", nullable = true)
    public Integer getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(Integer likeCount) {
        this.likeCount = likeCount;
    }

    @Basic
    @Column(name = "forCount", nullable = true)
    public Integer getForCount() {
        return forCount;
    }

    public void setForCount(Integer forCount) {
        this.forCount = forCount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Dongtai dongtai = (Dongtai) o;
        return dtid == dongtai.dtid &&
                userId == dongtai.userId &&
                Objects.equals(dtcontent, dongtai.dtcontent) &&
                Objects.equals(dtImage, dongtai.dtImage) &&
                Objects.equals(topicId, dongtai.topicId) &&
                Objects.equals(dtcreatDate, dongtai.dtcreatDate) &&
                Objects.equals(dtStatus, dongtai.dtStatus) &&
                Objects.equals(likeCount, dongtai.likeCount) &&
                Objects.equals(forCount, dongtai.forCount);
    }

    @Override
    public int hashCode() {

        return Objects.hash(dtid, dtcontent, dtImage, userId, topicId, dtcreatDate, dtStatus, likeCount, forCount);
    }
}
