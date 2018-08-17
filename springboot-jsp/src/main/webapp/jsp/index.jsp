<%--
  Created by IntelliJ IDEA.
  User: WenxiangLi
  Date: 2018/8/16
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <style type="text/css">
        #divForm {
            position: absolute; /*绝对定位*/
            width: 400px;
            height: 400px;
            text-align: center; /*(让div中的内容居中)*/
            margin-top: 50px;
            margin-left: 600px;
            background-color: rgba(0, 0, 0, 0.5);
            border-radius:10px 10px 10px 10px;
        }
        body {
            background-image: url(/images/loginBac3.jpg);
            background-size: 1600px 800px;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
<div style="text-align: center;margin-top: 100px;"><h1>个人代办事项管理系统</h1></div>
<div id="divForm">
    <h3>登录</h3>
    <form action = "/s/login" method="post">
        <font color="red">${errormessage}</font><br><br>

        <br><br>
        用&nbsp;&nbsp;户&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;&nbsp;
        <input style="border:0px;background:transparent"
               type="text" id="account" name="user_name" required="required"
               placeholder="请输入您的用户名"><br /> <br /><br/>
        密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;&nbsp;&nbsp;&nbsp;
        <input style="border:0px;background:none"
               type="password" id="passwd" name="password" required="required"
               placeholder="请输入您的密码"><br /> <br> <br /> <input
            type="submit"  value="登录" style="width:250px;height:30px;" /><br /> <br />
        <a style="color: blue;" href="jsp/register.jsp">注册地址</a>
    </form>
</div>
</div>
</body>
</html>
