<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <%@ include file="/WEB-INF/views/jsp/commons/common.jsp" %>
  <title>${titleComm }</title>
</head>
<body>
<div class="ch-container">
  <div class="ch-container">
    <div class="row">
      <div class="row"><div class="col-md-12 center login-header"><h2>欢迎来到从艺网商城</h2></div><!--/span-->
      </div><!--/row-->
      <div class="row">
        <div class="well col-md-5 center login-box">
          <div class="alert alert-info"><c:choose><c:when test="${not empty requestScope.callMsg}">${requestScope.callMsg}</c:when><c:otherwise>请输入你的用户名和密码</c:otherwise></c:choose></div>
          <form class="form-horizontal" action="${ctx}/sign-in/sys" method="post">
            <fieldset>
              <div class="input-group input-group-lg">
                <span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i></span>
                <input type="text" name="name" class="form-control" placeholder="请输入用户名" value="superman">
              </div>
              <div class="clearfix"></div><br>
              <div class="input-group input-group-lg">
                <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
                <input type="password" name="pwd" class="form-control" placeholder="请输入密码" value="123456">
              </div>
              <div class="clearfix"></div>
              <div class="input-prepend">
                <%--<label class="remember" for="remember"><input type="checkbox" id="remember"> Remember me</label>--%>
              </div>
              <div class="clearfix"></div>
              <p class="center col-md-5">
                <button type="submit" class="btn btn-primary">Login</button>
              </p>
            </fieldset>
          </form>
        </div>
        <!--/span-->
      </div><!--/row-->
    </div><!--/fluid-row-->
  </div><!--/.fluid-container-->
</div>
<%@ include file="/WEB-INF/views/jsp/commons/common_js.jsp" %>
</body>
</html>