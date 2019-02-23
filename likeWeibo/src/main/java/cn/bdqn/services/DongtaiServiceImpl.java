package cn.bdqn.services;

import cn.bdqn.dao.DongtaiMapper;
import cn.bdqn.entity.Dongtai;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("dongtaiService")
public class DongtaiServiceImpl implements  DongtaiService {
    @Autowired
    private DongtaiMapper dtMapper;
    @Override
    public Integer addDongtai(Dongtai dt) {
        return dtMapper.addDongtai(dt);
    }
    //todo
    @Override
    public Integer updateDongtai(Dongtai dt) {
        return null;
    }

    @Override
    public Integer deleteDongtai(Integer dtid) {
        return dtMapper.deleteDongtai(dtid);
    }

    @Override
    public List<Dongtai> queryAllOthers(Integer userid, Integer sort, Integer topicid, String dtcontent) {
        return dtMapper.queryAllOthers( userid,  sort,  topicid,  dtcontent);
    }

    @Override
    public List<Dongtai> queryAllSelf(Integer userid) {
        return dtMapper.queryAllSelf(userid);
    }

    @Override
    public List<Dongtai> queryLikeDongtai(Integer userid, Integer isIncl) {
        return dtMapper.queryLikeDongtai(userid,isIncl);
    }

    @Override
    public List<Dongtai> queryULike(List<Integer> userids) {
        return dtMapper.queryULike(userids);
    }

    @Override
    public List<Integer> queryLikeUserId(Integer userid) {
        return dtMapper.queryLikeUserId(userid);
    }
}
