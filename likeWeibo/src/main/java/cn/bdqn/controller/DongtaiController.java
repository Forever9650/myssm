package cn.bdqn.controller;

import cn.bdqn.entity.Dongtai;
import cn.bdqn.services.DongtaiService;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("dt")
public class DongtaiController {
    @Autowired
    private DongtaiService service;

    @RequestMapping("doListByTopicId")
    public String doList(Integer tpid, Model model, String dtContent1, Integer userid1) {

        List<Dongtai> list = service.queryAllOthers(userid1, 1, tpid, dtContent1);
        model.addAttribute("dtList", list);
        return "dongtai/dongtaiList";
    }

    @RequestMapping(value = "doAddDT",method = RequestMethod.POST)
    public String doAdd(Dongtai dt, HttpServletRequest request, @RequestParam(value = "dtPic", required = false) MultipartFile attac) {
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
        dt.setDtImage(image);
        dt.setLikeCount(0);
        dt.setForCount(0);
        service.addDongtai(dt);
        return "forward:/dt/doListByTopicId";
    }

}
