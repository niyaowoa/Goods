<%--
  Created by IntelliJ IDEA.
  User: niyaowoa
  Date: 2017-04-08
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="Bookmark" href="/favicon.ico" >
    <link rel="Shortcut Icon" href="/favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="../../../static/lib/html5shiv.js"></script>
    <script type="text/javascript" src="../../../static/lib/respond.min.js"></script>

    <![endif]-->
    <link rel="stylesheet" type="text/css" href="../../../static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../../../static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="../../../static/lib/Hui-iconfont/1.0.8/iconfont.css" />

    <link rel="stylesheet" type="text/css" href="../../../static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="../../../static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="../../../static/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <!--/meta 作为公共模版分离出去-->

    <link href="../../../static/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-container">
    <form action="" method="post" class="form form-horizontal" id="form-article-add">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>仓库编码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${storage.storage_id}"  id="storage_id" name="storage_id" disabled>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>仓库名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${storage.storage_name}" placeholder="输入仓库名" id="storage_name" name="storage_name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>仓库地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${storage.address}" placeholder="输入仓库地址" id="address" name="address">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
                <button onClick="save_submit();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存 </button>
         </div>
        </div>
    </form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../../../static/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="../../../static/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../../../static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="../../../static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="../../../static/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="../../../static/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="../../../static/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="../../../static/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="../../../static/lib/webuploader/0.1.5/webuploader.min.js"></script>
<script type="text/javascript" src="../../../static/lib/ueditor/1.4.3/ueditor.config.js"></script>
<script type="text/javascript" src="../../../static/lib/ueditor/1.4.3/ueditor.all.min.js"> </script>
<script type="text/javascript" src="../../../static/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="../../../static/js/upload.js"></script>
<script type="text/javascript">
    $(function(){
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });
    });


    $(function(){

        $("#form-article-add").validate({
            rules:{
                storage_name:{
                    required:true,
                    minlength:2
                },
                address:{
                    required:true,
                    minlength:2
                }
            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                //$(form).ajaxSubmit();
                //var index = parent.layer.getFrameIndex(window.name);
                //parent.$('.btn-refresh').click();
                //parent.layer.close(index);
                formSubmit();
            }
        });
    });

    /**
     * 提交
     */
    function formSubmit(){
        //alert(password);
        var data = {
            "storage_id":$("#storage_id").val(),
            "storage_name":$("#storage_name").val(),
            "address":$("#address").val()
        };
        $.post("<%=basePath%>Storage/edit",data,function(rback){
            //alert(rback);
            layer.confirm(rback.msg,function(index){
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            });
        });
    }


</script>
</body>
</html>