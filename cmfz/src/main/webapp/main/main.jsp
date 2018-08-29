<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>持名法州主页</title>
    <link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../themes/IconExtension.css">
    <link rel="stylesheet" type="text/css" href="../themes/icon.css">
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="../js/datagrid-detailview.js"></script>
    <script type="text/javascript" src="../js/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="../js/jquery.etree.js"></script>
    <script type="text/javascript" src="../js/echarts.min.js"></script>
    <script type="text/javascript" src="../js/china.js"></script>
    <script type="text/javascript">
        <!--菜单处理-->
        $(function(){
            $.get("${pageContext.request.contextPath}/menu/queryMenus",function (res){
                for (var i=0 ; i<res.length ; i++){
                    var content = "";
                    //遍历二级菜单
                    for(var j=0; j<res[i].menu.length; j++){
                        content+="<a class='easyui-linkbutton' onclick='newTabs(\""+res[i].menu[j].title+"\",\""+res[i].menu[j].href+"\")' data-options='width:\"100%\"'>"+res[i].menu[j].title+"</a>";
                    }
                    //遍历一级菜单
                    $("#aa").accordion("add",{
                        title:res[i].title,
                        selected: false,
                        content: content
                    });
                }
            });
        });

        function newTabs(title,href) {
            if ($("#tt").tabs("exists", title)){
                $("#tt").tabs("select", title);
            }else{
                // 不存在，则  在tabs1中 添加新tab （标题-菜单项文本 内容-远程加载菜单对应的页面 关闭）
                $("#tt").tabs("add", {
                    title:title,
                    href:"${pageContext.request.contextPath}"+href+".jsp",
                    cache:false,
                    closable:true
                });
            };
        }
    </script>

</head>
<body class="easyui-layout">
<div data-options="region:'north',split:true" style="height:60px;background-color:  #5C160C">
    <div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px" >持名法州后台管理系统</div>
    <div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">欢迎您:${sessionScope.admin.username} &nbsp;<a href="" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/admin/exit" class="easyui-linkbutton" data-options="iconCls:'icon-01'">退出系统</a></div>
</div>
<div data-options="region:'south',split:true" style="height: 40px;background: #5C160C">
    <div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;百知教育 hg@zparkhr.com.cn</div>
</div>

<div data-options="region:'west',title:'导航菜单',split:true" style="width:220px;">
    <div id="aa" class="easyui-accordion" data-options="fit:true">
    </div>
</div>
<div data-options="region:'center'">
    <div id="tt" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">
        <div title="主页" data-options="iconCls:'icon-neighbourhood',"  style="background-image:url(${pageContext.request.contextPath}/main/image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
    </div>
</div>

</body>
</html>