<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>重置界面</title>
    <link rel="stylesheet" href="${re.contextPath}public/css/reset.css" />
    <link rel="stylesheet" href="${re.contextPath}public/css/common.css" />
    <link rel="stylesheet" href="${re.contextPath}public/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${re.contextPath}public/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${re.contextPath}public/css/lgymove.css" />
</head>
<body>
<div class="wrap login_wrap">
    <div class="content">

        <div class="logo"></div>

        <div class="login_box">

            <div class="login_form">
                <div class="login_title">
                    密码重置
                </div>
                <form action="" method="post" id="user-reset">

                    <div class="form_text_ipt">
                        <input name="user_name" id="username" type="text" placeholder="手机号/邮箱">
                    </div>
                    <div class="ececk_warning"><span>手机号/邮箱不能为空</span></div>
                    <div class="form_text_ipt">
                        <input name="user_password" id="user-password" type="password" placeholder="密码">
                    </div>
                    <div class="ececk_warning"><span>密码不能为空</span></div>
                    <div class="form_text_ipt">
                        <input name="repassword" id="repassword" type="password" placeholder="重复密码">
                    </div>
                    <div class="ececk_warning"><span>密码不能为空</span></div>
                    <div class="form_text_ipt">
                        <input name="code" id="code" type="text" placeholder="验证码">
                    </div>
                    <div class="ececk_warning"><span>验证码不能为空</span></div>
                </form>
                <div class="form_btn">
                    <button type="button" id="send_code">发送验证码</button>
                </div>
                <div class="form_btn">
                    <button type="button" id="reset" >密码重置</button>
                </div>
                <div class="form_reg_btn">
                    <span>已有帐号？</span><a href="/login">马上登录</a>
                </div>
                <div class="other_login">
                    <div class="left other_left">
                        <span>其它登录方式</span>
                    </div>
                    <div class="right other_right">
                        <a href="${re.contextPath}/login/qq"><i class="fa fa-qq fa-2x"></i></a>
                        <a href="${re.contextPath}/login/weixin"><i class="fa fa-weixin fa-2x"></i></a>
                        <a href="${re.contextPath}/login/weibo"><i class="fa fa-weibo fa-2x"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${re.contextPath}public/js/jquery-1.9.1.min.js" ></script>
<script>
    $("#send_code").on("click",function (e) {
        var username=$("#username").val();
        var codeType;
        var validateType;
        if(username.indexOf("@")>=0){
            codeType="email";
            validateType="email";
        }else{
            codeType="sms";
            validateType="mobile";
        }
        $.get("${re.contextPath}/code/"+codeType+"?"+validateType+"="+username,function (data) {
            if(data.code=='000000'){
                alert("验证码发送成功！");
            }else{
                alert("验证码发送失败，请重试！");
            }
        })
    });
    $("#reset").on("click",function () {
        var basePath = $("#basePath").val();
        var user_name = $("input[name='user_name']").val();
        var user_password = $("input[name='user_password']").val();
        var emailCode="";
        var smsCode=""
        if(user_name.indexOf("@")>=0){
            emailCode=$("#code").val();
        }else{
            smsCode=$("#code").val();
        }

        if (user_name == null || user_name.trim() == '' || user_password == null || user_password.trim() == '') {
            layer.msg("请输入用户名和密码", {
                time: 1000
            });
        } else {
            $.post("/reset-user",{user_name:user_name,user_password:user_password,emailCode:emailCode,smsCode:smsCode},function (data) {
                if(data.code=="000000"){
                    alert("密码重置成功！");
                    window.location.href = "/login";
                }else{
                    alert("密码重置失败！");
                }
            })
        }
    });
</script>
</body>

</html>
