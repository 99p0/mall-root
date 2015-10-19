<%@ page pageEncoding="UTF-8"%>
<!-- left menu starts -->
<div class="col-sm-2 col-lg-2">
    <div class="sidebar-nav">
        <div class="nav-canvas">
            <div class="nav-sm nav nav-stacked">
            </div>
            <ul class="nav nav-pills nav-stacked main-menu">
                <li class="nav-header">菜单</li>
                <li><a class="ajax-link" href="${ctx}/dealer"><i class="glyphicon glyphicon-user"></i><span> 经销商管理</span></a></li>
                <li><a class="ajax-link" href="${ctx}/activity"><i class="glyphicon glyphicon-star"></i><span> 活动管理</span></a></li>
                <li><a class="ajax-link" href="${ctx}/sales/record"><i class="glyphicon glyphicon-edit"></i><span> 授权管理</span></a></li>
            </ul>
            <label id="for-is-ajax" for="is-ajax"><input id="is-ajax" type="checkbox"> Ajax on menu</label>
        </div>
    </div>
</div>
<!-- left menu ends -->