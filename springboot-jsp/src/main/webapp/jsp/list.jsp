<%--
  Created by IntelliJ IDEA.
  User: WenxiangLi
  Date: 2018/8/16
  Time: 20:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My JSP 'list.jsp' starting page</title>
    <script type="text/javascript" src="/s/js/jquery3.3.1.js"></script>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <style>
        body{
            background-color: beige;
            margin-left:0px;
            margin-top:0px;
        }
    </style>
    <script>
        <!--用户信息展示 -->
        function showView(user_id){
            $.ajax({
                url:"/s/showData",
                type:"post",
                data:"user_id="+user_id,
                success(data){
                    showMessage(data);
                }
            })
        }
        function showMessage(data){
            var html = [];
            html.push("<table class='table table-hover'>");
            html.push("<tr><font style='text-align:center;font-size:20px;color:green;'>基本信息</font></tr>");
            html.push("<tr>");
            html.push("<td>用户名:&nbsp;&nbsp;&nbsp;&nbsp;"+data.user_name+"</td>");
            html.push("<td>密码:&nbsp;&nbsp;&nbsp;&nbsp;"+data.password+"(加密文)</td>");
            html.push("</tr>")
            html.push("<tr>")
            html.push("<td>性别:&nbsp;&nbsp;&nbsp;&nbsp;"+(data.sex='M'?'男':'女')+"</td>");
            html.push("<td>年龄:&nbsp;&nbsp;&nbsp;&nbsp;"+data.age+"</td>");
            html.push("</tr>");
            html.push("<tr>");
            html.push("<td>电话号码:&nbsp;&nbsp;&nbsp;&nbsp;"+data.phone_number+"</td>");
            html.push("<td></td>");
            html.push("</tr>");
            html.push("<tr>");
            html.push("<td><font style='text-align:center;font-size:20px;color:green;'>其他信息</font></td>");
            html.push("<td></td>");
            html.push("</tr>");
            html.push("<tr>");
            html.push("<td>创建时间:&nbsp;&nbsp;&nbsp;&nbsp;"+data.creation_date+"</td>");
            html.push("<td></td>");
            html.push("</tr>");
            html.push("<tr>");
            html.push("<td>修改时间:&nbsp;&nbsp;&nbsp;&nbsp;"+data.last_update_date+"</td>");
            html.push("<td></td>");
            html.push("</tr>");
            html.push("<tr>");
            html.push("<td>备注:&nbsp;&nbsp;&nbsp;&nbsp;"+data.comments+"</td>");
            html.push("<td></td>");
            html.push("</tr>");
            html.push("<tr>");
            html.push("<td><button class='btn btn-primary btn-sm' onclick='updateUser("+data.user_id+")'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span>编辑</button>")
            html.push("</tr>");
            html.push("</table>");
            var message_show = document.getElementById("showData");
            message_show.innerHTML = html.join("");
        }
        //修改用户信息
        function updateUser(id){
            $.ajax({
                url:"/s/showData",
                type:"post",
                data:"user_id="+id,
                success(data){
                    showData(data);
                }
            })
        }
        <!--生成修改用户弹出除框 -->
        function showData(data){
            $("#user_name").val(data.user_name);
            $("#password").val(data.password);
            $("#sex").val(data.sex);
            $("#age").val(data.age);
            $("#phone_number").val(data.phone_number);
            $("#comments3").val(data.comments);
            $("#mymodal3").modal();
        }
        <!--提交修改用户信息 -->
        function updatedUser(){
            var param = {};
            var user_name = $("#user_name").val();
            if(user_name ==""){
                alert("请填写姓名");
                return;
            }
            var password = $("#password").val();
            if(password ==""){
                alert("请填写密码");
                return;
            }
            var sex = $("#sex").val();
            var age= $("#age").val();
            if(age ==""){
                alert("请填写你的年龄");
                return;
            }
            var phone_number = $("#phone_number").val();
            if(phone_number ==""){
                alert("请填写联系方式");
                return;
            }
            var comments = $("#comments3").val();
            if(comments ==""){
                alert("请填写备注");
                return;
            }
            param.user_name = user_name;
            param.password = password;
            param.sex = sex;
            param.age = age;
            param.phone_number = phone_number;
            param.comments = comments;
            $.ajax({
                url:"/s/updatedUser",
                type:"post",
                data:param,
                success(data){
                    alert("更新成功");
                    location.reload();
                }
            })
        }
        <!--代办事项展示-->
        function showTodo(user_id){
            $.ajax({
                url:"/s/showTodo",
                type:"post",
                data:"user_id="+user_id,
                success(data){
                    show_todo(data);
                }
            })
        }
        function show_todo(data){
            var html = [];
            html.push("<table class='table table-hover'>");
            html.push("<tr><td>序号</td><td>标题</td><td>内容</td><td>优先级</td><td>创建时间</td><td>更新时间</td><td>备注</td><td>操作</td></tr>");
            for(var i = 0;i<data.length;i++){
                html.push("<tr>");
                html.push("<td>"+(i+1)+"</td>");
                html.push("<td>"+data[i].todo_item_title+"</td>");
                html.push("<td>"+data[i].todo_item_content+"</td>");
                html.push("<td>"+data[i].priority+"</td>");
                html.push("<td>"+data[i].creation_date+"</td>");
                html.push("<td>"+data[i].last_update_date+"</td>");
                html.push("<td>"+data[i].comments+"</td>");
                html.push("<td><button class='btn btn-primary btn-sm' onclick='updateItems("+data[i].to_item_id+")'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span>编辑</button>"+
                    "<button class='btn btn-danger btn-sm' onclick='deleteItems("+data[i].to_item_id+")'><span class='glyphicon glyphicon-trash' aria-hidden='true' ></span>删除</button></td>")
                html.push("</tr>");
            }
            html.push("<tr>");
            html.push("<td><button class='btn btn-primary btn-sm' onclick='increament()'><span class='glyphicon glyphicon-screenshot' aria-hidden='true' ></span>代办事项添加</button></td>")
            html.push("</tr>");
            html.push("</table>");
            var message_show = document.getElementById("showData");
            message_show.innerHTML = html.join("");
        };
        //弹出新增代办事项模态框
        function increament(){
            $("#mymodal").modal();
        }
        //提交新增事项函数
        function increment_data(){
            var param = {};
            var todo_item_title = $("#todo_item_title").val();
            if(todo_item_title ==""){
                alert("请填写主题");
                return;
            }
            var todo_item_content = $("#todo_item_content").val();
            if(todo_item_content ==""){
                alert("请填写内容");
                return;
            }
            var comments = $("#comments").val();
            if(comments ==""){
                alert("请填写备注");
                return;
            }
            var priority = $("#priority").val();
            param.todo_item_title = todo_item_title;
            param.todo_item_content = todo_item_content;
            param.priority = priority;
            param.comments = comments;
            $.ajax({
                url:"/s/items_incre",
                type:"post",
                data:param,
                success(data){
                    alert("添加成功");
                    location.reload();
                }
            })
        }
        //删除 代办事项函数
        function deleteItems(id){
            if(window.confirm("确认要删除吗？")){
                $.ajax({
                    url:"/s/deleteItems",
                    type:"post",
                    data:"to_item_id="+id,
                    success(data){
                        alert("删除成功");
                        location.reload();
                    }
                })
            }
        }
        //修改代办事项
        function updateItems(id){
            $("#to_item_id").val(id);
            $.ajax({
                url:"/s/searchItem",
                type:"post",
                data:"to_item_id="+id,
                success(data){
                    search_item(data);
                }
            })
        }
        function search_item(data){
            $("#todo_item_title2").val(data.todo_item_title);
            $("#todo_item_content2").val(data.todo_item_content);
            $("#priority2").val(data.priority);
            $("#comments2").val(data.comments);
            $("#mymodal2").modal();
        }
        function updateItem(){
            var param = {};
            var to_item_id = $("#to_item_id").val();
            var todo_item_title = $("#todo_item_title2").val();
            if(todo_item_title ==""){
                alert("请填写主题");
                return;
            }
            var todo_item_content = $("#todo_item_content2").val();
            if(todo_item_content ==""){
                alert("请填写内容");
                return;
            }
            var priority = $("#priority2").val();
            var comments = $("#comments2").val();
            if(comments ==""){
                alert("请填写备注");
                return;
            }
            param.to_item_id = to_item_id;
            param.todo_item_title = todo_item_title;
            param.todo_item_content = todo_item_content;
            param.priority = priority;
            param.comments = comments;
            $.ajax({
                url:"/s/updateItem",
                type:"post",
                data:param,
                success(data){
                    alert("修改成功")
                    location.reload();
                }
            })
        }
    </script>
</head>
<body>
<div style="background-color: darkolivegreen;">
    <div class="container" style="margin-top:30px;margin-left:20px;width:60%">
        <div style="width:15%">
            <ul class="nav nav-pills nav-stacked">
                <li role="presentation" class="active"><a href="javascript:void(0);" onclick="showTodo('${sessionScope.user.user_id}')">代办事项列表</a></li>
                <li role="presentation"><a href="javascript:void(0);" onclick="showView('${sessionScope.user.user_id}')">个人信息维护</a></li>
            </ul>
        </div>
    </div>
    <div style="margin:auto;text-align: center;">
        欢迎你，<font style="color:blue;font-size:25px;">${sessionScope.user.user_name }</font>
    </div>
</div>
<div class="container"
     style="width:80%;margin:auto;margin-top:20px;height:800px">
    <div id="showData">
        <font style="color:green;font-size:25px ;margin-top:50px;margin-left:50px;">想看点什么就点击一下</font>
    </div>
    <!-- 新增代办事项模态框 -->
    <div class="modal" id="mymodal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title">新增代办事项</h4>
                </div>
                <div class="modal-body">
                    <label >标题</label>
                    <input type="text" class="form-control" id="todo_item_title" placeholder="代办事项标题">
                    <label >内容</label>
                    <input type="text" class="form-control" id="todo_item_content" placeholder="代办事项内容">
                    <label for="priority">优先级</label>
                    <select class="form-control" id="priority">
                        <option value="low">low</option>
                        <option value="medium">medium</option>
                        <option value="high">high</option>
                    </select>
                    <label for="comments">备注</label>
                    <input type="text" class="form-control" id="comments" placeholder="代办事项备注">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="increment_data()">保存</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 修改代办事项模态框 -->
    <div class="modal" id="mymodal2">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title">修改代办事项</h4>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="to_item_id"> <label >标题</label>
                    <input type="text" class="form-control" id="todo_item_title2"
                           placeholder="代办事项标题"> <label >内容</label> <input
                        type="text" class="form-control" id="todo_item_content2"
                        placeholder="代办事项内容"> <label for="priority">优先级</label> <select
                        class="form-control" id="priority2">
                    <option value="low">low</option>
                    <option value="medium">medium</option>
                    <option value="high">high</option>
                </select> <label for="comments">备注</label> <input type="text"
                                                                  class="form-control" id="comments2" placeholder="代办事项备注">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary"
                            onclick="updateItem()">保存</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 修改用户信息 -->
    <div class="modal" id="mymodal3">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title">修改个人信息</h4>
                </div>
                <div class="modal-body">
                    <label >用户名</label>
                    <input type="text" class="form-control" id="user_name"
                           placeholder="用户名">
                    <label >密码</label> <input
                        type="password" class="form-control" id="password"
                        placeholder="密码"> <label for="priority">性别</label> <select
                        class="form-control" id="sex">
                    <option value="M">男</option>
                    <option value="F">女</option>

                </select>
                    <label for="age">年龄</label> <input type="text"
                                                       class="form-control" id="age" placeholder="年龄">
                    <label for="phone_number">电话</label> <input type="text"
                                                                class="form-control" id="phone_number" placeholder="联系方式">
                    <label for="comments">备注</label> <input type="text"
                                                            class="form-control" id="comments3" placeholder="用户备注">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary"
                            onclick="updatedUser()">保存</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
