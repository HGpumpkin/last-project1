<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function(){
        //初始化输入框
        $("#title").textbox({
            required:true,
        });
        $("#createDate").datebox({
            required:true,
            editable:false,
        });
        $("#imgPath").textbox({
            required:true,
        });
        $("#url").textbox({
            required:true,
        });
        $("#status").textbox({
            required:true,
        });
        //添加表单按钮
        $("#addBannerSubmit").linkbutton({
            onClick:function(){
                $.messager.confirm('确认','您确认想要添加吗？',function(r){
                    if (r){
                        $("#f").form("submit",{
                            url:"${pageContext.request.contextPath}/banner/file",
                            onSubmit:function(){
                                return $("#f").form("validate");
                            },
                            success:function(){
                                $("#dialogadd").dialog("close");
                                $("#dg").datagrid("load");
                                $.messager.show({
                                    title:'友情提示',
                                    msg:'添加成功',
                                });
                            },
                        });
                    }
                });
            }
        });
        //退出表单按钮
        $("#addBannerExit").linkbutton({
            onClick:function(){
                $("#dialogadd").dialog("close");
            }
        });
    });
</script>
<form id="f" method="post" enctype="multipart/form-data">
    图片名字:<input id="title" name="title"/><br/>
    图片状态:<input id="status" name="status"/><br/>
    创建时间:<input id="createDate" name="createDate"/><br/>
    请选择图片:<input type="file" name="file1"><br/>
    <a id="addBannerSubmit">提交</a>
    <a id="addBannerExit">退出</a>
</form>