package cn.bdqn.controller;

import cn.bdqn.email.EmailUtil;
import cn.bdqn.entity.Topic;
import cn.bdqn.entity.User;
import cn.bdqn.services.DongtaiService;
import cn.bdqn.services.TopicService;
import cn.bdqn.services.UserService;
import cn.bdqn.util.FkUtil;
import cn.bdqn.util.Page;
import com.alibaba.fastjson.JSON;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService service;
    @Autowired
    private TopicService topicService;
    @Autowired
    private DongtaiService dtService;

    @RequestMapping("login")
    public String login(Integer tpid, User user, HttpSession session, String code, Model model) {
        String vcode = (String) session.getAttribute("vcode");

        if (vcode.equals(code)) {
            User loginUser = service.login(user);
            System.err.println("用户输入的验证码：" + code);
            System.err.println("页面的验证码值" + session.getAttribute("vcode"));
            if (null != loginUser) {
                this.toSelf(loginUser, model);

                    List<Integer> listUseridLike = dtService.queryLikeUserId(loginUser.getUserid());
                    listUseridLike.add(loginUser.getUserid());
                    model.addAttribute("dtList", dtService.queryULike(listUseridLike));
                    Page<Topic> tpPage=new Page<>();
                tpPage.setPageSize(10);
                tpPage.setPageNo(1);
                topicService.queryAllTopicByLimit(tpPage);
                    model.addAttribute("tpList",tpPage.getList());
                session.setAttribute("loginUser", loginUser);


                return "user/selfIndex";
            } else {
                model.addAttribute("username", user.getUsername());
                model.addAttribute("msg", "对不起，用户名或密码错误！");
                return "login/index";
            }

        } else {
            model.addAttribute("code", "验证码错误");
            model.addAttribute("username", user.getUsername());
            model.addAttribute("password", user.getPassword());
            return "login/index";

        }
    }
    @RequestMapping("toSelfCenter")
    public String toSelfCenter(HttpSession session ,Model model){
        User users = (User) session.getAttribute("loginUser");
        List<Integer> listUseridLike = dtService.queryLikeUserId(users.getUserid());
        listUseridLike.add(users.getUserid());
        model.addAttribute("dtList", dtService.queryULike(listUseridLike));
        this.toSelf(users,model);
        return "user/selfIndex";
    }
    //todo去个人中心
    public void toSelf(User loginUser, Model model) {
        //粉丝
        List<User> fansList = service.queryUserWhoLikeMe(loginUser.getUserid());
        loginUser.setFans(fansList.size());
        model.addAttribute("fansList", fansList);
        //关注
        List<User> likeList = service.queryUserWhoILike(loginUser.getUserid());
        loginUser.setLike(likeList.size());
        model.addAttribute("likeList", likeList);
        Page<Topic> topicPage = new Page<>();
        topicPage.setPageSize(5);
        topicPage.setPageNo(1);
        topicService.queryAllTopicByLimit(topicPage);


        model.addAttribute("topicPage", topicPage);
    }
//修改个人资料
    @RequestMapping("toUpdate")
    public String toUpdate(){
        return "user/updateSelfZiliao";
    }
    @RequestMapping("doUpdate")
    public String doUpdate(User user ){
        service.updateUser(user);
        return "";
    }
    //"application/json;charset=UTF-8"
    @ResponseBody
    @RequestMapping(value = "yzuname", produces = "application/json;charset=UTF-8")
    public String yanzhengUserName(String username, Map<String, Object> map) {
        List<User> list = service.queryAll(username);
        if (list.size() == 0) {
            map.put("umsg", "用户名或手机号错误！");
        }
        return JSON.toJSONString(map);
    }

    @RequestMapping("doList")
    public String doList(Model model, String username) {
        model.addAttribute("ulist", service.queryAll(username));
        return "userlist";
    }

    //跳转到注册页面
    @RequestMapping("toAddUser")
    public String toAddUser() {
        return "login/register";
    }

    //跳转到忘记密码页面
    @RequestMapping("toForget")
    public String toForget() {
        return "login/forget";
    }

    @RequestMapping("toLoginYa")
    public String toLoginYa() {
        return "login/index";
    }

    @Test
    public void testPage() {
        Page<String> page = new Page<>();
        page.setPageSize(5);
        page.setPageNo(1);
        List<String> list = new ArrayList<>();
        list.add("ad");
        page.setList(list);
        System.out.println(page.getList() + "" + page.getPageSize());

    }
    //获取邮箱验证码
    @ResponseBody
    @RequestMapping(value = "getEmailVcode",produces = {FkUtil.jsonApp})
    public  String getVcode(String email){
        String code=String.valueOf((int)(Math.random()*8998)+1000);
        try {
            EmailUtil.send_mail(email, "尊敬的"+email+"用户您好：欢迎您注册豪丹国际健身&nbsp;您的验证码为:"+code+"&nbsp;请您尽快填写验证码，以防失效，谢谢合作，如有它人索要验证码，请勿透露。");
            System.out.println("邮件发送成功!");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return JSON.toJSONString(code);
    }


    @RequestMapping(value = "addUser", method = RequestMethod.POST)
    public String addUser(User user, Model model, HttpServletRequest request, @RequestParam(value = "a_headImage", required = false) MultipartFile attac) {

        String image = "";
        //判断文件是否为空
        if (!attac.isEmpty()) {
            //定义上传路径  File.separator 是自适应路径分隔符
            String path = request.getSession().getServletContext().getRealPath("statics" + File.separator + "uploadfiles");
            // String path=request.getSession().getServletContext().getRealPath("/statics/uploadfiles/");
            //获取源文件名
            String oldFileName = attac.getOriginalFilename();
            //源文件后缀
            String prefix = FilenameUtils.getExtension(oldFileName);
            //获取源文件上传大小 与规定大小
            int filesize = 5000000;
            if (attac.getSize() > filesize) {//超过了500k给个提示
                request.setAttribute("uploadFileError", " *上传文件不能大于500k");
                return "addUser";//返回到页面
            } else if (prefix.equalsIgnoreCase("jpg") ||
                    prefix.equalsIgnoreCase("png") ||
                    prefix.equalsIgnoreCase("jpeg") ||
                    prefix.equalsIgnoreCase("peng")) {//判断是否符合规定格式
                //格式正确进行上传处理
                //1.生成新的文件名 格式为当前时间+随机数+“后缀为_Personal.jpg” 生成随机数引用的是Commons-lang包
                String fileName = System.currentTimeMillis() + RandomUtils.nextInt(1000000) + "_Personal.jpg";
                //2.定义新的file对象
                File tartFile = new File(path, fileName);
                if (!tartFile.exists()) {//如果不存在创建
                    tartFile.mkdirs();
                }
                //3.获得用户上传文件流
                try {
                    attac.transferTo(tartFile);
                } catch (IOException e) {
                    e.printStackTrace();
                    //发生异常为上传失败提示；
                    request.setAttribute("uploadFileError", "对不起，上传失败！");
                    return "addUser";//返回到页面
                }
                //上传成功后要修改数据库
                image = path + File.separator + fileName;
            } else {//不符合格式情况下
                request.setAttribute("uploadFileError", " *上传文件格式不正确");
                return "addUser";//返回到页面
            }


        }
        /*User user = new User();
        user.setUsername(username);
        user.setNickname(nickname);
        user.setPassword(password);
        user.setHeadImage(image);*/
        user.setHeadImage(image);
        service.addUser(user);
        return "welcome";
    }

    //验证码
    @RequestMapping("vcode")
    public String vcode() {
        return "login/vcode";
    }

    @RequestMapping("toSelfindex")
    public String toIndexSelf() {
        return "user/selfIndex";
    }
    @ResponseBody()
    @RequestMapping(value = "refushTopic" , produces = {"application/json;charset=UTF-8"})
    public String refushTopic(Integer pageNo,Map<String,Object> map){
        System.err.println("refush方法");
        Page<Topic> page = new Page<>();
        page.setPageSize(5);
        page.setPageNo(pageNo);
        topicService.queryAllTopicByLimit(page);
        List<Topic> list = page.getList();
        map.put("tList",list);
        return JSON.toJSONString(map);
    }
}
