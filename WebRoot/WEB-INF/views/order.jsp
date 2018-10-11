<%@ page language="java" import="java.util.*,com.base.pojo.order.*" pageEncoding="utf-8"%>
<%
Integer count =0;
List<OrderItem> list =(List)request.getAttribute("orderItemList"); 
if(list!=null){
count =list.size();
}
 %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
<meta charset="utf-8">
<title>我的订单 | 购物袋</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta content="Metronic Shop UI description" name="description">
<meta content="Metronic Shop UI keywords" name="keywords">
<meta content="keenthemes" name="author">

<meta property="og:site_name" content="-CUSTOMER VALUE-">
<meta property="og:title" content="-CUSTOMER VALUE-">
<meta property="og:description" content="-CUSTOMER VALUE-">
<meta property="og:type" content="website">
<meta property="og:image" content="-CUSTOMER VALUE-">
<!-- link to image for socio -->
<meta property="og:url" content="-CUSTOMER VALUE-">

<link rel="shortcut icon" href="favicon.ico">
<link href="/favicon.ico" rel="SHORTCUT ICON" type="image/ico">

<!-- Fonts START -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow&subset=all"
	rel="stylesheet" type="text/css">
<!-- Fonts END -->

<!-- Global styles START -->
<link rel="stylesheet" type="text/css"
	href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
<link href="assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<!-- Global styles END -->

<!-- Page level plugin styles START -->
<link href="assets/plugins/fancybox/source/jquery.fancybox.css"
	rel="stylesheet">
<link href="assets/plugins/bxslider/jquery.bxslider.css"
	rel="stylesheet">
<link href="assets/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css" />
<!-- Page level plugin styles END -->

<!-- Theme styles START -->
<link href="assets/css/style-metronic.css" rel="stylesheet"
	type="text/css">
<link href="assets/css/style.css" rel="stylesheet" type="text/css">
<link href="assets/css/style-responsive.css" rel="stylesheet"
	type="text/css">
<link href="assets/css/custom.css" rel="stylesheet" type="text/css">
<!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body>
	<!-- BEGIN TOP BAR -->
	<!-- 顶部导航 -->
	<div id="headerpage"></div>
	<!--顶部导航 over-->
	<!-- END TOP BAR -->



	<div class="main">
		<div class="container">
			<ul class="breadcrumb">
				<li><a href="index.html">主页</a>
				</li>
				<li><a href="">用户信息</a>
				</li>
				<li class="active">我的订单</li>
			</ul>
			<!-- BEGIN SIDEBAR & CONTENT -->
			<div class="row margin-bottom-40">
				<!-- BEGIN SIDEBAR -->
				<div id="right_sidebar"></div>
				<!-- END SIDEBAR -->

				<!-- BEGIN CONTENT -->
				<div class="col-md-9 col-sm-9">
					<h1>我的订单</h1>
				 <div class="shopping-cart-page">
				 <%if(count==0){%>
                    <div class="alert alert-warning"  align="center">
                                    暂无订单信息。
                   </div> 
				<%}else{%>
              <div class="shopping-cart-data clearfix">
                <div class="table-wrapper-responsive">
                <table summary="Shopping cart"  class="table table-striped">
                <thead>
                  <tr>
                   <th class="shopping-cart-quantity">状态</th>
                   <th class="shopping-cart-quantity">交易时间</th>
                    <th class="shopping-cart-quantity">订单号</th>
                    <th class="shopping-cart-quantity">收货地址信息</th>
                    <th class="shopping-cart-quantity">交易金额</th>
                  </tr>
                  </thead>
                  <tbody>
                 <%for(int i=0;i<count;i++) {
                 OrderItem orderItem =list.get(i);
                 %>
                 <tr>
                    <td class="shopping-cart-quantity">
                  <%   if(orderItem.getState()==0){%>
                  <p>待发货</p>
                  <%}else if(orderItem.getState()==1) {%>
                  <p>配送中</p>
                  <%}else if(orderItem.getState()==2) {%>
                  <p>待确认收货</p>
                  <%}else if(orderItem.getState()==3) {%>
                  <p>订单已完成</p>
                  <%}else if(orderItem.getState()==4) {%>
                  <p>待付款</p>
                  <%}%>
                    </td>
                    <td class="shopping-cart-quantity">
                     <p><%=orderItem.getCreateTime()%></p>
                    </td>
                    <td class="shopping-cart-quantity">
                     <p><%=orderItem.getOrderId()%></p>
                    </td>
                    <td class="shopping-cart-quantity">
                    <%=orderItem.getAddress()%>，<%=orderItem.getReceiver()%>， <%=orderItem.getMobile()%>
                    </td>
                    <td class="shopping-cart-quantity">
                      <%=orderItem.getTotalPay()%>元
                    </td>
                    <td class="shopping-cart-quantity">
                    </td> 
                  </tr>

          <!-- BEGIN SHIPPING METHOD -->
        <tr >
        <td colspan="5" >
				<a data-toggle="collapse" data-parent="#accordion" 
				   href="#collapseTwo_<%=i %>"   onclick="showOrderDetail('<%=orderItem.getOrderId()%>','<%=i%>');">
					订单详情 <i class="fa fa-angle-down"></i>
				</a>
		<div id="collapseTwo_<%=i %>" class="panel-collapse collapse">
			<div class="panel-body"   id="order_detail_body_<%=i %>">
			</div>
		</div>
	</td>
	</tr>
     <!-- END SHIPPING METHOD -->
                 <%
                 }%>
                 </tbody>
                </table>
                </div>
              </div>
              <%} %>
              <button class="btn btn-primary"   onclick="javascript :history.back(-1)">返回 <i class="fa fa-edit"></i></button>
            </div>
				</div>
				<!-- END CONTENT -->
			</div>
			<!-- END SIDEBAR & CONTENT -->
		</div>
	</div>
	

	
	
	<!--footer-->
	<div id="footerpage"></div>
	<!--footer over-->

	<!-- Load javascripts at bottom, this will reduce page load time -->
	<!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
	<!--[if lt IE 9]>
    <script src="assets/plugins/respond.min.js"></script>  
    <![endif]-->
	<script src="assets/plugins/jquery-1.10.2.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/jquery-migrate-1.2.1.min.js"
		type="text/javascript"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
	<script type="text/javascript"
		src="assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"></script>
	<!-- END CORE PLUGINS -->

	<!-- BEGIN PAGE LEVEL JAVASCRIPTS (REQUIRED ONLY FOR CURRENT PAGE) -->
	<script type="text/javascript"
		src="assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
	<!-- pop up -->
	<script type="text/javascript"
		src="assets/plugins/bxslider/jquery.bxslider.min.js"></script>
	<!-- slider for products -->
	<script src="assets/plugins/uniform/jquery.uniform.min.js"
		type="text/javascript"></script>

	<script type="text/javascript" src="assets/scripts/app.js"></script>
	<script type="text/javascript">
		jQuery(document).ready(function() {
			$("#headerpage").load("common_part/header.do");
			$("#footerpage").load("common_part/footer.do");
            $("#right_sidebar").load("common_part/right_sidebar.do");
             $("#infomation_note").load("common_part/infomation_note.do");
			App.init();
			App.initUniform();
			App.initBxSlider();
		});
		
		function showOrderDetail(orderId,index){
         $("#order_detail_body_"+index).load("order_detail.do?orderId="+orderId);
		}
		
		
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>