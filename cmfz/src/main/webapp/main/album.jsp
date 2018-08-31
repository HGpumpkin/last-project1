<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
        var id;
        $(function () {
            $('#tt1').treegrid({
                url:'${pageContext.request.contextPath}/album/queryAll',
                idField:'id',
                treeField:'title',
                toolbar:'#albumtotal',
                fitColumns:true,
                onDblClickCell:function (aa,row) {
                    if(row.url!=null){
                        $("#video").prop("src","${pageContext.request.contextPath}/file/"+row.url);
                    }
                },
                columns:[[
                    {field:'title',title:'章节名字',width:180},
                    {field:'size',title:'章节大小',width:60},
                    {field:'url',title:'章节路径',width:80},
                    {field:'time',title:'章节时长',width:80}
                ]]
            });

            $("#albumsave").linkbutton({
                text:'专辑详情',
                iconCls:'icon-add',
                onClick:function () {
                    if($('#tt1').treegrid("getSelected")==null){
                        $.messager.alert('警告','请选中专辑');
                    }else{
                        if($('#tt1').treegrid("getSelected").author==null){
                            $.messager.alert('警告','请选中专辑');
                        }else {
                            id = $('#tt1').treegrid("getSelected").id;
                            $("#albumMsgDialog").dialog("open");
                        }
                    }
                }
            });
            $("#albuminsert").linkbutton({
                text:'添加专辑',
                iconCls:'icon-add',
                onClick:function () {
                    $("#albumAddDialog").dialog("open");
                }
            });
            $("#chapterinsert").linkbutton({
                text:'添加章节',
                iconCls:'icon-add',
                onClick:function () {
                    $("#chapterAddDialog").dialog("open");
                }
            });
            $("#albumMsgDialog").dialog({
                title: '专辑详细信息',
                width: 600,
                height: 400,
                closed: true,
                cache: false,
                href: '${pageContext.request.contextPath}/main/albumMsg.jsp',
                modal: true
            });
            $("#albumAddDialog").dialog({
                title: '专辑添加',
                width: 600,
                height: 400,
                closed: true,
                cache: false,
                href: '${pageContext.request.contextPath}/main/albumAdd.jsp',
                modal: true
            })
            $("#chapterAddDialog").dialog({
                title: '音频添加',
                width: 600,
                height: 400,
                closed: true,
                cache: false,
                href: '${pageContext.request.contextPath}/main/chapterAdd.jsp',
                modal: true
            })
            $("#chapterUploadDialog").dialog({
                title: '音频下载',
                width: 600,
                height: 400,
                closed: true,
                cache: false,
                href: '${pageContext.request.contextPath}/main/chapterLoad.jsp',
                modal: true
            })
            $("#chapterdownload").linkbutton({
                text:'下载音频',
                iconCls:'icon-add',
                onClick:function () {
                    if($('#tt1').treegrid("getSelected")==null){
                        $.messager.alert('警告','请选中章节');
                    }else{
                        if($('#tt1').treegrid("getSelected").size==null){
                            $.messager.alert('警告','请选中章节');
                        }else {
                            id = $('#tt1').treegrid("getSelected").url;
                            location.href='${pageContext.request.contextPath}/album/loadChapter?fname='+id;
                        }
                    }

                }
            })
            $("#albumRemoveDialog").linkbutton({
                text:"删除专辑",
                onClick:function () {
                    if($('#tt1').treegrid("getSelected")==null){
                        $.messager.alert('警告','请选中专辑');
                    }else{
                        if($('#tt1').treegrid("getSelected").author==null){
                            $.messager.alert('警告','请选中专辑');
                        }else {
                            id = $('#tt1').treegrid("getSelected").id;
                            $.messager.confirm('确认','您确认想要删除专辑吗？',function(r) {
                                if (r) {
                                    $.get("${pageContext.request.contextPath}/album/remove?id="+id);
                                    $("#tt1").treegrid("load");
                                }
                            })
                        }
                    }
                }
            })
        })
    </script>
    <table id="tt1"></table>
    <div id="albumtotal">
        <div id="albumsave">
        </div>
        <div id="albuminsert">
        </div>
        <div id="chapterinsert">
        </div>
        <div id="chapterdownload">
        </div>
        <div id="albumRemoveDialog"></div>
    </div>
    <div id="albumMsgDialog"></div>
    <div id="albumAddDialog"></div>
    <div id="chapterAddDialog"></div>
    <div id="chapterUploadDialog"></div>
<video id="video" controls="controls" 	autoplay="autoplay"></video>
