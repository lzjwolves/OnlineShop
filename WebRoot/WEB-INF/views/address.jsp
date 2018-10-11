<%@ page language="java" import="java.util.*,com.base.pojo.address.*" pageEncoding="utf-8"%>
<%
Integer count =0;
List<AddressDetailInfo> list =(List)request.getAttribute("addressList"); 
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
<title>收货信息 | 购物袋</title>

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
				<li class="active">收货地址</li>
			</ul>
			<!-- BEGIN SIDEBAR & CONTENT -->
			<div class="row margin-bottom-40">
				<!-- BEGIN SIDEBAR -->
				<div id="right_sidebar"></div>
				<!-- END SIDEBAR -->

				<!-- BEGIN CONTENT -->
				<div class="col-md-9 col-sm-9">
					<h1>管理收货地址</h1>
				 <div class="shopping-cart-page">
				 <%if(count==0){%>
                    <div class="alert alert-warning"  align="center">
                                    暂无收货地址信息。
                   </div> 
				<%}else{%>
              <div class="shopping-cart-data clearfix">
                <div class="table-wrapper-responsive">
                <table summary="Shopping cart" class="table table-hover">
                <thead>
                  <tr>
                    <th class="shopping-cart-description">收货地址</th>
                    <th class="shopping-cart-ref-no">收件人姓名</th>
                    <th class="shopping-cart-quantity">手机/电话</th>
                    <th class="shopping-cart-quantity" colspan="3" >操作</th>
                  </tr>
                  </thead>
                  <tbody>
                 <%for(int i=0;i<count;i++) {
                 AddressDetailInfo addressDetailInfo =list.get(i);
                 %>
                 <tr>
                    <td class="shopping-cart-description">
                     <p><%=addressDetailInfo.getAddress() %></p>
                    </td>
                    <td class="shopping-cart-ref-no">
                    <%=addressDetailInfo.getRecipient()%>
                    </td>
                    <td class="shopping-cart-quantity">
                      <%=addressDetailInfo.getMobile()%>
                    </td>
                    <td class="del-goods-col">
                     <a href="#" style="color: #333;" data-toggle="modal" data-target="#myModal_update<%=i%>">修改 <i class="fa fa-edit"></i></a>
                    </td> 
                    <td class="del-goods-col">
                       <a href="#" style="color: #333;" data-toggle="modal" data-target="#myModal_delete<%=i%>">删除 <i class="fa fa-trash"></i></a>
                    </td>
                    <td class="shopping-cart-image">
                    <%if(addressDetailInfo.getIsDefault()==1) {%>
                        <p style="color: red;">默认地址 <i class="fa fa-check-circle"></i></p>
                        <%}else{ %>
                        <a href="#" style="color: #333;" onclick ="setDefaultAddress(<%=addressDetailInfo.getId()%>)">设为默认 <i class="fa fa-check"></i></a>
                        <%} %>
                    </td>
                  </tr>
                  
          <!-- 删除确认弹出框 b-->
          <div class="modal fade" id="myModal_delete<%=i %>"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel_delete<%=i %>" aria-hidden="true"   >
          <div class="modal-dialog"  style="width:250px;position: absolute;top: 50%;left: 50%;transform: translateX(-50%) translateY(-50%);">
              <div class="modal-content">
                <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel_delete<%=i %>">操作提示</h4>
               </div>
            <div class="modal-body">确认删除该收货地址？</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success"    data-toggle="modal"  onclick="deleteOneAddress(<%=addressDetailInfo.getId()%>)"  data-dismiss="modal">确定</button>
                <button type="button" class="btn"  data-toggle="modal"  data-dismiss="modal">取消</button>
            </div>
           </div><!-- /.modal-content -->
            </div><!-- /.modal -->
          </div>
          <!-- 删除确认弹出框  e-->
            
        <!-- 修改 模态框b -->
	    <div class="modal fade" id="myModal_update<%=i%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
            
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel_update<%=i%>">修改收货地址</h4>
                </div>
                <div class="modal-body">
                <div class="form-group">
                        <label for="address">收货地址<span class="require">*</span></label>
                        <input type="text" name="address_update<%=i%>" class="form-control" id="address_update<%=i%>" value="<%=addressDetailInfo.getAddress()%>">
                    </div>
                    <div class="form-group">
                        <label for="recipient">收件人姓名<span class="require">*</span></label>
                        <input type="text" name="recipient_update<%=i%>" class="form-control" id="recipient_update<%=i%>" value="<%=addressDetailInfo.getRecipient()%>">
                    </div>
                    <div class="form-group">
                        <label for="mobile">手机号/电话<span class="require">*</span></label>
                        <input type="text" name="mobile_update<%=i%>" class="form-control" id="mobile_update<%=i%>" value="<%=addressDetailInfo.getMobile()%>">
                    </div>
                    <div class="form-group">
                        <label for="txt_statu">设为默认地址</label>
                        <input type="checkbox" name="checkbox_setDefault_update<%=i%>"  id="checkbox_setDefault_update<%=i%>"  class="form-control" checked>
                        <input type="hidden" name="isDefault_update<%=i%>"  id="isDefault_update<%=i%>" value="1">
                        <input type="hidden" name="id_update<%=i%>"  id="id_update<%=i%>" value="<%=addressDetailInfo.getId()%>">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" onclick="updateAddress(<%=i%>)" data-dismiss="modal">保存</button>
                    <button type="button" class="btn" data-dismiss="modal">取消</button> 
                </div>
                
            </div>
        </div>
      </div>
     <!-- 修改 模态框e -->
     
                 <%
                 }%>
                 </tbody>
                </table>
                </div>
              </div>
              <%} %>
              <button class="btn btn-primary"  data-toggle="modal" data-target="#myModal">新增收货信息 <i class="fa fa-edit"></i></button>
            </div>
          	
				</div>
				<!-- END CONTENT -->
			</div>
			<!-- END SIDEBAR & CONTENT -->
		</div>
	</div>
	
    <!-- 新增 模态框b -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">新增收货地址</h4>
                </div>
                <div class="modal-body">
                <div class="form-group">
                        <label for="address">收货地址<span class="require">*</span></label>
                        <input type="text" name="address" class="form-control" id="address" placeholder="收货地址">
                    </div>
                    <div class="form-group">
                        <label for="recipient">收件人姓名<span class="require">*</span></label>
                        <input type="text" name="recipient" class="form-control" id="recipient" placeholder="收件人姓名">
                    </div>
                    <div class="form-group">
                        <label for="mobile">手机号/电话<span class="require">*</span></label>
                        <input type="text" name="mobile" class="form-control" id="mobile" placeholder="手机号/电话">
                    </div>
                    <div class="form-group">
                        <label for="txt_statu">设为默认地址</label>
                        <input type="checkbox" name="checkbox_setDefault"  id="checkbox_setDefault" checked class="form-control" onchange ="setIsDefault()">
                        <input type="hidden" name="isDefault"  id="isDefault" value="1">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="addAddress()" data-dismiss="modal">确定</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button> 
                </div>
            </div>
        </div>
    </div>
    <!-- 新增 模态框e -->
    
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
		
		function setIsDefault(){
		if($("#checkbox_setDefault").prop("checked")){
		$("#isDefault").val(1);
		}else{
		$("#isDefault").val(0);
		}
		}
		
		function setDefaultAddress(id){
		$.ajax({
        url:"update_address.do",
        data:{
        id:id,
        isDefault:1
        }, 
       type:"POST",
        success: function(data){
         alert("设置成功");
          window.location.reload();
            }, error:function(){
           alert("设置失败");
            }
        });
		}
		
		function deleteOneAddress(id){
		$.ajax({
        url:"delete_address.do",
        data:{
         id:id
        }, 
       type:"POST",
       //dataType : 'json',
        success: function(data){
         alert("删除成功");
          window.location.reload();
            }, error:function(){
           alert("删除失败");
            }
        });
		
		}

		function addAddress(){
		$.ajax({
        url:"add_address.do",
        data:{
        address:$("#address").val(),
        recipient:$("#recipient").val(),
        mobile:$("#mobile").val(),
        isDefault:$("#isDefault").val()
        }, 
       type:"POST",
       //dataType : 'json',
        success: function(data){
         alert("添加成功");
          window.location.reload();
            }, error:function(){
           alert("添加失败");
            }
        });
		}
		
		function updateAddress(index){
		if($("#checkbox_setDefault_update"+index).prop("checked")){
		$("#isDefault_update"+index).val(1);
		}else{
		$("#isDefault_update"+index).val(0);
		}
		$.ajax({
        url:"update_address.do",
        data:{
        id:$("#id_update"+index).val(),
        address:$("#address_update"+index).val(),
        recipient:$("#recipient_update"+index).val(),
        mobile:$("#mobile_update"+index).val(),
        isDefault:$("#isDefault_update"+index).val(),
        }, 
       type:"POST",
       //dataType : 'json',
        success: function(data){
         alert("修改成功");
          window.location.reload();
            }, error:function(){
           alert("修改失败");
            }
        });
		}
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>