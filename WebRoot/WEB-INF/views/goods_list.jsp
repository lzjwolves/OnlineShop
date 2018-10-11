<%@ page language="java" import="java.util.*,com.base.pojo.goods.*" pageEncoding="utf-8"%>
<%

Boolean isLogin =false;
 if(session.getAttribute("userAccountInfo")!=null){
 isLogin=true;
}
List<GoodsInfo> goodsList =(List<GoodsInfo>)request.getAttribute("goodsList");
Integer count =0;
if(goodsList!=null){
count=goodsList.size();
}
String categoryName =request.getAttribute("categoryName")!=null?(String)request.getAttribute("categoryName"):"";
 %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- Head BEGIN -->
<head>
  <meta charset="utf-8">
  <title><%=categoryName%> | 购物袋</title>

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
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"><!-- for slider-range -->
  <link href="assets/plugins/bxslider/jquery.bxslider.css" rel="stylesheet">
  <link href="assets/plugins/rateit/src/rateit.css" rel="stylesheet" type="text/css">
  <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css">
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

    <!--  <div class="title-wrapper" style="background: #72c2ff url(assets/temp/title-bg/1.jpg) no-repeat 100% ;">
      <div class="container"><div class="container-inner">
        <h1><span>MEN</span> CATEGORY</h1>
        <em>Over 4000 Items are available here</em>
      </div></div>
    </div>-->
    <div class="main"  >
      <div class="container">
        <ul class="breadcrumb">
            <li id="p1"><a href="/">首页</a></li>
            <li><a href=""><%=request.getAttribute("menuName")%></a></li>
            <li class="active"><%=request.getAttribute("categoryName")%></li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-5">
           

            <div class="sidebar-filter margin-bottom-25">
              <h2>条件筛选</h2>
              <h3></h3>
              <div class="checkbox-list">
                <label><input type="checkbox"> 包邮</label>
                <label><input type="checkbox"> 自营</label>
              </div>

              <h3>价格区间</h3>
              <p>
                <label for="amount">范围：</label>
                <input type="text" id="amount" style="border:0; color:#f6931f; font-weight:bold;">
              </p>
              <div id="slider-range"></div>
            </div>

            <div class="sidebar-products clearfix">
              <h2>热销</h2>
              <div class="item">
                <a href="goods_detail.do"><img src="assets/temp/products/k1.jpg" alt="Some Shoes in Animal with Cut Out"></a>
                <h3><a href="goods_detail.do">女鞋</a></h3>
                <div class="price">￥31.00</div>
              </div>
              <div class="item">
                <a href="goods_detail.do"><img src="assets/temp/products/k4.jpg" alt="Some Shoes in Animal with Cut Out"></a>
                <h3><a href="goods_detail.do">连衣裙</a></h3>
                <div class="price">￥23.00</div>
              </div>
              <div class="item">
                <a href="goods_detail.do"><img src="assets/temp/products/k3.jpg" alt="Some Shoes in Animal with Cut Out"></a>
                <h3><a href="goods_detail.do">分裤</a></h3>
                <div class="price">￥86.00</div>
              </div>
            </div>
          </div>
          <!-- END SIDEBAR -->
          
          
          <!-- BEGIN CONTENT -->
          <div class="col-md-9 col-sm-7">
            <div class="row list-view-sorting clearfix">
              <div class="col-md-2 col-sm-2 list-view">
                <a href="#"><i class="fa fa-th-large"></i></a>
                <a href="#"><i class="fa fa-th-list"></i></a>
              </div>
              <div class="col-md-10 col-sm-10">
                <div class="pull-right">
                  <label class="control-label">显示：</label>
                  <select class="form-control input-sm" onchange ="changeShowSize(this.value)" id="showNum">
                    <option value="9" selected="selected">9</option>
                    <option value="25">25</option>
                    <option value="50">50</option>
                    <option value="75">100</option>
                    <option value="200">200</option>
                  </select>
                </div>
                <div class="pull-right">
                  <label class="control-label">排序:</label>
                  <select class="form-control input-sm">
                    <option value="#?sort=p.sort_order&amp;order=ASC"  selected >综合排序</option>
                    <option value="#?sort=p.price&amp;order=ASC">价格 (从低到高)</option>
                    <option value="#?sort=p.price&amp;order=DESC">价格 (从高到低)</option>
                    <option value="#?sort=rating&amp;order=DESC">月销量</option>
                    <option value="#?sort=rating&amp;order=ASC">总销量</option>
                    <option value="#?sort=p.model&amp;order=ASC">上架时间</option>
                  </select>
                </div>
              </div>
            </div>
            <!-- BEGIN PRODUCT LIST -->
            <div class="row product-list">
            <%if(goodsList!=null&&goodsList.size()>0){
                for(int i=0;i<goodsList.size();i++){
                GoodsInfo g  =goodsList.get(i);
            %>
            <!-- PRODUCT ITEM START -->
              <div class="col-md-4 col-sm-6 col-xs-12">
                <div class="product-item">
                  <div class="">
                    <a href="goods_detail.do?goodsId=<%=g.getGoodsId()%>"><img src="<%=g.getImgUrl()%>" class="img-responsive" alt="Berry Lace Dress"></a>
                    <div>
                    </div>
                  </div>
                  <h3><a href="goods_detail.do?goodsId=<%=g.getGoodsId()%>"><%=g.getGoodsName()%></a></h3>
                  <div class="pi-price">
                  <%if(g.getCurrency().equals("RMB")){
                  if(("1").equals(g.getIsSpecialPrice().toString())){
                      %><span style="text-decoration:line-through;color:#555"><%out.print("￥"+g.getUnitPrice());%></span><%} 
                      out.print("￥"+g.getCurrentPrice());
                  }else{
                   if(("1").equals(g.getIsSpecialPrice().toString())){
                    %><span style="text-decoration:line-through;color:#555"><%out.print("$"+g.getUnitPrice());%></span><%} 
                      out.print("$"+g.getCurrentPrice());
                  }
                  %>
                  </div>
                  <a  class="btn btn-default add2cart" 
                  onclick="addToCart('<%=g.getGoodsId()%>',1)">加入购物车</a>
                  <%if(("1").equals(g.getIsSpecialPrice().toString())){%>
                  <div class="sticker sticker-sale"></div>
                  <%} %>
                  
                  <%if(("1").equals(g.getIsNew().toString())){%>
                  <div class="sticker sticker-new"></div>
                  <%} %>
                </div>
              </div>
          <!-- PRODUCT ITEM END -->
           <%
              } 
            }%>

            </div>
            <!-- END PRODUCT LIST -->
            <!-- BEGIN PAGINATOR -->
            <div class="row">
              <div class="col-md-4 col-sm-4 items-info">共<%=count %>条记录</div>
              <div class="col-md-8 col-sm-8">
                <ul class="pagination pull-right">
                  <li><a href="#">&laquo;</a></li>
                  <li><a href="#">1</a></li>
                  <li><span>2</span></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#">4</a></li>
                  <li><a href="#">5</a></li>
                  <li><a href="#">&raquo;</a></li>
                </ul>
              </div>
            </div>
            <!-- END PAGINATOR -->
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
      </div>
    </div>

    <!-- BEGIN BRANDS -->
	<div class="brands">
		<div class="container">
			<div class="row">
				<div class="bxslider-wrapper">
					<ul class="bxslider" data-slides-phone="1" data-slides-tablet="3"
						data-slides-desktop="6" data-slide-margin="15">
						<li><a href="#"><img src="assets/temp/brands/4/1.jpg"
								alt="canon" title="canon"> </a>
						</li>
						<li><a href="#"><img src="assets/temp/brands/4/2.jpg"
								alt="esprit" title="esprit"> </a>
						</li>
						<li><a href="#"><img src="assets/temp/brands/4/3.jpg"
								alt="gap" title="gap"> </a>
						</li>
						<li><a href="#"><img src="assets/temp/brands/4/4.jpg"
								alt="next" title="next"> </a>
						</li>
						<li><a href="#"><img src="assets/temp/brands/4/5.jpg"
								alt="puma" title="puma"> </a>
						</li>
						<li><a href="#"><img src="assets/temp/brands/4/6.jpg"
								alt="zara" title="zara"> </a>
						</li>
						<li><a href="#"><img src="assets/temp/brands/4/7.jpg"
								alt="canon" title="canon"> </a>
						</li>
						<li><a href="#"><img src="assets/temp/brands/4/8.jpg"
								alt="esprit" title="esprit"> </a>
						</li>
						<li><a href="#"><img src="assets/temp/brands/4/9.jpg"
								alt="gap" title="gap"> </a>
						</li>
						<li><a href="#"><img src="assets/temp/brands/4/10.jpg"
								alt="next" title="next"> </a>
						</li>
						<li><a href="#"><img src="assets/temp/brands/4/11.jpg"
								alt="puma" title="puma"> </a>
						</li>
						<li><a href="#"><img src="assets/temp/brands/4/12.jpg"
								alt="zara" title="zara"> </a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- END BRANDS -->

    

    <!--footer-->  
    <div id="footerpage"></div>
    <!--footer over-->

    
    <form style='display: none' id='selectFilter' action='goods_list.do' method='post'>   
	  <input type='hidden' name='categoryId' id="_categoryId"  value='<%=request.getAttribute("categoryId")%>'/>  
	  <input type='hidden' name='menuName' id="_menuName"  value='<%=request.getAttribute("menuName")%>'/>
	  <input type='hidden' name='categoryName' id="_categoryName"  value='<%=request.getAttribute("categoryName")%>'/>
	   <input type='hidden' name='curentPage' id="_curentPage"  value='1'/>
	   <input type='hidden' name='tagetPage' id="_tagetPage"  value='1'/>
	   <input type='hidden' name='maxLine' id="_maxLine"  value='1'/>  
       </form> 
    <!-- Load javascripts at bottom, this will reduce page load time -->
    <!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
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
    <script type="text/javascript" src="assets/plugins/bxslider/jquery.bxslider.min.js"></script><!-- slider for products -->
    <script src="assets/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
    <script type="text/javascript" src='assets/plugins/zoom/jquery.zoom.min.js'></script><!-- product zoom -->
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script><!-- for slider-range -->
    <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
    <script src="assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
    <script type="text/javascript" src="assets/scripts/app.js"></script>
    <script type="text/javascript">
    var isLogin =<%=isLogin%>;
      jQuery(document).ready(function() {
        $("#headerpage").load("common_part/header.do");
        $("#footerpage").load("common_part/footer.do");
        document.getElementById('showNum').value=<%=request.getAttribute("maxLine")%>;
        App.init();
        App.initBxSlider(); 
        App.initImageZoom();
        App.initSliderRange();
        App.initUniform(); 
        App.initTouchspin();
      });
     function changeShowSize(iNum){
     document.getElementById('_maxLine').value=iNum;
      $("#selectFilter").submit();
     }
     
     
      

     function addToCart(goodsId,amount){
 
      $.ajax({
        url:"common_part/add_to_cart.do",
        data:{
        goodsId:goodsId,
        amount:amount,
        },
       type:"get",
      //  dataType : 'json',
        success: function(data){
        document.getElementById("cart-info").innerHTML=data;
            }, error:function(){
           alert("请先登录");
            }
        });
     }
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>