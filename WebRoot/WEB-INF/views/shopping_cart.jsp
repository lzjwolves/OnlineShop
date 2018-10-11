<%@ page language="java" import="java.util.*,java.text.NumberFormat,com.base.pojo.cart.*" pageEncoding="utf-8"%>
<%
Integer count =0;
Double totalPrice =0.00;

List<CartItem> list =(List)request.getAttribute("cartItemList");
if(list!=null){
count=list.size();
//计算购物车总价格
for(int i=0;i<list.size();i++){
CartItem c =list.get(i);
Double rate =1.00;
if("RMB".equals(c.getCurrency())){
rate=1.00;
}else{
rate=6.00;
}
totalPrice +=(Double)(c.getPrice()*rate*c.getAmount());
NumberFormat nbf=NumberFormat.getInstance();
nbf.setMinimumFractionDigits(2); 
nbf.setGroupingUsed(false);
totalPrice =Double.parseDouble(nbf.format(totalPrice));
}
}

%>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- Head BEGIN -->
<head>
  <meta charset="utf-8">
  <title>购物车 | 购物袋</title>

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
            <h1>购物车</h1>
            <div class="shopping-cart-page">
			<%if(count==0){%>
                    <div class="alert alert-warning"  align="center">
                    购物车是空的。
                   </div>
                    <button class="btn btn-default" type="button">继续逛逛 <i class="fa fa-shopping-cart"></i></button>
				<%}else{%>
              <div class="shopping-cart-data clearfix">
                <div class="table-wrapper-responsive" style="max-height:500px;OVERFLOW-Y: auto; OVERFLOW-X:hidden;">
                <table summary="Shopping cart">
                  <tr>
				    <th class="shopping-cart-price"><input id ="checkbox_all" type ="checkbox" style="zoom:130%;" checked onchange="changeCheckBox()" ></th>
                    <th class="shopping-cart-image">商品图片</th>
                    <th class="shopping-cart-description">商品描述</th>
                    <th class="shopping-cart-ref-no">商品编号</th>
                    <th class="shopping-cart-quantity">数量</th>
                    <th class="shopping-cart-price">单价</th>
                    <th class="shopping-cart-total" colspan="2">价格</th>
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
				     <td class="shopping-cart-price">
                      <input id ="checkbox_<%=i%>" type ="checkbox" checked onchange ="reCalPrice(<%=i %>)" style="zoom:130%;margin-top: 20px" >
                      <input type="hidden" name ="imgUrl_<%=i%>" id ="imgUrl_<%=i%>" value ="<%=cartItem.getImgUrl()%>">
                        <input type="hidden" name ="goodsName_<%=i%>" id ="goodsName_<%=i%>" value ="<%=cartItem.getGoodsName()%>">
                      <input type="hidden" name ="goodsId_<%=i%>" id ="goodsId_<%=i%>" value ="<%=cartItem.getGoodsId()%>">
                      <input type="hidden" name ="amount_<%=i%>" id ="amount_<%=i%>" value ="<%=cartItem.getAmount()%>">
                       <input type="hidden" name ="unitPrice_<%=i%>" id ="unitPrice_<%=i%>" value ="<%=unitPrice%>">
                      <input type="hidden" name ="price_<%=i%>" id ="price_<%=i%>" value ="<%=price%>">
                    </td>
                    <td class="shopping-cart-image">
                      <a href="#"><img src="<%=cartItem.getImgUrl()%>" alt="<%=cartItem.getGoodsName()%>"></a>
                    </td>
                    <td class="shopping-cart-description">
                      <h3><a href="#"><%=cartItem.getGoodsName()%></a></h3>
                      <p>白 128G 尊享版</p>
                    </td>
                    <td class="shopping-cart-ref-no">
                      <%=cartItem.getGoodsId()%>
                    </td>
                    <td class="shopping-cart-quantity">
                      <div class="product-quantity">
                          <input id="_amount_<%=i%>" type="text" value="<%=cartItem.getAmount()%>" onchange ="reCalPrice(<%=i %>)" readonly class="form-control input-sm">
                      </div>
                    </td>
                    <td class="shopping-cart-price">
                      <strong><%=unitPrice+"元"%></strong>
                    </td>
                    <td class="shopping-cart-total">
                      <strong id="_price_<%=i%>"><%=price+"元"%></strong>
                    </td>
                    <td class="del-goods-col">
                      <a class="del-goods"   data-toggle="modal" data-target="#myModal<%=i %>" ><i class="fa fa-times"></i></a>
                    </td>
                  </tr>
                  
             <!-- 弹出框 b-->
          <div class="modal fade" id="myModal<%=i %>"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel<%=i %>" aria-hidden="true"   >
          <div class="modal-dialog"  style="width:250px;position: absolute;top: 50%;left: 50%;transform: translateX(-50%) translateY(-50%);">
              <div class="modal-content">
                <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">操作提示</h4>
               </div>
            <div class="modal-body">确认删除该商品？</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success"    data-toggle="modal"  onclick="deleteOne(<%=i%>)"  data-dismiss="modal">确定</button>
                <button type="button" class="btn"  data-toggle="modal"  data-dismiss="modal">取消</button>
            </div>
           </div><!-- /.modal-content -->
            </div><!-- /.modal -->
           </div>
            <!-- 弹出框  e-->
            
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
			<button class="btn btn-default" >继续逛逛 <i class="fa fa-shopping-cart"></i></button>
            <button class="btn btn-primary"  onclick ="checkout();">去结算 <i class="fa fa-check"></i></button>
			<%}%>
              
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->







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
        var length=<%=count%>;
        //重新计算价格
        function reCalPrice(index){
        //页面显示的以 "_"开头，区分input hidden 
        //单价*数量，保留两位
        var amount =$("#_amount_"+index).val();
        var price =(amount*$("#unitPrice_"+index).val()).toFixed(2);
        var totalPrice =0.00;
        $("#price_"+index).val(price);
        $("#amount_"+index).val(amount);
        for(var i=0;i<length;i++){
        if ($("#checkbox_"+i).prop("checked")){
        totalPrice = totalPrice +$("#amount_"+i).val()*$("#unitPrice_"+i).val(); 
        }
        }
        totalPrice=totalPrice.toFixed(2);
        $("#totalPrice").val(totalPrice);
        $("#realPrice").val(totalPrice);
        
        //页面显示
        $("#_price_"+index).html(price+'元');
        $("#_totalPrice").html(totalPrice+'元');
        $("#_realPrice").html(totalPrice+'元');
        }
        
       function changeCheckBox(){
       if ($("#checkbox_all").prop("checked")){
       for(var i=0;i<length;i++){
        $("#checkbox_"+i).prop('checked', true);
       }}else{
       for(var i=0;i<length;i++){
       $("#checkbox_"+i).prop('checked', false);
       }
       }
       reCalPrice(0);
       } 
       
       function deleteOne(index){
        $.ajax({
        url:"common_part/deleteItem.do",
        data:{
        goodsId:$("#goodsId_"+index).val()
        },
       type:"POST",
      //  dataType : 'json',
        success: function(data){
        $("#cart-info").load("common_part/add_to_cart.do");
        $("#tr_"+index).hide();
        $("#checkbox_"+index).prop('checked', false);
        reCalPrice(0);
            }, error:function(){
           alert("aaaaa");
            }
        });
       }
         
       function checkout(){
                 var json1 =[];
        json1.push({"realPrice":$("#realPrice").val()});
       for(var i=0;i<length;i++){
       if ($("#checkbox_"+i).prop("checked")){
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
       }
       $("#json_form").val(JSON.stringify(json1));
       $("#checkout_form").submit();
        
       }
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
    <form id="checkout_form" action="checkout.do" method="post">
    <input type="hidden" name="json" id="json_form" >
    </form>
</body>
<!-- END BODY -->
</html>