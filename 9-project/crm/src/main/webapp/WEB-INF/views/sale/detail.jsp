<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>凯盛软件CRM-首页</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <%@ include file="../include/css.jsp"%>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

    <%@ include file="../include/header.jsp"%>
   	<jsp:include page="../include/sider.jsp">
   		<jsp:param value="work_record_my" name="param"/>
   	</jsp:include>
   
    <!-- =============================================== -->

    <!-- 右侧内容部分 -->
    <div class="content-wrapper">

        <!-- Main content -->
        <section class="content">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">销售机会基本资料</h3>
                    <div class="box-tools">
                        <a href="/sales/my" class="btn btn-primary btn-sm"><i class="fa fa-arrow-left"></i> 返回列表</a>
                        <button id="delBtn" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i> 删除</button>
                    </div>
                </div>
                <div class="box-body no-padding">
                    <table class="table">
                        <tr>
                            <td class="td_title">机会名称</td>
                            <td>${saleChance.name}</td>
                            <td class="td_title">价值</td>
                            <td><fmt:formatNumber value="${saleChance.worth}"></fmt:formatNumber> </td>
                            <td class="td_title">当前进度</td>
                            <td>
                                ${saleChance.process}
                                <button class="btn btn-xs btn-success" id="showChangeProgressModalBtn"><i class="fa fa-pencil"></i></button>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="box-footer">
                    <span style="color: #ccc" class="pull-right">
                      	  创建日期：<fmt:formatDate value="${saleChance.createTime}"></fmt:formatDate>
                    </span>
                </div>
            </div>

            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">关联客户资料</h3>
                </div>
                <div class="box-body no-padding">
                    <table class="table">
                        <tr>
                            <td class="td_title">姓名</td>
                            <td>${saleChance.customer.custName}</td>
                            <td class="td_title">职位</td>
                            <td>${saleChance.customer.jobTitle}</td>
                            <td class="td_title">联系电话</td>
                            <td>${saleChance.customer.mobile}</td>
                        </tr>
                        <tr>
                            <td class="td_title">所属行业</td>
                            <td>${saleChance.customer.trade}</td>
                            <td class="td_title">客户来源</td>
                            <td>${saleChance.customer.source}</td>
                            <td class="td_title">级别</td>
                            <td class="star">${saleChance.customer.level}</td>
                        </tr>
                       
                            <tr>
                                <td class="td_title">地址</td>
                                <td colspan="5">${saleChance.customer.address}</td>
                            </tr>
                       
                        
                            <tr>
                                <td class="td_title">备注</td>
                                <td colspan="5">${saleChance.customer.mark}</td>
                            </tr>
             
                    </table>
                </div>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <h4>跟进记录
                        <small><button id="showRecordModalBtn" class="btn btn-success btn-xs"><i class="fa fa-plus"></i></button></small>
                    </h4>
                    <c:if test="${empty recordList}">
                    	<li>
                                <!-- timeline icon -->
                            <i class="fa fa-circle-o bg-red"></i>
                                <div class="timeline-item">
                                    <div class="timeline-body">
                                           	暂无跟进记录
                                    </div>
                                </div>
                            </li>
                    </c:if>
                    
                    <ul class="timeline">
                      		<c:forEach items="${recordList}" var="record">
                      			<c:choose>
                      				<c:when test="${saleChance.process == '成交' }">
                      					 <li>
			                                <!-- timeline icon -->
			                                <i class="fa fa-check bg-green"></i>
			                                <div class="timeline-item">
			                                    <span class="time"><i class="fa fa-clock-o"></i> <fmt:formatDate value="${record.createTime}"/></span>
			                                    <div class="timeline-body">
			                                           	${record.content }
			                                    </div>
			                                </div>
			                            </li>
                      				</c:when>
	                      			<c:when test="${saleChance.process == '暂时搁置' }">
	                      				<li>
			                                <!-- timeline icon -->
			                                <i class="fa fa-close bg-red"></i>
			                                <div class="timeline-item">
			                                    <span class="time"><i class="fa fa-clock-o"></i> <fmt:formatDate value="${record.createTime}"/></span>
			                                    <div class="timeline-body">
			                                            	${record.content }
			                                    </div>
			                                </div>
			                            </li>
	                      				</c:when>
	                      			<c:otherwise>
	                      				<li>
			                                <!-- timeline icon -->
			                                <i class="fa fa-info bg-blue"></i>
			                                <div class="timeline-item">
			                                    <span class="time"><i class="fa fa-clock-o"></i> <fmt:formatDate value="${record.createTime}"/></span>
			                                    <div class="timeline-body">
			                                          	 	${record.content }
			                                    </div>
			                                </div>
			                            </li>
	                      			</c:otherwise>
	                      			</c:choose>
                      		
                      		</c:forEach>
                    </ul>
                </div>
                <div class="col-md-4">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">日程安排</h3>
                        </div>
                        <div class="box-body">

                        </div>
                    </div>
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">相关资料</h3>
                        </div>
                        <div class="box-body">

                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="recordModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">添加跟进记录</h4>
                        </div>
                        <div class="modal-body">
                            <form action="/sales/my/new/record" id="recordForm" method="post">
                                <input type="hidden" name="saleId" value="${saleChance.id}">
                                <textarea id="recordContent"  class="form-control" name="content"></textarea>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" id="saveRecordBtn">保存</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->


            <div class="modal fade" id="changeProgressModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">更新当前进度</h4>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="/sales/my/${saleChance.id}/progress/update" id="updateProgressForm">
                                <input type="hidden" name="id" value="${saleChance.id}">
                                <select name="progress" class="form-control">
                                    <c:forEach items="${processList}" var="pro">
                                        <option value="${pro}">${pro}</option>
                                    </c:forEach>
                                </select>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="button" class="btn btn-primary" id="saveProgress">更新</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- 底部 -->
 <%@ include file="../include/footer.jsp"%>
</div>
<!-- ./wrapper -->

 <%@ include file="../include/js.jsp"%>
 <script>
	$(function(){
		
	}) 
 </script>
 	
 
</body>
</html>
    