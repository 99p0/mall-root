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
                <i class="glyphicon glyphicon-star"></i> 活动列表
                <a class="btn btn-success btn-xs" href="#" data-toggle="modal" data-target="#activityModal-add" style="margin-left: 10px"><i class="glyphicon glyphicon-plus icon-white"></i>添加活动</a>
              </h2>
              <div class="box-icon">
                <%--<a href="#" class="btn btn-minimize btn-round btn-default"><i class="glyphicon glyphicon-chevron-up"></i></a>--%>
                <%--<a href="#" class="btn btn-close btn-round btn-default"><i class="glyphicon glyphicon-remove"></i></a>--%>
              </div>
            </div>
            <div class="box-content">
              <table class="table table-striped table-bordered responsive" id="activitiesTab">
                <thead>
                  <tr>
                    <th>活动名称</th>
                    <th>标题</th>
                    <th>活动开始时间</th>
                    <th>活动结束时间</th>
                    <th>活动状态</th>
                    <th>创建时间</th>
                    <th>上次修改时间</th>
                    <th>操作</th>
                  </tr>
                </thead>
                <tbody></tbody>
                <tfoot>
                  <tr>
                    <th>活动名称</th>
                    <th>标题</th>
                    <th>活动开始时间</th>
                    <th>活动结束时间</th>
                    <th>活动状态</th>
                    <th>创建时间</th>
                    <th>上次修改时间</th>
                    <th>操作</th>
                  </tr>
                </tfoot>
              </table>
            </div>
            <%--添加--%>
            <div class="modal fade" id="activityModal-add" tabindex="-1" role="dialog" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>增加活动</h3>
                  </div>
                  <div class="modal-body">
                    <form id="fm-activity-add">
                      <div class="form-group">
                        <label for="organizationName-add">活动名称</label>
                        <input type="text" class="form-control" id="organizationName-add" name="organizationName" placeholder="请输入活动名称...">
                      </div>
                      <div class="row">
                        <div class="col-xs-6">
                          <div class="form-group">
                            <label for="startDate-add">活动开始时间</label>
                            <div class="input-group date start_date">
                              <input class="form-control" type="text"  id="startDate-add" value="" readonly placeholder="请输入活动开始时间...">
                              <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                          </div>
                        </div>
                        <div class="col-xs-6">
                          <div class="form-group">
                            <label for="endDate-add">活动结束时间</label>
                            <div class="input-group date end_date">
                              <input class="form-control" type="text"  id="endDate-add" value="" readonly placeholder="请输入活动结束时间...">
                              <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="loginName-add">活动标题</label>
                        <input type="text" class="form-control" id="loginName-add" name="loginName" placeholder="请输入活动标题...">
                      </div>
                      <div class="form-group">
                        <label for="loginPwd-add">活动内容</label>
                        <textarea class="form-control" id="sdsdd-add" placeholder="请输入活动内容..."></textarea>
                      </div>
                      <div class="form-group">
                        <a class="btn btn-link" href="#" href="#" data-toggle="modal" data-target="#modal-batch-upload-images">上传活动图片</a>
                        <div class="row">
                          <div class="col-xs-6 col-md-3"></div>
                        </div>
                      </div>
                    </form>
                    <%@ include file="/WEB-INF/views/jsp/commons/modal-batch-upload-images.jsp" %>
                  </div>
                  <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">关闭</a>
                    <a href="#" class="btn btn-primary" onclick="addDealer()">保存</a>
                  </div>
                </div>
              </div>
            </div>
            <%--修改--%>
            <div class="modal fade" id="activityModal-update" tabindex="-1" role="dialog" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>修改活动</h3>
                  </div>
                  <div class="modal-body">
                    <form id="fm-activity-upd">
                      <div class="form-group">
                        <label for="organizationName">活动名称</label>
                        <input type="text" class="form-control" id="organizationName" name="organizationName" placeholder="请输入活动名称...">
                      </div>
                      <div class="row">
                        <div class="col-xs-6">
                          <div class="form-group">
                            <label for="startDate">活动开始时间</label>
                            <div class="input-group date start_date">
                              <input class="form-control" type="text"  id="startDate" value="" readonly placeholder="请输入活动开始时间...">
                              <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                          </div>
                        </div>
                        <div class="col-xs-6">
                          <div class="form-group">
                            <label for="endDate">活动结束时间</label>
                            <div class="input-group date end_date">
                              <input class="form-control" type="text"  id="endDate" value="" readonly placeholder="请输入活动结束时间...">
                              <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="loginName">活动标题</label>
                        <input type="text" class="form-control" id="loginName" name="loginName" placeholder="请输入活动标题...">
                      </div>
                      <div class="form-group">
                        <label for="loginPwd">活动内容</label>
                        <textarea class="form-control" id="sdsdd" placeholder="请输入活动内容..."></textarea>
                      </div>
                      <div class="form-group">
                        <label for="loginPwd">活动图片</label>
                        <input type="file" class="form-control" id="loginPwd" name="loginPwd" placeholder="请输入登录密码...">
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
          </div>

          <div class="modal fade" tabindex="-1" role="dialog" id="activityInfoModel" aria-hidden="true" aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                  <h4 class="modal-title" id="myLargeModalLabel"></h4>
                </div>
                <div class="modal-body">
                  <div id="activityPage"></div>
                  <ul class="list-group" id="memberList"></ul>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
  <%@ include file="/WEB-INF/views/jsp/commons/footer.jsp" %>
</div>
<%@ include file="/WEB-INF/views/jsp/commons/common_js.jsp" %>
<script type="text/javascript" src="${ctx }/resources/js/upload.file.html5.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
    $('#activitiesTab').dataTable({
      "sAjaxSource": appPath + "/activity",
      "fnServerData": retrieveData,//获取数据的处理函数
      "aoColumns":[
        {"mDataProp":"name",
          mRender: function (data, type, row) {
            return '<a href="#" onclick="activityInfoForModel('+row.id+')">'+(data.length >8 ? data.substring(0, 8)+"...": data)+'</a>';
          }, "bSortable": false},
        {"mDataProp":"title",
          mRender: function (data, type, row) {
            return data.length >10 ? data.substring(0, 10)+"...": data;
          }, "bSortable": false},
        {"mDataProp":"startTime"},
        {"mDataProp":"endTime"},
        {"mDataProp":"state"},
        {"mDataProp":"createTime"},
        {"mDataProp":"lastEditTime"},
        {"mDataProp":"id",
          mRender: function (data, type, row) {
            return activityAction(row);
        }, "bSortable": false},
      ]
    });
    var curDate = new Date();
    var curDateL = curDate.getTime();
    var chooseStartDate = 0, chooseEndDate = 0;
    $('.start_date').datetimepicker({
      language:  'zh-CN',
      format: 'yyyy-mm-dd',
      weekStart: 1,
      todayBtn:  1,
      autoclose: 1,
      todayHighlight: 1,
      startView: 2,
      minView: 2,
      forceParse: 0
    }).on('changeDate', function(ev){
      chooseStartDate = ev.date.valueOf();
      if(chooseStartDate == curDateL){
        alert("确定今天就结束活动！！！");
      }else if(chooseStartDate < curDateL){
        alert("如果选择该时间，说明活动已经开始！！！");
      }else if(chooseEndDate != 0){
        if(chooseStartDate > chooseEndDate){
          alert("活动结束时间小于活动开始时间！！！");
        }else if(chooseStartDate == chooseEndDate){
          alert("确定是否开始就结束活动！！！");
        }
      }
    });
    $('.end_date').datetimepicker({
      language:  'zh-CN',
      format: 'yyyy-mm-dd',
      weekStart: 1,
      todayBtn:  1,
      autoclose: 1,
      todayHighlight: 1,
      startView: 2,
      minView: 2,
      forceParse: 0
    }).on('changeDate', function(ev){
      chooseEndDate = ev.date.valueOf();
      if(chooseEndDate == curDateL){
        alert("确定今天就结束活动！！！");
      }else if(chooseEndDate < curDateL){
        alert("如果选择该时间，说明活动已经结束！！！")
      }else if(chooseStartDate != 0){
        if(chooseStartDate > chooseEndDate){
          alert("活动结束时间小于活动开始时间！！！");
        }else if(chooseStartDate == chooseEndDate){
          alert("确定是否开始就结束活动！！！");
        }
      }
    });
    var params = {
      fileInput: $("#fileImage").get(0),
      upButton: $("#upload-img").get(0),
      url: appPath + "/upload/dynamic/source",
      filter: function(files) {
        var arrFiles = [];
        for (var i = 0, file; file = files[i]; i++) {
          if (file.type.indexOf("image") == 0) {
            if (file.size >= 5120000) {
              alert('您这张"'+ file.name +'"图片大小过大，应小于500k');
            } else {
              arrFiles.push(file);
            }
          } else {
            alert('文件"' + file.name + '"不是图片。');
          }
        }
        return arrFiles;
      },
      onSelect: function(files) {
        var html = '', i = 0;
        $("#preview").html('<div class="upload_loading"></div>');
        var funAppendImage = function() {
          file = files[i];
          if (file) {
            var reader = new FileReader()
            reader.onload = function(e) {
              html = html + '<li id="uploadList_'+ i +'" class="upload_append_list" style="position: relative;">'+
                      '<a href="javascript:" class="upload_delete close-one" style="right:.5rem;" title="删除" data-index="'+ i +'">&times;</a><br />' +
                      '<img id="uploadImage_' + i + '" src="' + e.target.result + '"/></p>'+
                      '<span id="uploadProgress_' + i + '" class="upload_progress"></span>' +
                      '</li>';
              i++;
              funAppendImage();
            }
            reader.readAsDataURL(file);
          } else {
            $("#preview").html(html);
            if (html) {
              //删除方法
              $(".upload_delete").click(function() {
                html5_file.funDeleteFile(files[parseInt($(this).attr("data-index"))]);
                return false;
              });
              //提交按钮显示
              $("#upload-img").show();
            } else {
              //提交按钮隐藏
              $("#upload-img").hide();
            }
          }
        };
        funAppendImage();
      },
      onDelete: function(file) {
        $("#uploadList_" + file.index).fadeOut();
      },
      onProgress: function(file, loaded, total) {
        var eleProgress = $("#uploadProgress_" + file.index), percent = (loaded / total * 100).toFixed(2) + '%';
        eleProgress.show().html(percent);
      },
      onSuccess: function(file, response) {
        $("#uploadInf").append('<input type="hidden" name="source" value="'+response+'">');
        //提交按钮隐藏
        $("#upload-img").hide();
        //file控件value置空
        $("#fileImage").val("");
        $('#modal-batch-upload-images').foundation('reveal', 'close');
      },
      onFailure: function(file) {
        $("#uploadInf").append("<p>图片" + file.name + "上传失败！</p>");
        $("#uploadImage_" + file.index).css("opacity", 0.2);
      },
      onComplete: function() {
        //提交按钮隐藏
        $("#upload-img").hide();
        //file控件value置空
        //  $("#fileImage").val("");
      }
    };
    html5_file = $.extend(html5_file, params);
    html5_file.init();

  });

</script>
</body>
</html>