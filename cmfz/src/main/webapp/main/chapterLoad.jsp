<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
    $(function () {
        $("#userAddSubmit").linkbutton({
            text:'上传',
            onClick:function () {
                $.messager.confirm('确认','您确认要上传吗？',function(r){
                $("#userAdd").form("submit",{
                   url:'${pageContext.request.contextPath}/user/importUser',
                    success:function(){
                        $('#user').datagrid("load");
                        $("#userDialog").dialog("close");
                        $.messager.show({
                            title:'友情提示',
                            msg:'添加成功',
                        });
                    },
                });

            });
            }
        })
        $("#userAddOff").linkbutton({
            text:'关闭',
            onClick:function () {
                $("#userDialog").dialog("close");
            }
        })
    })
</script>
<form id="userAdd" method="post" enctype="multipart/form-data">
    请选择图片:<input type="file" name="file1"><br/>
    <a id="userAddSubmit"></a>
    <a id="userAddOff"></a>
</form>

