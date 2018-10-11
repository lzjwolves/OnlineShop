<%@ page language="java" import="java.util.*,java.text.NumberFormat,
com.base.pojo.cart.*,com.base.pojo.address.*,com.base.utils.validator.*" pageEncoding="utf-8"%>
<%
//用户金币数量
Integer goldNum = (Integer)request.getAttribute("goldNum");
//提交的购物车商品信息
Integer count =0;
Double totalPrice =0.00;
List<CartItem> list =(List<CartItem>)request.getAttribute("checkoutList");
if(list!=null){
count=list.size();
//计算购物车总价格
for(int i=0;i<list.size();i++){
CartItem c =list.get(i);
Double rate =1.00;
if("RMB".equals(c.getCurrency())){
rate=1.00;
}else if("USD".equals(c.getCurrency())){
rate=6.00;
}
totalPrice +=(Double)(c.getPrice()*rate*c.getAmount());
NumberFormat nbf=NumberFormat.getInstance();
nbf.setMinimumFractionDigits(2); 
nbf.setGroupingUsed(false);
totalPrice =Double.parseDouble(nbf.format(totalPrice));
}
}


//收货地址信息
Integer addressCount =0;
List<AddressDetailInfo> addressList =(List<AddressDetailInfo>)request.getAttribute("addressList"); 
String defaultRecipient="";
String defaultMobile="";
String defaultAddress="";
Long  defaultAddressId =0l;
Integer isDefault =0;
if(addressList!=null&&addressList.size()>0){
addressCount=addressList.size();
for(int i=0;i<addressCount;i++){
if(addressList.get(i).getIsDefault()==1){
defaultRecipient=addressList.get(i).getRecipient();
defaultMobile=addressList.get(i).getMobile();
defaultAddress=addressList.get(i).getAddress();
defaultAddressId =addressList.get(i).getId();
isDefault=1;
break;
}}
//如果没有默认地址，则选第一个地址作为默认，但isDefault =0
if(("").equals(defaultAddress)){
defaultRecipient=addressList.get(0).getRecipient();
defaultMobile=addressList.get(0).getMobile();
defaultAddress=addressList.get(0).getAddress();
}
}
%>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- Head BEGIN -->
<head>
  <meta charset="utf-8">
  <title>确认订单 | 购物袋</title>

  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <meta content="Metronic Shop UI description" name="description">
  <meta content="Metronic Shop UI keywords" name="keywords">
  <meta content="keenthemes" name="author">

  <meta property="og:site_name" content="-CUSTOMER VALUE-">
  <meta property="og:title" content="-CUSTOMER VALUE-">
  <meta property="og:description" content="-CUSTOMER VALUE-">
  <meta property="og:type" content="website">
  <meta property="og:image" content="-CUSTOMER VALUE-"><!-- link to image for socio -->
  <meta property="og:url" content="-CUSTOMER VALUE-">

  <link rel="shortcut icon" href="favicon.ico">
  <link href="/favicon.ico" rel="SHORTCUT ICON" type="image/ico">

  <!-- Fonts START -->
  <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=PT+Sans+Narrow&subset=all" rel="stylesheet" type="text/css">
  <!-- Fonts END -->

  <!-- Global styles START -->       
 <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
  <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <!-- Global styles END --> 
   
  <!-- Page level plugin styles START -->
  <link href="assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet">
  <link href="assets/plugins/bxslider/jquery.bxslider.css" rel="stylesheet">
  <!-- Page level plugin styles END -->

  <!-- Theme styles START -->
  <link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css">
  <link href="assets/css/style.css" rel="stylesheet" type="text/css">
  <link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css">  
  <link href="assets/css/custom.css" rel="stylesheet" type="text/css">
  <!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body>
     <!-- BEGIN TOP BAR -->
    <div id="headerpage"></div>
    <!-- END TOP BAR -->

    <div class="main">
      <div class="container">
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN CONTENT -->
          <div class="col-md-12 col-sm-12">
            <h1>确认订单</h1>
            <div style="background-color: #fff">
			<%if(count==0){%>
                    <div class="alert alert-warning"  align="center">
                    当前没有任何商品
                   </div>
                    <button class="btn btn-default" type="button">继续逛逛 <i class="fa fa-shopping-cart"></i></button>
				<%}else{%>
				
				<!-- 收货地址 b -->	
           <div class="panel panel-warning">
                <div class="panel-heading"><h3 class="panel-title">收货地址信息</h3></div>
                <div class="panel-body">
               <%if(addressCount==0){ %>
                <div class="form-group has-success">
               <span style="color:red">请填写收货地址信息</span>&nbsp;&nbsp;&nbsp;&nbsp;
               <button type="button" class="btn"   data-toggle="modal" data-target="#myModal">新增收货地址 <i class="fa fa-edit"></i></button> 
               </div>
               <%}else{ %>
                        <div class="form-body">
                           <div class="form-group has-success" style="font-size: 15px" id="show_address_info">
                             收货人：<%=defaultRecipient%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=defaultMobile%>
                             <br>
                             <br>
                             <%if(isDefault==1){%><strong style="color:red">【默认地址】</strong><%}%> <i class="fa fa-map-marker"></i> <%=defaultAddress%>
                           </div>
                           <input type="hidden"  id ="recipient_checkout"    value ="<%=defaultRecipient%>">
                           <input type="hidden"  id ="address_checkout"      value ="<%=defaultAddress%>">
                           <input type="hidden"  id ="mobile_checkout"       value ="<%=defaultMobile%>">
                           <input type="hidden"  id ="address_id_checkout"  value ="<%=defaultAddressId%>">
                        </div>
                        <div class="form-actions">                           
                           <div class="input-group-btn">
                                <button type="button" class="btn"   data-toggle="modal" data-target="#myModal">新增收货地址 <i class="fa fa-edit"></i></button>       
                                <button type="button" class="btn red" data-toggle="dropdown">选择其他地址 <i class="fa fa-angle-down"></i></button>
                                <ul class="dropdown-menu">
                                <%for(int i=0;i<addressCount;i++) {
                                %>
                                <li class="divider"></li>
                                <li style="padding-right: 10px;">
                                <a href="#"  onclick ="setAddress('<%=addressList.get(i).getId()%>','<%=addressList.get(i).getRecipient()%>',
                                '<%=addressList.get(i).getMobile()%>','<%=addressList.get(i).getAddress()%>','<%=addressList.get(i).getIsDefault()%>')">
                                                          收货人： <%=addressList.get(i).getRecipient() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=addressList.get(i).getMobile()%>
                                <br>
                                <br>
                                <%if(addressList.get(i).getIsDefault()==1){%><b style="color:red">【默认地址】</b><%}%>
                                <i class="fa fa-map-marker"></i><%=addressList.get(i).getAddress() %>
                                </a>
                                </li>
                                <%}%>
                                <li class="divider"></li>
                                </ul>
                              </div>      
                        </div>
                        <%} %>
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
                        <input type="text" name="address_add" class="form-control" id="address_add" placeholder="收货地址">
                    </div>
                    <div class="form-group">
                        <label for="recipient">收件人姓名<span class="require">*</span></label>
                        <input type="text" name="recipient_add" class="form-control" id="recipient_add" placeholder="收件人姓名">
                    </div>
                    <div class="form-group">
                        <label for="mobile">手机号/电话<span class="require">*</span></label>
                        <input type="text" name="mobile_add" class="form-control" id="mobile_add" placeholder="手机号/电话">
                    </div>
                    <div class="form-group">
                        <label for="txt_statu">设为默认地址</label>
                        <input type="checkbox"   name="checkbox_setDefault"  id="checkbox_setDefault" checked   onchange ="setIsDefault()">
                        <input type="hidden" name="isDefault_add"  id="isDefault_add" value="1">
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
               
               
               
               
               
               
			<!-- 收货地址 e -->	
				
				
			<!-- 商品信息 b -->	
		  <div class="panel panel-warning">
                <div class="panel-heading"><h3 class="panel-title">商品信息</h3></div>
                <div class="panel-body">
               <div class="col-md-12 clearfix">
                <div class="table-wrapper-responsive" style="max-height:500px;OVERFLOW-Y: auto; OVERFLOW-X:hidden;">
                <table class="table">
                  <tr>
                    <th class="checkout-image">商品图片</th>
                    <th class="checkout-description">商品名称</th>
                    <th class="checkout-model">商品编号</th>
                    <th class="checkout-quantity">数量</th>
                    <th class="checkout-price">单价</th>
                    <th class="checkout-total" colspan="2">价格</th>
                  </tr>
				  <%
				  for(int i=0;i<count;i++){
				  CartItem cartItem =list.get(i);
					Double rate =1.00;
					Double price =0.00;
					Double unitPrice=0.00;
					if("RMB".equals(cartItem.getCurrency())){
					rate =1.00;
					}else if("USD".equals(cartItem.getCurrency())){
					rate =6.00;
					}
					price=cartItem.getPrice()*rate*cartItem.getAmount();
					unitPrice=cartItem.getPrice()*rate;
				 %>
				 <tr id="tr_<%=i%>">
                    <td class="checkout-image">
                      <a href="#"><img src="<%=cartItem.getImgUrl()%>" alt="<%=cartItem.getGoodsName()%>"></a>
                       <input type="hidden" name ="imgUrl_<%=i%>" id ="imgUrl_<%=i%>" value ="<%=cartItem.getImgUrl()%>">
                        <input type="hidden" name ="goodsName_<%=i%>" id ="goodsName_<%=i%>" value ="<%=cartItem.getGoodsName()%>">
                      <input type="hidden" name ="goodsId_<%=i%>" id ="goodsId_<%=i%>" value ="<%=cartItem.getGoodsId()%>">
                      <input type="hidden" name ="amount_<%=i%>" id ="amount_<%=i%>" value ="<%=cartItem.getAmount()%>">
                       <input type="hidden" name ="unitPrice_<%=i%>" id ="unitPrice_<%=i%>" value ="<%=unitPrice%>">
                      <input type="hidden" name ="price_<%=i%>" id ="price_<%=i%>" value ="<%=price%>">
                    </td>
                    <td class="checkout-description"style="padding-top:30">
                      <%=cartItem.getGoodsName()%>
                    </td>
                    <td class="checkout-model" style="padding-top:30">
                      <%=cartItem.getGoodsId()%>
                    </td>
                    <td class="checkout-quantity"style="padding-top:30">    
                          <%=cartItem.getAmount()%>
                    </td>
                    <td class="checkout-price"style="padding-top:30">
                      <strong><%=unitPrice+"元"%></strong>
                    </td>
                    <td class="checkout-total"style="padding-top:30">
                      <strong id="_price_<%=i%>"><%=price+"元"%></strong>
                    </td>
                  </tr>
				  <%} %>
                </table>
                </div>
                <div class="shopping-total">
                  <ul>
                    <li>
                      <em>商品总价</em>
                      <strong class="price"  id="_totalPrice"><%=totalPrice+"元" %></strong>
                    </li>
                    <li>
                      <em>优惠抵扣</em>
                      <strong class="price">0.00元</strong>
                    </li>
                    <li class="shopping-total-price">
                      <em>实付金额</em>
                      <strong class="price" id="_realPrice"><%=totalPrice+"元" %></strong>
                      <input type="hidden" name ="totalPrice" id ="totalPrice" value ="<%=totalPrice%>">
                      <input type="hidden" name ="realPrice" id ="realPrice" value ="<%=totalPrice%>">
                    </li>
                  </ul>
                </div>
			</div>
              </div>
           </div>
           
           <!-- 商品信息 e -->
			
			<div class="panel panel-warning" style="width:48%;  float:left; display:inline;height:auto">
                <div class="panel-heading"><h3 class="panel-title">支付方式</h3></div>
                <div class="panel-body">
                        <div class="form-body">
                           <div class="form-group has-warning">
                             <b>金币支付</b>
                             <br>
                             <br>
                             当前金币：<b><%=goldNum%> 金币</b>（10金币 = 1元） 
                 <b style="color:red"><%if(totalPrice*CommonConst.RMBGOLDRATE<goldNum){%>
                              将扣除<%=totalPrice*CommonConst.RMBGOLDRATE%>金币<%}else{ %>金币不足<%} %></b>          
                             <br>
                             <br>
                             <div class="input-group-btn">
                             <button type="button" class="btn red" data-toggle="dropdown">更换支付方式 <i class="fa fa-angle-down"></i></button>
                             <ul class="dropdown-menu">
                                  <li><a >金币支付</a></li>
                                  <li><a >微信支付</a></li>
                                  <li><a >支付宝支付</a></li>
                                  <li><a >银行卡支付</a></li>
                                </ul>
                              </div>  
                           </div>
                        </div>
                  </div>
                </div>
			
            <div class="panel panel-warning" style="width:48%;float:right;height:auto">
                <div class="panel-heading"><h3 class="panel-title">备注信息</h3></div>
                <div class="panel-body">
                        <div class="form-body">
                     <div class="form-group">
                             <label for="name"></label>
                             <textarea class="form-control" rows="5" placeholder="备注" id="remark_checkout" value=""></textarea>
                          </div>
                        </div>
                  </div>
                </div>
			<div style="width:100%;float:right;height:auto">
			<button class="btn" >再逛逛 <i class="fa fa-shopping-cart"></i></button>
            <button class="btn btn-primary" data-toggle="modal" data-target="#myModal_submitOrder">提交订单 <i class="fa fa-check"></i></button>
            </div>
			<%}%>              
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->

<!-- 弹出框 b-->
<div class="modal fade" id="myModal_submitOrder" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"   >
    <div class="modal-dialog"  style="width:400px;position: absolute;top: 50%;left: 50%;transform: translateX(-50%) translateY(-50%);">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">操作提示</h4>
            </div>
            <div class="modal-body"  >确认提交订单？</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary"    onclick ="checkout();" data-dismiss="modal">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 弹出框  e-->

<!-- 弹出框 b-->
<div class="modal fade" id="myModal_success" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"   >
    <div class="modal-dialog"  style="width:400px;position: absolute;top: 50%;left: 50%;transform: translateX(-50%) translateY(-50%);">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">操作提示</h4>
            </div>
            <div class="modal-body"  >下单成功。</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary"    onclick ="javascript:window.location.href='order.do'" data-dismiss="modal">查看订单</button>
                <button type="button" class="btn btn-default" data-dismiss="modal"  onclick ="javascript:window.location.href='/'">返回购物</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 弹出框  e-->





        <!-- BEGIN SIMILAR PRODUCTS -->
        <div class="row margin-bottom-40">
          <div class="col-md-12 col-sm-12 bxslider-wrapper bxslider-wrapper-similar-products">
            <h2>Most popular products</h2>
              <ul class="bxslider bxslider-similar-products" data-slides-phone="1" data-slides-tablet="2" data-slides-desktop="4" data-slide-margin="20">
                <li>
                  <div class="product-item">
                    <div class="pi-img-wrapper">
                      <img src="assets/temp/products/k4.jpg" class="img-responsive" alt="Berry Lace Dress">
                      <div>
                        <a href="assets/temp/products/k4.jpg" class="btn btn-default fancybox-button">Zoom</a>
                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                      </div>
                    </div>
                    <h3><a href="goods_detail.do">Berry Lace Dress</a></h3>
                    <div class="pi-price">$29.00</div>
                    <a href="#" class="btn btn-default add2cart">Add to cart</a>
                  </div>
                </li>
                <li>
                  <div class="product-item">
                    <div class="pi-img-wrapper">
                      <img src="assets/temp/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                      <div>
                        <a href="assets/temp/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                      </div>
                    </div>
                    <h3><a href="goods_detail.do">Berry Lace Dress2</a></h3>
                    <div class="pi-price">$29.00</div>
                    <a href="#" class="btn btn-default add2cart">Add to cart</a>
                  </div>
                </li>
                <li>
                  <div class="product-item">
                    <div class="pi-img-wrapper">
                      <img src="assets/temp/products/k2.jpg" class="img-responsive" alt="Berry Lace Dress">
                      <div>
                        <a href="assets/temp/products/k2.jpg" class="btn btn-default fancybox-button">Zoom</a>
                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                      </div>
                    </div>
                    <h3><a href="goods_detail.do">Berry Lace Dress3</a></h3>
                    <div class="pi-price">$29.00</div>
                    <a href="#" class="btn btn-default add2cart">Add to cart</a>
                  </div>
                </li>
                <li>
                  <div class="product-item">
                    <div class="pi-img-wrapper">
                      <img src="assets/temp/products/k3.jpg" class="img-responsive" alt="Berry Lace Dress">
                      <div>
                        <a href="assets/temp/products/k3.jpg" class="btn btn-default fancybox-button">Zoom</a>
                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                      </div>
                    </div>
                    <h3><a href="goods_detail.do">Berry Lace Dress4</a></h3>
                    <div class="pi-price">$29.00</div>
                    <a href="#" class="btn btn-default add2cart">Add to cart</a>
                  </div>
                </li>
                <li>
                  <div class="product-item">
                    <div class="pi-img-wrapper">
                      <img src="assets/temp/products/k4.jpg" class="img-responsive" alt="Berry Lace Dress">
                      <div>
                        <a href="assets/temp/products/k4.jpg" class="btn btn-default fancybox-button">Zoom</a>
                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                      </div>
                    </div>
                    <h3><a href="goods_detail.do">Berry Lace Dress5</a></h3>
                    <div class="pi-price">$29.00</div>
                    <a href="#" class="btn btn-default add2cart">Add to cart</a>
                  </div>
                </li>
                <li>
                  <div class="product-item">
                    <div class="pi-img-wrapper">
                      <img src="assets/temp/products/k1.jpg" class="img-responsive" alt="Berry Lace Dress">
                      <div>
                        <a href="assets/temp/products/k1.jpg" class="btn btn-default fancybox-button">Zoom</a>
                        <a href="#product-pop-up" class="btn btn-default fancybox-fast-view">View</a>
                      </div>
                    </div>
                    <h3><a href="goods_detail.do">Berry Lace Dress6</a></h3>
                    <div class="pi-price">$29.00</div>
                    <a href="#" class="btn btn-default add2cart">Add to cart</a>
                  </div>
                </li>
              </ul>
          </div>
        </div>
        <!-- END SIMILAR PRODUCTS -->
      </div>
    </div>

    

    <!--footer-->  
    <div id="footerpage"></div>
    <!--footer over-->

    <!-- BEGIN fast view of a product -->
    <div id="product-pop-up" style="display: none; width: 700px;">
            <div class="product-page product-pop-up">
              <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-3">
                  <div class="product-main-image">
                    <img src="assets/temp/products/model7.jpg" alt="Cool green dress with red bell" class="img-responsive">
                  </div>
                  <div class="product-other-images">
                    <a href="#" class="active"><img alt="Berry Lace Dress" src="assets/temp/products/model3.jpg"></a>
                    <a href="#"><img alt="Berry Lace Dress" src="assets/temp/products/model4.jpg"></a>
                    <a href="#"><img alt="Berry Lace Dress" src="assets/temp/products/model5.jpg"></a>
                  </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-9">
                  <h1>Cool green dress with red bell</h1>
                  <div class="price-availability-block clearfix">
                    <div class="price">
                      <strong><span>$</span>47.00</strong>
                      <em>$<span>62.00</span></em>
                    </div>
                    <div class="availability">
                      Availability: <strong>In Stock</strong>
                    </div>
                  </div>
                  <div class="description">
                    <p>Lorem ipsum dolor ut sit ame dolore  adipiscing elit, sed nonumy nibh sed euismod laoreet dolore magna aliquarm erat volutpat 
Nostrud duis molestie at dolore.</p>
                  </div>
                  <div class="product-page-options">
                    <div class="pull-left">
                      <label class="control-label">Size:</label>
                      <select class="form-control input-sm">
                        <option>L</option>
                        <option>M</option>
                        <option>XL</option>
                      </select>
                    </div>
                    <div class="pull-left">
                      <label class="control-label">Color:</label>
                      <select class="form-control input-sm">
                        <option>Red</option>
                        <option>Blue</option>
                        <option>Black</option>
                      </select>
                    </div>
                  </div>
                  <div class="product-page-cart">
                    <div class="product-quantity">
                        <input id="product-quantity3" type="text" value="1" readonly class="form-control input-sm">
                    </div>
                    <button class="btn btn-primary" type="submit">Add to cart</button>
                    <button class="btn btn-default" type="submit">More details</button>
                  </div>
                </div>

                <div class="sticker sticker-sale"></div>
              </div>
            </div>
    </div>
    <!-- END fast view of a product -->

    <!-- Load javascripts at bottom, this will reduce page load time -->
    <!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
    <!--[if lt IE 9]>
    <script src="assets/plugins/respond.min.js"></script>  
    <![endif]-->  
    <script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>      
    <script type="text/javascript" src="assets/plugins/back-to-top.js"></script>  
    <script type="text/javascript" src="assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"></script>  
    <!-- END CORE PLUGINS -->

    <!-- BEGIN PAGE LEVEL JAVASCRIPTS(REQUIRED ONLY FOR CURRENT PAGE) -->
    <script type="text/javascript" src="assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>  
    <script type="text/javascript" src="assets/plugins/bxslider/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src='assets/plugins/zoom/jquery.zoom.min.js'></script><!-- product zoom -->
    <script src="assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->

    <script type="text/javascript" src="assets/scripts/app.js"></script>   
    <script type="text/javascript">
        jQuery(document).ready(function() {
			$("#headerpage").load("common_part/header.do");
            $("#footerpage").load("common_part/footer.do");
            App.init();
            App.initBxSlider();
            App.initImageZoom();
            App.initTouchspin();
        });
        
        //添加收货地址
        function addAddress(){
		$.ajax({
        url:"add_address.do",
        data:{
        address:$("#address_add").val(),
        recipient:$("#recipient_add").val(),
        mobile:$("#mobile_add").val(),
        isDefault:$("#isDefault_add").val()
        }, 
       type:"POST",
        success: function(data){
         alert("添加成功");
          window.location.reload();
            }, error:function(){
           alert("添加失败");
            }
        });
		}
		
        //添加收货地址时设置isDefault属性
        function setIsDefault(){
		if($("#checkbox_setDefault").prop("checked")){
		$("#isDefault_add").val(1);
		}else{
		$("#isDefault_add").val(0);
		}
		}
		
        //选择其他收货地址
        function setAddress(addressId,recipient,mobile,address,isDefault){
        $("#address_id_checkout").val(addressId);
        $("#recipient_checkout").val(recipient);
        $("#mobile_checkout").val(mobile);
        $("#address_checkout").val(address);
        if(isDefault==1){
        $("#show_address_info").html('收货人：'+recipient+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+mobile+
        '<br><br><strong style="color:red">【默认地址】</strong> <i class="fa fa-map-marker"></i> '+address);
        }else{
        $("#show_address_info").html('收货人：'+recipient+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+mobile+
        '<br><br><i class="fa fa-map-marker"></i> '+address);
        }
        }
       function checkout(){
        var length=<%=count%>;
                 var json1 =[];
        json1.push({"realPrice":$("#realPrice").val(),
        "address_id":$("#address_id_checkout").val(),
        "recipient":$("#recipient_checkout").val(),
        "mobile":$("#mobile_checkout").val(),
        "address":$("#address_checkout").val(),
        "remark":$("#remark_checkout").val()
        });
       for(var i=0;i<length;i++){
       var arr ={
       "img_url":$("#imgUrl_"+i).val(),
       "goods_name":$("#goodsName_"+i).val(),
       "goods_id":$("#goodsId_"+i).val(),
       "amount": $("#amount_"+i).val(),
       "unit_price":$("#unitPrice_"+i).val(),
        "price": $("#price_"+i).val()
       };
       json1.push(arr);
       
       }
        $.ajax({
        url:"checkoutCfm.do",
        data:{json:JSON.stringify(json1)}, 
       type:"POST",
        success: function(data){
       $('#myModal_success').modal('show');
            }, error:function(){
           alert("订单提交失败");
            }
        });
       }
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>