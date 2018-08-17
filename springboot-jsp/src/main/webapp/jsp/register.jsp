<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/16
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My JSP 'register.jsp' starting page</title>
    <style type="text/css">
        body {
            color: blue;
            background-size: 1600px 800px;
            background-repeat: no-repeat;
        }
    </style>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script>
        function checkForm()
        {
            var info = [], error = [];
            // 验证密码
            reg = /^\w{6,20}$/;
            var person_pwd = $("#password").val();

            if(!reg.test(person_pwd)){
                error.push("请输入6至20位的密码");
            }

            // 验证确认密码
            var confirmpwd = $("#repassword").val();
            if(confirmpwd == person_pwd){
                info.push("密码：" + person_pwd);
            }
            else{
                error.push("两次密码不一致");
            }

            // 验证角色
            var sex = $("#sex").val();
            if(sex!="0"){
                info.push("性别" + sex);
            }
            else{
                error.push("性别不能为空");
            }

            // 验证姓名
            var user_name = $("#user_name").val();
            if(user_name){
                info.push("姓名：" + user_name);
            }
            else{
                error.push("请输入姓名");
            }
            //验证年龄
            var age = $("#Age").val();
            if(Number(age)>0 && Number(age)<200){
                info.push("年龄"+age);
            }else{
                error.push("请输入合适的年龄")
            }

            // 判断是否提交表单
            if(error.length == 0){
                alert("注册成功，信息如下:\n" + info.join("\n"));
                return true;
            }

            alert("注册失败，信息如下:\n" + error.join("\n"));
            return false;
        }
    </script>
</head>
<body>
<div width="100%">
    <!-- 这里需要添绝对访问路径-->
    <form action="/s/regist" method="post"  onsubmit="return checkForm()">
        <table border="1px"  width="600px" height="400px" align="center" cellpadding="0px" cellspacing="0px" bgcolor="white">
            <tr height="40px">
                <td colspan="2"><font size="4">会员注册</font>&nbsp;&nbsp;&nbsp;USER REGISTER</td>
            </tr>
            <tr>
                <td>用户名</td>
                <td>
                    <input type="text" name="user_name" size="34px" id="user_name" placeholder="请输入你的名字"/>
                </td>
            </tr>
            <tr>
                <td>密码</td>
                <td>
                    <input type="password" name="password" size="34px" id="password" placeholder="请输入密码"/>
                </td>
            </tr>
            <tr>
                <td>确认密码</td>
                <td>
                    <input type="password" name="repassword" size="34px" id="repassword" placeholder="请再次输入密码"/>
                </td>
            </tr>
            <tr>
                <td>性别</td>
                <td>
                    <select id="sex" name="sex">
                        <option value="0">请选择您的性别</option>
                        <option value="M">男</option>
                        <option value="F">女</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>年龄</td>
                <td>
                    <input type="text" name="age" id="Age"  size="22px" placeholder="请输入你的年龄（1-200）"/>
                </td>
            </tr>
            <tr>
                <td>电话</td>
                <td>
                    <input type="text" id="name" name="phone_number" size="34px" placeholder="请输入联系方式"/>
                </td>
            </tr>
            <tr>
                <td>备注</td>
                <td><input type="text" id="address" name="comments" placeholder="请添加备注信息"/></td>
            </tr>

            <tr>
                <td colspan="2">
                    <input type="submit" value="注册"/>
                    <input type="reset" value="重置"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
