<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
    $(function () {
        $("#albumAddtitle").validatebox({
            required:true,
        });
        $("#albumAddcount").validatebox({
            required:true,
        });
        $("#albumAddscore").validatebox({
            required:true,
        });
        $("#albumAddauthor").validatebox({
            required:true,
        });
        $("#albumAddbroadCast").validatebox({
            required:true,
        });
        $("#albumAddimg").validatebox({
            required:true,
        });
        $("#albumAddstatus").validatebox({
            required:true,
        });
        $("#albumAdddescription").validatebox({
            required:true,
        });
        $("#albumAddSubmit").linkbutton({
            text:'保存',
            onClick:function () {
                $.messager.confirm('确认','您确认想要添加吗？',function(r){
                    if (r) {
                            $("#albumAdd").form("submit",{
                                url:'${pageContext.request.contextPath}/album/addOne',
                                onSubmit:function(){
                                    return $("#albumAddSubmit").form("validate");
                                },
                                success:function(){
                                    $("#albumAddDialog").dialog("close");
                                    $("#tt1").treegrid("load");
                                    $.messager.show({
                                        title:'友情提示',
                                        msg:'添加成功',
                                    });
                                },
                            })
                    }
                });
            }
        })
        $("#albumAddOff").linkbutton({
            text:'关闭',
            onClick:function () {
                $("#albumAddDialog").dialog("close");
            }
        })
    })
</script>
<form id="albumAdd" method="post" enctype="multipart/form-data">
    专辑名字：<input id="albumAddtitle" name="title"/><br/>
    章节数量：<input id="albumAddcount" name="count"/><br/>
    专辑评分:<input id="albumAddscore" name="score"/><br/>
    专辑作者:<input id="albumAddauthor" name="author"/><br/>
    专辑播音:<input id="albumAddbroadCast" name="broadCast"/><br/>
    请选择图片:<input type="file" name="file1"><br/>
    专辑状态:<input id="albumAddstatus" name="status"/><br/>
    专辑详情:<input id="albumAdddescription" name="description"/><br/>
    <a id="albumAddSubmit"></a>
    <a id="albumAddOff"></a>
</form>