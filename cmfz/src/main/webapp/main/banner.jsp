<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script type="text/javascript">
    $(function() {
        $('#dg').edatagrid({
            toolbar:'#total',
            fitColumns:true,
            pagination:true,//开启分页
            pageSize:2,//一页显示几条
            pageNumber:1,//第几页显示
            pageList:[2,3,4],//设置每页可显示几条
            singleSelect:true,//只显示一行
            remoteSort:false,
            nowrap:false,
            updateUrl:'${pageContext.request.contextPath}/banner/update',
            url:'${pageContext.request.contextPath}/banner/query',
            columns:[[
                {field:'id',title:'id',width:'100'},
                {field:'title',title:'标题',width:'100',editor:'validatebox'},
                {field:'imgPath',title:'图片路径',width:'100'},
                {field:'description',title:'简述',width:'100'},
                {field:'status',title:'状态',width:'100',editor:'validatebox'},
                {field:'createDate',title:'创建时间',width:'100'},
            ]],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}' + rowData.imgPath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>status: ' + rowData.status + '</p>' +
                    '<p>description: ' + rowData.description + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }

        });
        $("#delete").linkbutton({
            text:'删除',
            iconCls:'icon-remove',
            onClick:function() {
                var t=$('#dg').datagrid("getSelected");
                if(t==null){
                    $.message.alert('警告','请选中当前行');
                }else {
                    $.message.confirm('确认','确定删除吗?',function (r) {
                        if(r){
                            $.get('${pageContext.request.contextPath}/banner/delete/'+t.id,
                                function () {
                                    $('#dg').datagrid("load");
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