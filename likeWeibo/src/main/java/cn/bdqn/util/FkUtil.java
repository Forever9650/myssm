package cn.bdqn.util;

import lombok.Data;
import org.junit.Test;
@Data
public class FkUtil {
    public static final String jsonApp="application/json;charset=UTF-8";
    // @RequestMapping(value = "yzuname",produces = "application/json;charset=UTF-8")
    public static String res(String val){
        StringBuffer sb = new StringBuffer();
        //
        sb.append("@ResponseBody\n");
        sb.append("@RequestMapping(value = \"");
        sb.append(val);
        sb.append("\",produces = ");
        sb.append("\"application/json;charset=UTF-8\""+")");
        return sb.toString();
    }
    @Test
    public void testRes(){
        String res = FkUtil.res("add");
        System.out.println(res);
    }
    private  int a ;
}
