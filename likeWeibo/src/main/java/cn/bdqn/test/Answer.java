package cn.bdqn.test;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Objects;

@Entity
public class Answer {
    private int aid;
    private int xId;
    private int qId;
    private String acontent;

    @Id
    @Column(name = "aid", nullable = false)
    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    @Basic
    @Column(name = "x_id", nullable = false)
    public int getxId() {
        return xId;
    }

    public void setxId(int xId) {
        this.xId = xId;
    }

    @Basic
    @Column(name = "q_id", nullable = false)
    public int getqId() {
        return qId;
    }

    public void setqId(int qId) {
        this.qId = qId;
    }

    @Basic
    @Column(name = "acontent", nullable = false, length = 500)
    public String getAcontent() {
        return acontent;
    }

    public void setAcontent(String acontent) {
        this.acontent = acontent;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Answer answer = (Answer) o;
        return aid == answer.aid &&
                xId == answer.xId &&
                qId == answer.qId &&
                Objects.equals(acontent, answer.acontent);
    }

    @Override
    public int hashCode() {

        return Objects.hash(aid, xId, qId, acontent);
    }
}
