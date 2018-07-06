
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <title>登录界面</title>
    <link rel="stylesheet" href="/public/css/reset.css"/>
    <link rel="stylesheet" href="/public/css/common.css"/>
    <link rel="stylesheet" href="/public/css/font-awesome.min.css"/>
</head>
<body>
<div class="wrap login_wrap">
    <div class="content">
        <div class="logo"></div>
        <div class="login_box">

            <div class="login_form">
                <div class="login_title">
                    登录
                </div>
                <div class="form_text_ipt">
                    <input name="user_name" type="text" placeholder="手机号/邮箱" value="admin">
                </div>
                <div class="ececk_warning"><span>手机号/邮箱不能为空</span></div>
                <div class="form_text_ipt">
                    <input name="user_password" type="password" placeholder="密码" value="admin">
                </div>
                <div class="ececk_warning"><span>密码不能为空</span></div>
                <div class="form_text_ipt">
                    <input style="width: 150px;" name="imageCode" type="text" placeholder="验证码" onkeydown ="keyDown()" >
                    <img src="/code/image" onclick="javascript:this.src='/code/image?random='+Math.random()">
                </div>
                <div class="ececk_warning"><span>验证码不能为空</span></div>
                <div class="_warning"><span id="span_msg"></span></div>
                <div class="form_check_ipt">
                    <div class="left check_left">
                        <label><input name="remember-me" type="checkbox"> 下次自动登录</label>
                    </div>
                    <div class="right check_right">
                        <a href="/rest-password">忘记密码</a>
                    </div>
                </div>
                <div class="form_btn">
                    <button id="login">登录</button>
                </div>
                <div class="form_reg_btn">
                    <span>还没有帐号？</span><a href="/register">马上注册</a>
                </div>
                <div class="other_login">
                    <div class="left other_left">
                        <span>其它登录方式</span>&nbsp;&nbsp;<a href="/authentication/mobilePage">短信登录</a>
                    </div>
                    <div class="right other_right">
                        <a href="/login/qq"><i class="fa fa-qq fa-2x"></i></a>
                        <a href="/login/weixin"><i class="fa fa-weixin fa-2x"></i></a>
                        <a href="/login/weibo"><i class="fa fa-weibo fa-2x"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/public/js/jquery-1.9.1.min.js"></script>
<script>
    $(function () {
        $("#login").click(function () {
            //判断是否勾选记住我
            var isCheck = $("input[name='remember-me']").is(":checked");
            $.ajax({
                url: "/login_in",
                type: "post",
                async: true,
                data: {
                    "user_name": $("input[name='user_name']").val(),
                    "user_password": $("input[name='user_name']").val(),
                    "imageCode": $("input[name='imageCode']").val(),
                    "remember-me": isCheck
                },
                dataType: "json",
                contentType: "application/x-www-form-urlencoded",
                success: function (data) {
                    if (data.success ==null) {
                        $("#span_msg").text(data.msg);
                    } else {
                        <!-- 登陆成功跳转到后台管理系统-->
                        var userId=data.token.userId;
                        var t=data.token.token;
                        sessionStorage.token=userId+"_"+t;
                        window.location.href = "/login";


                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(textStatus); // paser error;
                }

            })
            ;
        });
    });
    function keyDown() {
        if (event.keyCode == 13) {
            event.returnValue = false;
            event.cancel = true;
            $("#login").click();
        }
    }
</script>
</body>
</html>
