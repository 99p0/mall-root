/**
 * Created by final.young@hotmail.com on 2015/8/14.
 */

/**
 *
 * @param sSource
 * @param aoData
 * @param fnCallback
 */
function retrieveData(sSource, aoData, fnCallback){
    $.ajax({
        type: "post",
        url: sSource,
        dataType:"json",
        data:aoData,
        success: function(data) {
            fnCallback(data);
        }
    });
}

/**
 *
 * @param rowData
 * @returns {string}
 */
function dealerAction(rowData){
    var html = '<a class="btn btn-info btn-sm" href="#" onclick="updateDealerForModel('+rowData.id+')"><i class="glyphicon glyphicon-edit icon-white"></i>修改</a>';
    html += '<a class="btn btn-warning btn-sm" href="#" onclick="integralActionModel('+rowData.id+')"><i class="glyphicon glyphicon-zoom-in icon-white"></i>积分管理</a>';
    html += '<a class="btn btn-danger btn-sm" href="#" onclick="if(confirm(\'确认删除该经销商吗？\')){deleteDealer('+rowData.id+', this)}"><i class="glyphicon glyphicon-trash icon-white"></i>删除</a>';
    return html;
}
/**
 *
 * @param v_id
 */
function updateDealerForModel(v_id){
    $.ajax({
        type: "post",
        url: appPath + "/dealer/"+v_id,
        dataType:"json",
        data:{"id":v_id},
        success: function(rowData) {
            $("#dealerModal-update").modal('show');
            $("#fm-dealer-update input[name='organizationName']").val(rowData.organizationName);
            $("#fm-dealer-update input[name='loginName']").val(rowData.loginName);
            $("#fm-dealer-update input[name='loginPwd']").val("");
            $("#fm-dealer-update input[name='id']").val(rowData.id);
            $("#fm-dealer-update input[name='id-show']").val('MO-'+rowData.id);
        }
    });
}
/**
 * 删除经销商
 * @param objId
 */
function deleteDealer(objId, obj){
    $(obj).addClass("disabled");
    $.ajax({
        async:false,
        type: "POST",
        url: appPath+"/dealer/delete/"+objId,
        beforeSend:function(){},
        success: function(data){
            if(data == 'not-login'){
                alert("当前会话已经失效，请重新登录");
                window.location.href = appPath+"/login?furl="+window.location.href;// 进入登录页面
            }else if(data == 'success'){
                $(obj).parent('td').parent('tr').remove();//
            }else if(data == 'error'){
                alert("出现错误");
            }else if(data == 'bugs'){
                alert("缺少参数");
            }
        },
        complete:function(){}
    });
}
/**
 *
 * @param v_id
 */
function integralActionModel(v_id){
    $("#integralModal").modal('show');
    $("#dealerId").val(v_id);
}
/**
 *
 */
function updateDealer(){
    // TODO 检验类型是否正确
    $.ajax({
        type: "post",
        url: appPath + "/dealer/update",
        dataType:"text",
        data: $("#fm-dealer-update").serialize(),
        success: function(data) {
            if(data == "not-login"){// 未登录
                alert("未登录系统");
            }else if(data == "success"){
                alert("修改成功");
                $('#dealerModal-update').modal('hide');
                location.reload();
            }
        }
    });
}
/**
 *
 */
function addDealer(){
    // TODO 检验各项都是不为空，类型是否正确
    $.ajax({
        type: "post",
        url: appPath + "/dealer/add",
        dataType:"text",
        data: $("#fm-dealer-add").serialize(),
        success: function(data) {
            if(data == "not-login"){// 未登录
                alert("未登录系统");
            }else if(data == "success"){
                alert("添加成功");
                $('#dealerModal-add').modal('hide');
                location.reload();
            }
        }
    });
}
/**
 *
 * @param operator
 */
function integralAction(operator){
    var integralNum = $("#integral-num-"+operator).val();
    var dealerId = $("#dealerId").val();
    // TODO 检验是否是数字
    $.ajax({
        type: "post",
        url: appPath + "/dealer/"+dealerId+"/integral",
        dataType:"text",
        data: {"operator":operator, "integralNum":integralNum },
        success: function(data) {
            if(data == "not-login"){// 未登录
                alert("未登录系统");
            }else if(data == "success"){
                alert("操作成功");
                $('#integralModal').modal('hide');
                location.reload();
            }
        }
    });
}
/**
 *
 * @param rowData
 * @returns {string}
 */
function activityAction(rowData){
    var html = '<a class="btn btn-info btn-sm" href="#" onclick="updateActivityForModel('+rowData.id+')"><i class="glyphicon glyphicon-edit icon-white"></i>修改</a>';
    html += '<a class="btn btn-danger btn-sm" href="#" onclick="if(confirm(\'确认删除吗？\')){deleteActivity('+rowData.id+', this)}"><i class="glyphicon glyphicon-trash icon-white"></i>删除</a>';
    return html;
}
function updateActivityForModel(v_id){
    $.ajax({
        type: "post",
        url: appPath + "/activity/"+v_id,
        dataType:"json",
        data:{"id":v_id},
        success: function(rowData) {
            $("#activityModal-update").modal('show');
        }
    });
}
/**
 * 删除活动
 *
 * @param objId
 */
function deleteActivity(objId, obj){
    $(obj).addClass("disabled");
    $.ajax({
        async:false,
        type: "POST",
        url: appPath+"/activity/delete/"+objId,
        beforeSend:function(){},
        success: function(data){
            console.log("data:");
            if(data == 'not-login'){
                alert("当前会话已经失效，请重新登录");
                window.location.href = appPath+"/login?furl="+window.location.href;// 进入登录页面
            }else if(data == 'success'){
                $(obj).parent('td').parent('tr').remove();//
            }else if(data == 'error'){
                alert("出现错误");
            }else if(data == 'bugs'){
                alert("缺少参数");
            }
        },
        complete:function(){}
    });
}
/**
 *
 * @param rowData
 * @returns {string}
 */
function salesRecordAction(rowData){
    var html = '<a class="btn btn-info btn-sm" href="#" onclick="updateSalesRecordForModel('+rowData.id+')"><i class="glyphicon glyphicon-edit icon-white"></i>修改</a>';
    html += '<a class="btn btn-danger btn-sm" href="#" onclick="if(confirm(\'确认删除吗？\')){deleteSalesRecord('+rowData.id+', this)}"><i class="glyphicon glyphicon-trash icon-white"></i>删除</a>';
    return html;
}
/**
 *
 * @param v_id
 */
function updateSalesRecordForModel(v_id){
    $.ajax({
        type: "post",
        url: appPath + "/sales/record/"+v_id,
        dataType:"json",
        data:{"id":v_id},
        success: function(rowData) {
            $("#fm-salesRecord-update")[0].reset();
            $("#code").val(rowData.code);
            $("#id").val(rowData.id);
            $("#dealerId").val(rowData.dealerId);
            $("#salesRecordModal-update").modal('show');
        }
    });
}
/**
 *
 */
function updateSalesRecord(){
    $.ajax({
        type: "post",
        url: appPath + "/sales/record/update",
        dataType:"text",
        data: $("#fm-salesRecord-update").serialize(),
        success: function(data) {
            if(data == "not-login"){// 未登录
                alert("未登录系统");
            }else if(data == "success"){
                alert("修改成功");
                $('#salesRecordModal-update').modal('hide');
                location.reload();
            }
        }
    });
}
/**
 *
 */
function addSalesRecord(){
    var code = $("#code").val();
    if(!code){
        alert("请输入商品编码");
        return;
    }
    var dealerId = $("#dealerId").val();
    if(!dealerId){
        alert("请选择经销商");
        return;
    }
    $.ajax({
        type: "post",
        url: appPath + "/sales/record/add",
        dataType:"text",
        data: $("#fm-salesRecord-add").serialize(),
        success: function(data) {
            if(data == "not-login"){// 未登录
                alert("未登录系统");
            }else if(data == "success"){
                alert("添加成功");
                $('#salesRecordModal-add').modal('hide');
                location.reload();
            }
        }
    });
}
/**
 * 删除 销售记录
 *
 * @param objId
 */
function deleteSalesRecord(objId, obj){
    $(obj).addClass("disabled");
    $.ajax({
        async:false,
        type: "POST",
        url: appPath+"/sales/record/delete/"+objId,
        beforeSend:function(){},
        success: function(data){
            console.log("data:");
            if(data == 'not-login'){
                alert("当前会话已经失效，请重新登录");
                window.location.href = appPath+"/login?furl="+window.location.href;// 进入登录页面
            }else if(data == 'success'){
                $(obj).parent('td').parent('tr').remove();//
            }else if(data == 'error'){
                alert("出现错误");
            }else if(data == 'bugs'){
                alert("缺少参数");
            }
        },
        complete:function(){}
    });
}
/**
 *
 */
function dealersInit(){
    $.ajax({
        type: "post",
        url: appPath + "/dealer/all",
        dataType:"json",
        success: function(data) {
            var html = '<option value="">请选择经销商</option>';
            if(data){
                html = '<option value="">请选择经销商</option>';
                for(var i=0; i<data.length; i++) {
                    html += '<option value="'+data[i].id+'">'+data[i].organizationName+'</option>';
                }
            }
            $("#dealerId").append(html);
            $("#jxs").append(html);
            //$("select[name='dealerId']").append(html);
        }
    });
}

/**
 * 活动详情页和点赞用户列表
 *
 * @param id
 */
function activityInfoForModel(v_id){
    activityInfo(v_id);
    greatMemberList(v_id);
}

/**
 *
 *
 * @param v_id
 */
function activityInfo(v_id){
    $.ajax({
        type: "post",
        url: appPath + "/sales/record/"+v_id,
        dataType:"json",
        data:{"id":v_id},
        success: function(rowData) {
            $("#activityPage").html(rowData);
        }
    });
}

/**
 * 点赞的用户列表
 * @param v_id
 */
function greatMemberList(v_id){
    $.ajax({
        type: "post",
        url: appPath + "/activity/great/"+v_id+"",
        dataType:"json",
        data:{"id":v_id},
        success: function(data) {
            var html= "";
            for(var i=0; i<data.length; i++) {
                html += '<li class="list-group-item" data="'+data[i]+'">'+data[i].nickname+'</option>';
            }
            $("#memberList").html(html);
        }
    });
}
