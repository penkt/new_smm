package com.news.controller;

import com.alibaba.fastjson.JSON;
import com.google.common.collect.Maps;
import com.news.entity.User_Info;
import com.news.properties.UploadProperties;
import com.news.response.FileUploadResponse;
import com.news.service.User_InfoService;
import com.news.utils.Base64Util;
import com.news.utils.MD5Utils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class DefaultController {
        private Logger log = LoggerFactory.getLogger(DefaultController.class);

        @Autowired
        private ResourceLoader resourceLoader;
        @Autowired
        private UploadProperties uploadProperties;

        @Autowired
        private User_InfoService user_InfoService;


        @GetMapping("/")
        public ModelAndView defaultView(){
        ModelAndView view=new ModelAndView();
        view.setViewName("WEB-INF/home");
        return view;
        }

        @GetMapping("/test")
        public ModelAndView test(){
                ModelAndView view=new ModelAndView();
                view.setViewName("WEB-INF/login");
                return view;
        }

        @GetMapping("/rest-password")
        public ModelAndView resetPassword(){
                ModelAndView view=new ModelAndView();
                view.setViewName("WEB-INF/pages/resetUser");
                return view;
        }

        @PostMapping("/reset-user")
        @ResponseBody
        public Map<String,Object> resetPassword(User_Info user_info){
                Map<String,Object> result= Maps.newConcurrentMap();
                User_Info tmpUser=user_InfoService.SelectByName(user_info.getUser_name());
                if(tmpUser==null){
                        result.put("code","99999");
                        result.put("msg","当前用户不存在！");
                        return result;
                }

                tmpUser.setUser_password(MD5Utils.string2MD5(user_info.getUser_password()));
                int c=user_InfoService.UpdataBySelect(tmpUser);
                if(c>0){
                        result.put("code","000000");
                        result.put("msg","success");
                        return result;
                }else{
                        result.put("code","999999");
                        result.put("msg","密码重置失败！");
                        return result;
                }

        }

        /**
         * @Title: upload
         * @Description: TODO(上传)
         * @param files
         * @param request
         * @return String    返回类型
         */
        @RequestMapping("/upload")
        @ResponseBody
        public List<FileUploadResponse> upload(@RequestParam("file") MultipartFile[]  files, HttpServletRequest request) {
                List<FileUploadResponse> list = new ArrayList<FileUploadResponse>();
                // 获取文件存放路径
                String basePath = uploadProperties.getBasePath();
                String location = DateFormatUtils.format(new Date(),"yyyy-MM-dd") + "/";
                // 判断文件夹是否存在，不存在则
                File targetFile = new File(basePath + location);
                if(!targetFile.exists()){
                        targetFile.mkdirs();
                }
                for(MultipartFile file : files) {
                        FileUploadResponse rs = new FileUploadResponse();
                        String contentType = file.getContentType();
                        String fileName = file.getOriginalFilename();
                        try {
                                Files.copy(file.getInputStream(), Paths.get(uploadProperties.getBasePath() + location, fileName), StandardCopyOption.REPLACE_EXISTING);
                                rs.setContentType(contentType);
                                rs.setFileName(fileName);
                                String baseName= Base64Util.encodeData(location + fileName) + fileName.substring(fileName.lastIndexOf("."));
                                rs.setUrl(request.getHeader("host")+"/image/"+baseName);
                                rs.setType("success");
                                rs.setMsg("文件上传成功！");
                                log.info(JSON.toJSONString(rs));
                        } catch (Exception e) {
                                rs.setType("fail");
                                rs.setMsg("文件上传失败！");
                                log.error("上传文件失败，" + e);
                        }
                        list.add(rs);
                }
                //返回json
                return list;
        }

        /**
         * @Title: getFile
         * @Description: TODO(获取图片)
         * @param filename
         * @return ResponseEntity<?>    返回类型
         */
        @GetMapping("/image/{filename:.+}")
        @ResponseBody
        public ResponseEntity<?> getFile(@PathVariable String filename) {
                try {
                        return ResponseEntity.ok(resourceLoader.getResource("file:" + Paths.get(uploadProperties.getBasePath() + Base64Util.decodeData(filename)).toString()));
                } catch (Exception e) {
                        return ResponseEntity.notFound().build();
                }
        }
}
