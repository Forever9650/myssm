package cn.bdqn.test;

import cn.bdqn.entity.Dongtai;
import cn.bdqn.util.MailUtil;

import javax.mail.MessagingException;

public class Test {
    @org.junit.Test
    public void testMailSend() {
        try {
            MailUtil.send_mail("2601059174@qq.com", String.valueOf(Math.random() * 999));
            System.out.println("邮件发送成功!");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

    @org.junit.Test
    public void testLombok() {
        Dongtai dt = new Dongtai();
        dt.setUser_id(5);
        System.err.println(dt);

    }

    public void testMaopao(int arr[]) {

        for (int i = 0; i < arr.length; i++) {

            // System.out.println("排序前"+arr[i]);
            for (int j = i + 1; j < arr.length; j++) {
                if (arr[i] < arr[j]) {
                    int temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;
                }
            }
            System.out.print(arr[i]);
        }

    }

    @org.junit.Test
    public void testM() {
        int arr[] = {2, 3, 2, 3, 6, 4, 6, 4, 7, 3};
        testMaopao(arr);
    }


}
