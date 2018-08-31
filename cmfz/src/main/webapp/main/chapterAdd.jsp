<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
    $(function () {
        $("#chapterAddtitle").validatebox({
            required:true,
        });
        $("#chapterAddsize").validatebox({
            required:true,
        });
        $("#chapterAddtime").validatebox({
            required:true,
        });
        $("#chapterAddaid").combobox({
            url:'${pageContext.request.contextPath}/album/queryAll',
            editable:false,
            valueField:'id',
            textField:'title',
        });
        $("#chapterAddSubmit").linkbutton({
            text:'保存',
            onClick:function () {
                $.messager.confirm('确认','您确认想要添加吗？',function(r){
                    if (r) {
                        $("#chapterAdd").form("submit",{
                            url:'${pageContext.request.contextPath}/album/addChapter',
                            onSubmit:function(){
                                return $("#chapterAdd").form("validate");
                            },
                            success:function(){
                                $("#chapterAddDialog").dialog("close");
                                $("#tt").treegrid("load");
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
        $("#chapterAddOff").linkbutton({
            text:'关闭',
            onClick:function () {
                $("#chapterAddDialog").dialog("close");
            }
        })
        $("#chapterAddaid").combobox("setValue",'1');
    })
</script>
<form id="chapterAdd" method="post" enctype="multipart/form-data">
    章节名字：<input id="chapterAddtitle" name="title"/><br/>
    章节大小：<input id="chapterAddsize" name="size"/><br/>
    音频时长:<input id="chapterAddtime" name="time"/><br/>
    请选择图片:<input type="file" name="file1"><br/>
    专辑id:<input id="chapterAddaid" name="aid"/><br/>
    <a id="chapterAddSubmit"></a>
    <a id="chapterAddOff"></a>
</form>