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
                <i class="glyphicon glyphicon-user"></i> 商品销售列表
                <a class="btn btn-success btn-xs" href="#" data-toggle="modal" data-target="#salesRecordModal-add" style="margin-left: 10px"><i class="glyphicon glyphicon-plus icon-white"></i>添加销售记录</a>
              </h2>
              <div class="box-icon">
                <%--<a href="#" class="btn btn-minimize btn-round btn-default"><i class="glyphicon glyphicon-chevron-up"></i></a>--%>
                <%--<a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a>--%>
              </div>
            </div>
            <div class="box-content">
              <table class="table table-striped table-bordered responsive display" id="salesRecordTab">
                <thead>
                  <tr>
                    <th></th>
                    <th>商品编码</th>
                    <th>经销商名称</th>
                    <th>添加时间</th>
                    <th>操作</th>
                  </tr>
                </thead>
                <tbody></tbody>
                <tfoot>
                  <tr>
                    <th></th>
                    <th>商品编码</th>
                    <th>经销商名称</th>
                    <th>添加时间</th>
                    <th>操作</th>
                  </tr>
                </tfoot>
              </table>
            </div>
            <%--添加--%>
            <div class="modal fade" id="salesRecordModal-add" tabindex="-1" role="dialog" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>添加销售记录</h3>
                  </div>
                  <div class="modal-body">
                    <form id="fm-salesRecord-add">
                      <div class="form-group">
                        <label for="jxs">经销商 </label>
                        <select class="form-control" id="jxs" name="dealerId"></select>
                      </div>
                      <div class="form-group">
                        <label for="b-ma">商品编码</label>
                        <textarea class="form-control" id="b-ma" name="code" placeholder="请输入商品编码..."></textarea>
                      </div>
                    </form>
                  </div>
                  <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">关闭</a>
                    <a href="#" class="btn btn-primary" onclick="addSalesRecord()">保存</a>
                  </div>
                </div>
              </div>
            </div><%--salesRecordModal-add end--%>
            <%--修改--%>
            <div class="modal fade" id="salesRecordModal-update" tabindex="-1" role="dialog" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>修改销售记录</h3>
                  </div>
                  <div class="modal-body">
                    <form id="fm-salesRecord-update">
                      <div class="form-group">
                        <label for="dealerId">经销商 </label>
                        <select class="form-control" id="dealerId" name="dealerId"></select>
                        <input type="hidden" id="id" name="id" value="">
                      </div>
                      <div class="form-group">
                        <label for="code">商品编码</label>
                        <textarea class="form-control" id="code" name="code" placeholder="请输入商品编码..."></textarea>
                      </div>
                    </form>
                  </div>
                  <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">关闭</a>
                    <a href="#" class="btn btn-primary" onclick="updateSalesRecord()">保存</a>
                  </div>
                </div>
              </div>
            </div><%--salesRecordModal-update end--%>

          </div>
        </div>
      </div>
    </div>
  </div>
  <%@ include file="/WEB-INF/views/jsp/commons/footer.jsp" %>
</div>
<%@ include file="/WEB-INF/views/jsp/commons/common_js.jsp" %>
<script type="text/javascript">
  /* Formating function for row details */
  function format ( d ) {
    return  '<p style="word-break:break-all">商品编号: '+d.code + "</p>";
  }
  $(document).ready(function(){
    var table = $('#salesRecordTab').dataTable({
      "sAjaxSource": appPath + "/sales/record",
      "fnServerData": retrieveData,
      "aoColumns":[
        {
          "class":"details-control",
          "orderable":false,
          "data":null,
          "defaultContent": ""
        },
        {"mDataProp":"code",
          mRender: function (data, type, row) {
            var sReturn = data;
            if(sReturn.length > 10){
              sReturn = sReturn.substring(0, 10) + "...";
            }
            return sReturn;
          }
        },
        {"mDataProp":"organizationName"},
        {"mDataProp":"createTime"},
        {"mDataProp":"id",
          mRender: function (data, type, row) {
            return salesRecordAction(row);
        }, "bSortable": false},
      ],
    });
    dealersInit();
    // Add event listener for opening and closing details
    $('#salesRecordTab tbody').on('click', 'td.details-control', function () {
      var tr = $(this).closest('tr');
      var row = table.api().row( tr );
      if ( row.child.isShown() ) {
        // This row is already open - close it
        row.child.hide();
        tr.removeClass('shown');
      }else {
        // Open this row
        row.child( format(row.data()) ).show();
        tr.addClass('shown');
      }
    } );

  });
</script>
</body>
</html>