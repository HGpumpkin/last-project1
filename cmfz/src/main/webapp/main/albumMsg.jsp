<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
    $(function () {
        $("#albumMsg").form('load',"${pageContext.request.contextPath}/album/queryOne?id="+id);
        $("#albumid").validatebox({
            editable:false,
        });
        $("#albumtitle").validatebox({
            editable:false,
        });
        $("#albumcount").validatebox({
            editable:false,
        });
        $("#albumcreateTime").validatebox({
            editable:false,
        });
        $("#albumscore").validatebox({
            editable:false,
        });
        $("#albumauthor").validatebox({
            editable:false,
        });
        $("#albumbroadCast").validatebox({
            editable:false,
        });
        $("#albumimg").validatebox({
            editable:false,
        });
        $("#albumstatus").validatebox({
            editable:false,
        });
        $("#albumdescription").validatebox({
            editable:false,
        });

        $("#albumoff").linkbutton({
            text:'关闭',
            onClick:function () {
                $("#albumMsgDialog").dialog("close");
        }
        })
    })
</script>
<form id="albumMsg">
    id:<input id="albumid" name="id"/><br/>
    专辑名字：<input id="albumtitle" name="title"/><br/>
    章节数量：<input id="albumcount" name="count"/><br/>
    上架时间:<input id="albumcreateTime" name="createTime"/><br/>
    专辑评分:<input id="albumscore" name="score"/><br/>
    专辑作者:<input id="albumauthor" name="author"/><br/>
    专辑播音:<input id="albumbroadCast" name="broadCast"/><br/>
    专辑插图:<input id="albumimg" name="img"/><br/>
    专辑状态:<input id="albumstatus" name="status"/><br/>
    专辑详情:<input id="albumdescription" name="description"/><br/>
    <a id="albumoff"></a>
</form>