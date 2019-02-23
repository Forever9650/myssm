package cn.bdqn.test;

import cn.bdqn.entity.Dongtai;
import cn.bdqn.services.DongtaiService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.List;

public class DongtaiServiceImplTest {
    private DongtaiService service ;
    @Before
    public void setUp() throws Exception {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        service = (DongtaiService) context.getBean("dongtaiService");
    }

    @Test
    public void addDongtai() {
        Dongtai dt = new Dongtai();
        dt.setUser_id(2);
        dt.setDtcontent("一蓑烟雨任平生！加油");
        dt.setTopic_id(1);

        Integer count = service.addDongtai(dt);
        System.err.println(count);
    }

    @Test
    public void updateDongtai() {
    }

    @Test
    public void deleteDongtai() {
        System.err.println(service.deleteDongtai(3));;
    }

    @Test
    public void queryAllOthers() {
        List<Dongtai> list = new ArrayList<>();
       // list=service.queryAllOthers(null,2,1,"");
       // list = service.queryLikeDongtai(2,1);
      /*  List<Integer> userids=new ArrayList<>();
        userids.add(2);
        userids.add(3);*/
      List<Integer> useridList=service.queryLikeUserId(1);
        useridList.add(1);
        list=service.queryULike(useridList);
        System.err.println(list.size());
        for (Dongtai dongtai : list) {
            System.err.println(dongtai);
        }
    }
@Test
public void testQueryAl(){
    List<Dongtai> list = null;
    list=service.queryAllOthers(null,1,1,null);
    for (Dongtai dongtai : list) {
        System.err.println(dongtai);
    }
}
    @Test
    public void queryAllSelf() {
        List<Dongtai> list = null;
        list = service.queryAllSelf(3);
        for (Dongtai dongtai : list) {
            System.err.println(dongtai);
        }
    }

}