package cn.bdqn.entity;

public class Provinces {
    private Integer id , provincesid;
    private String provinces;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProvincesid() {
        return provincesid;
    }

    public void setProvincesid(Integer provincesid) {
        this.provincesid = provincesid;
    }

    public String getProvinces() {
        return provinces;
    }

    public void setProvinces(String provinces) {
        this.provinces = provinces;
    }

    @Override
    public String toString() {
        return "Provinces{" +
                "id=" + id +
                ", provincesid=" + provincesid +
                ", provinces='" + provinces + '\'' +
                '}';
    }
}
