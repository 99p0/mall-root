<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%@ include file="/WEB-INF/views/jsp/commons/common.jsp" %>
    <title>${titleComm }</title>
</head>
<body>
<%@ include file="/WEB-INF/views/jsp/commons/top_bar.jsp" %>
<%@ include file="/WEB-INF/views/jsp/commons/nav_menu.jsp" %>
<div class="ch-container">
    <div class="row">
        <div id="content" class="col-lg-10 col-sm-10">
            <div class="row">
                <div class="box col-md-12">
                    <div class="box-inner">
                        <div class="box-header well" data-original-title="">
                            <h2>
                                <i class="glyphicon glyphicon-user"></i>经销商列表
                                <a class="btn btn-success btn-xs" href="#" data-toggle="modal" data-target="#dealerModal-add" style="margin-left: 10px"><i class="glyphicon glyphicon-plus icon-white"></i>添加经销商</a>
                            </h2>
                            <div class="box-icon">
                                <%--<a href="#" class="btn btn-minimize btn-round btn-default"><i class="glyphicon glyphicon-chevron-up"></i></a>--%>
                                <%--<a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a>--%>
                            </div>
                        </div>
                        <div class="box-content">
                            <table class="table table-striped table-bordered responsive" id="dealerTab">
                                <thead>
                                <tr>
                                    <th>经销商名称</th>
                                    <th>积分</th>
                                    <th>登录名</th>
                                    <th>创建时间</th>
                                    <th>上次修改时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody></tbody>
                                <tfoot>
                                <tr>
                                    <th>经销商名称</th>
                                    <th>积分</th>
                                    <th>登录名</th>
                                    <th>创建时间</th>
                                    <th>上次修改时间</th>
                                    <th>操作</th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--积分管理--%>
    <div class="modal fade" id="integralModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>积分管理</h3>
                </div>
                <div class="modal-body">
                    <form id="fm-integral">
                        <input type="hidden" id="dealerId" value="" >
                        <ul class="nav nav-tabs" id="myTab">
                            <li class="active"><a href="#plus">增加积分</a></li>
                            <li><a href="#minus">删减积分</a></li>
                        </ul><br>

                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane active" id="plus">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-plus icon-white"></i></span>
                                    <input type="text" class="form-control" id="integral-num-plus" name="integral-num" placeholder="请输入积分数量...">
                                </div>
                                <div class="center" style="margin-top: 1rem;">
                                    <a href="#" class="btn btn-primary" onclick="integralAction('plus')">&emsp;&emsp;保&emsp;存&emsp;&emsp;</a>
                                </div>
                            </div>
                            <div class="tab-pane" id="minus">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-minus icon-white"></i></span>
                                    <input type="text" class="form-control" id="integral-num-minus" name="integral-num" placeholder="请输入积分数量...">
                                </div>
                                <div class="center" style="margin-top: 1rem;">
                                    <a href="#" class="btn btn-primary" onclick="integralAction('minus')">&emsp;&emsp;保&emsp;存&emsp;&emsp;</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">关闭</a>
                </div>
            </div>
        </div>
    </div>
    <%--添加--%>
    <div class="modal fade" id="dealerModal-add" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>添加经销商</h3>
                </div>
                <div class="modal-body">
                    <form id="fm-dealer-add">
                        <div class="form-group">
                            <label for="organizationName">经销商名称</label>
                            <input type="text" class="form-control" id="organizationName" name="organizationName" placeholder="请输入经销商名称...">
                        </div>
                        <div class="form-group">
                            <label for="loginName">经销商登录名</label>
                            <input type="text" class="form-control" id="loginName" name="loginName" placeholder="请输入登录名...">
                        </div>
                        <div class="form-group">
                            <label for="loginPwd">经销商登录密码</label>
                            <input type="text" class="form-control" id="loginPwd" name="loginPwd" placeholder="请输入登录密码...">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">关闭</a>
                    <a href="#" class="btn btn-primary" onclick="addDealer()">保存</a>
                </div>
            </div>
        </div>
    </div>
    <%--修改--%>
    <div class="modal fade" id="dealerModal-update" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>修改经销商信息</h3><sub style="color: red;">备注：字段为空则不修改</sub>
                </div>
                <div class="modal-body">
                    <form id="fm-dealer-update">
                        <div class="form-group">
                            <label for="id-show">编号</label>
                            <input type="text" class="form-control" id="id-show" name="id-show" placeholder="" disabled>
                            <input type="hidden"id="id" name="id" >
                        </div>
                        <div class="form-group">
                            <label for="dealer-organizationName">经销商名称</label>
                            <input type="text" class="form-control" id="dealer-organizationName" name="organizationName" placeholder="请输入经销商名称...">
                        </div>
                        <div class="form-group">
                            <label for="dealer-loginName">经销商登录名</label>
                            <input type="text" class="form-control" id="dealer-loginName" name="loginName" placeholder="请输入经销商登录名...">
                        </div>
                        <div class="form-group">
                            <label for="dealer-loginPwd">经销商登录密码</label>
                            <input type="text" class="form-control" id="dealer-loginPwd" name="loginPwd" placeholder="如果要修改密码请输入...">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">关闭</a>
                    <a href="#" class="btn btn-primary" onclick="updateDealer()">保存修改</a>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/jsp/commons/footer.jsp" %>
</div>
<%@ include file="/WEB-INF/views/jsp/commons/common_js.jsp" %>
<script type="text/javascript">
    $(document).ready(function(){
        $('#dealerTab').dataTable({
            "sAjaxSource": appPath + "/dealer",
            "fnServerData": retrieveData,//获取数据的处理函数
            "aoColumns":[
                {"mDataProp":"organizationName"},
                {"mDataProp":"integral"},
                {"mDataProp":"loginName"},
                {"mDataProp":"createTime"},
                {"mDataProp":"lastEditTime"},
                {"mDataProp":"id",
                    mRender: function (data, type, row) {
                       return dealerAction(row);
                }, "bSortable": false},
            ],
        });
    });
</script>
</body>
</html>