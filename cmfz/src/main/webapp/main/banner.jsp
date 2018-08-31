<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
    $(function(){
        $('#dg').edatagrid({
            toolbar:'#total',
            fitColumns:true,
            pagination: true,     //开启分页
            pageSize: 2,         //分页大小
            pageNumber:1,         //第几页显示（默认第一页，可以省略）
            pageList: [2, 3, 4], //设置每页记录条数的列表
            singleSelect:true,
            remoteSort:false,
            singleSelect:true,
            nowrap:false,
            updateUrl:'${pageContext.request.contextPath}/banner/update',
            url:'${pageContext.request.contextPath}/banner/query',
            columns:[[
                {field:'id',title:'id',width:100},
                {field:'title',title:'插图名字',width:100,editor:'validatebox'},
                {field:'imgPath',title:'插图路径',width:100,editor:'validatebox'},
                {field:'status',title:'状态',width:100,editor:'validatebox'},
                {field:'createDate',title:'时间',width:100},

            ]],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}' + rowData.imgPath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>status: ' + rowData.status + '</p>' +
                    '<p>title: ' + rowData.title + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }
        });
        $("#delete").linkbutton({
            text:'删除',
            iconCls:'icon-remove',
            onClick:function () {
                var t=$("#dg").datagrid("getSelected");
                if(t==null){
                    $.messager.alert('警告','请选中删除行');
                }else{
                    $.messager.confirm('确认','您确认想要删除记录吗？',function(r){
                        if (r){
                            $.get("${pageContext.request.contextPath}/banner/delete/"+t.id,
                                function () {
                                    $("#dg").datagrid("load");
                                });
                        }
                    });
                }
            }
        });
        $("#insert").linkbutton({
            text:'添加',
            iconCls:'icon-add',
            onClick:function () {
                $("#dialogadd").dialog("open")
            }
        });
        $("#save").linkbutton({
            iconCls:'icon-save',
            text:'保存',
            onClick:function () {
                if($("#dg").edatagrid("getRowIndex",$("#dg").datagrid("getSelected"))>=0) {
                    $("#dg").edatagrid("saveRow");
                    $("#dg").datagrid("load");
                }else{
                    $.messager.alert('警告','请选中行在保存');
                }

            }
        });
        $("#update").linkbutton({
            text:'修改',
            iconCls:'icon-edit',
            onClick:function () {
                if($("#dg").edatagrid("getRowIndex",$("#dg").datagrid("getSelected"))>=0) {
                    $("#dg").edatagrid("editRow", $("#dg").edatagrid("getRowIndex", $("#dg").datagrid("getSelected")));
                }else{
                    $.messager.alert('警告','请选中行在修改');
                }
            }
        });
        $("#dialogadd").dialog({
            title: '添加轮播图',
            width: 600,
            height: 400,
            closed: true,
            cache: false,
            href: '${pageContext.request.contextPath}/main/addBanner.jsp',
            modal: true
        })
    });
</script>
<table id="dg">
</table>

<div id="total">
    <div id="save">
    </div>
    <div id="delete">
    </div>
    <div id="update">
    </div>
    <div id="insert">
    </div>
</div>

<div id="dialogadd"></div>

