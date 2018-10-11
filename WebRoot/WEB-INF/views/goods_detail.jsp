<%@ page language="java" import="java.util.*,com.base.pojo.goods.*"
	pageEncoding="utf-8"%>
	<%
	GoodsInfo goodsInfo =(GoodsInfo)request.getAttribute("goodsInfo");
	 %>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- Head BEGIN -->
<head>
  <meta charset="utf-8">
  <title><%=goodsInfo.getGoodsName() %> |购物袋</title>

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
    
    <div class="main">
      <div class="container"> 
        <ul class="breadcrumb">
            <li><a href="index.html">首页</a></li>
            <li><a href="">商品</a></li>
            <li class="active"><%=goodsInfo.getGoodsName() %></li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
          <!-- BEGIN SIDEBAR -->
          <div class="sidebar col-md-3 col-sm-5">
            
            <div class="sidebar-products clearfix">
              <h2>最热</h2>
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
            <div class="product-page">
              <div class="row">
                <div class="col-md-6 col-sm-6">
                  <div class="product-main-image">
                    <img src="<%=goodsInfo.getImgUrl()%>" alt="Cool green dress with red bell" class="img-responsive" data-BigImgSrc="<%=goodsInfo.getImgUrl()%>">
                  </div>
                  <div class="product-other-images">
                    <a href="#" class="active"><img alt="Berry Lace Dress" src="<%=goodsInfo.getImgUrl()%>"></a>
                    <a href="#"><img alt="Berry Lace Dress" src="<%=goodsInfo.getImgUrl()%>"></a>
                    <a href="#"><img alt="Berry Lace Dress" src="<%=goodsInfo.getImgUrl()%>"></a>
                  </div>
                </div>
                <div class="col-md-6 col-sm-6">
                  <h1><%=goodsInfo.getGoodsName() %></h1>
                  <div class="price-availability-block clearfix">
                    <div class="price">
                     <% if(1==goodsInfo.getIsSpecialPrice()){
                    %><strong style="text-decoration:line-through;color:#555">￥ <%=goodsInfo.getCurrentPrice()%></strong>
                    <%} %>
                    <strong>￥ <%=goodsInfo.getCurrentPrice()%></strong>
<!--                       <em>$<span>62.00</span></em> -->
                    </div>
                    <div class="availability">
                      库存: <strong><%=goodsInfo.getInventory()%> 件</strong>
                    </div>
                  </div>
                  <div class="description">
                    <p><%=goodsInfo.getDescription() %></p>
                  </div>
                  <div class="product-page-options">
                    <div class="pull-left">
                      <label class="control-label">参数1:</label>
                      <select class="form-control input-sm">
                        <option>不可选</option>
                        <option>不可选</option>
                        <option>不可选</option>
                      </select>
                    </div>
                    <div class="pull-left">
                      <label class="control-label">参数2:</label>
                      <select class="form-control input-sm">
                        <option>不可选</option>
                        <option>不可选</option>
                        <option>不可选</option>
                      </select>
                    </div>
                  </div>
                  <div class="product-page-cart">
                    <div class="product-quantity">
                        <input id="product-quantity" type="text" value="1" readonly class="form-control input-sm">
                    </div>
                    <button class="btn btn-primary"   onclick="addToCart('<%=goodsInfo.getGoodsId()%>' )">加入购物车</button>
                  </div>
                  <div class="review">
                    <input type="range" value="4" step="0.25" id="backing4">
                    <div class="rateit" data-rateit-backingfld="#backing4" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                    </div>
                    <a href="#">2 条评论</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">写评论</a>
                  </div>
                  <ul class="social-icons">
                    <li><a class="facebook" data-original-title="facebook" href="#"></a></li>
                    <li><a class="twitter" data-original-title="twitter" href="#"></a></li>
                    <li><a class="googleplus" data-original-title="googleplus" href="#"></a></li>
                    <li><a class="evernote" data-original-title="evernote" href="#"></a></li>
                    <li><a class="tumblr" data-original-title="tumblr" href="#"></a></li>
                  </ul>
                </div>

                <div class="product-page-content">
                  <ul id="myTab" class="nav nav-tabs">
                    <li><a href="#Description" data-toggle="tab">商品详情</a></li>
                    <li><a href="#Information" data-toggle="tab">商品参数</a></li>
                    <li class="active"><a href="#Reviews" data-toggle="tab">用户评论 (2)</a></li>
                  </ul>
                  <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade" id="Description">
                      <p><%=goodsInfo.getDescription() %></p>
                    </div>
                    <div class="tab-pane fade" id="Information">
                      <table class="datasheet">
                        <tr>
                          <th colspan="2">Additional features</th>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">Value 1</td>
                          <td>21 cm</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">Value 2</td>
                          <td>700 gr.</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">Value 3</td>
                          <td>10 person</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">Value 4</td>
                          <td>14 cm</td>
                        </tr>
                        <tr>
                          <td class="datasheet-features-type">Value 5</td>
                          <td>plastic</td>
                        </tr>
                      </table>
                    </div>
                    <div class="tab-pane fade in active" id="Reviews">
                      <!--<p>There are no reviews for this product.</p>-->
                      <div class="review-item clearfix">
                        <div class="review-item-submitted">
                          <strong>183****4532</strong>
                          <em>15/9/2018 - 07:37</em>
                          <div class="rateit" data-rateit-value="5" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                        </div>                                              
                        <div class="review-item-content">
                            <p>自从鸟巢发布会后预约了好几轮昨日中午一点终于抢到，物流显示今天早上9点就到达了配送站，
                            而且配送站距离我公司只有300米不到，却等到11点都还没送来，我主动打过去说还要1个小时左右，
                            我索性自己去拿了，爱不释手啊，背面是玻璃质感的，这辈子买过第一款超4000元手机，好怕摔，
                            等网购的气垫壳来再带出门，抽空把我坚果PRO1的数据传过来吧！</p>
                        </div>
                      </div>
                      <div class="review-item clearfix">
                        <div class="review-item-submitted">
                          <strong>138****3420</strong>
                          <em>13/9/2018 - 17:49</em>
                          <div class="rateit" data-rateit-value="2.5" data-rateit-ispreset="true" data-rateit-readonly="true"></div>
                        </div>                                              
                        <div class="review-item-content">
                            <p>是不是很个性，因为好用，前后买了三台，现在家里都用锤一手机，我以前一直用苹果的，
                            现在觉得苹果有苹果的优势吧，但我更喜欢锤子的应
                            用，工作量很大的情况下电池能用两天，大爆炸，闪电胶囊，这些都
                            不用说，只要用过锤一手机的都知道，这些应用很贴心！</p>
                        </div>
                      </div>

                      <!-- BEGIN FORM-->
                      <form action="#" class="reviews-form" role="form">
                        <h2>写评论</h2>
                        <div class="form-group">
                          <label for="review">评价<span class="require">*</span></label>
                          <textarea class="form-control" rows="8" id="review"></textarea>
                        </div>
                        <div class="form-group">
                          <label for="email">评分</label>
                          <input type="range" value="4" step="0.25" id="backing5">
                          <div class="rateit" data-rateit-backingfld="#backing5" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5">
                          </div>
                        </div>
                        <div class="padding-top-20">                  
                          <button type="submit" class="btn btn-primary">发表</button>
                        </div>
                      </form>
                      <!-- END FORM--> 
                    </div>
                  </div>
                </div>

                <%if(("1").equals(goodsInfo.getIsSpecialPrice().toString())){%>
                  <div class="sticker sticker-sale"></div>
                  <%} %>
                  
                  <%if(("1").equals(goodsInfo.getIsNew().toString())){%>
                  <div class="sticker sticker-new"></div>
                  <%} %>
              </div>
            </div>
          </div>
          <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->

        <!-- BEGIN SIMILAR PRODUCTS -->
        <div class="row margin-bottom-40">
          <div class="col-md-12 col-sm-12 bxslider-wrapper bxslider-wrapper-similar-products">
            <h2>最受欢迎</h2>
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
                    <a href="#" class="btn btn-default add2cart"  onclick="addToCart('<%=goodsInfo.getGoodsId()%>',1)">加入购物车</a>
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

    <!-- BEGIN BRANDS -->
    <div class="brands">
      <div class="container">
        <div class="row">
          <div class="bxslider-wrapper">
            <ul class="bxslider" data-slides-phone="1" data-slides-tablet="3" data-slides-desktop="6" data-slide-margin="15">
              <li><a href="#"><img src="assets/temp/brands/canon.jpg" alt="canon" title="canon"></a></li>
              <li><a href="#"><img src="assets/temp/brands/esprit.jpg" alt="esprit" title="esprit"></a></li>
              <li><a href="#"><img src="assets/temp/brands/gap.jpg" alt="gap" title="gap"></a></li>
              <li><a href="#"><img src="assets/temp/brands/next.jpg" alt="next" title="next"></a></li>
              <li><a href="#"><img src="assets/temp/brands/puma.jpg" alt="puma" title="puma"></a></li>
              <li><a href="#"><img src="assets/temp/brands/zara.jpg" alt="zara" title="zara"></a></li>
              <li><a href="#"><img src="assets/temp/brands/canon.jpg" alt="canon" title="canon"></a></li>
              <li><a href="#"><img src="assets/temp/brands/esprit.jpg" alt="esprit" title="esprit"></a></li>
              <li><a href="#"><img src="assets/temp/brands/gap.jpg" alt="gap" title="gap"></a></li>
              <li><a href="#"><img src="assets/temp/brands/next.jpg" alt="next" title="next"></a></li>
              <li><a href="#"><img src="assets/temp/brands/puma.jpg" alt="puma" title="puma"></a></li>
              <li><a href="#"><img src="assets/temp/brands/zara.jpg" alt="zara" title="zara"></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- END BRANDS -->


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
                      <select class="form-control">
                        <option>L</option>
                        <option>M</option>
                        <option>XL</option>
                      </select>
                    </div>
                    <div class="pull-left">
                      <label class="control-label">Color:</label>
                      <select class="form-control">
                        <option>Red</option>
                        <option>Blue</option>
                        <option>Black</option>
                      </select>
                    </div>
                  </div>
                  <div class="product-page-cart">
                    <div class="product-quantity">
                        <input id="product-quantity2" type="text" value="1" readonly class="form-control input-sm">
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
    <script src="assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script><!-- Quantity -->
    <script src="assets/plugins/rateit/src/jquery.rateit.js" type="text/javascript"></script>
    <script type="text/javascript" src='assets/plugins/zoom/jquery.zoom.min.js'></script><!-- product zoom -->
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script><!-- for slider-range -->
    <script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>

    <script type="text/javascript" src="assets/scripts/app.js"></script>   
    <script type="text/javascript">
      jQuery(document).ready(function() {
        $("#headerpage").load("common_part/header.do");
        $("#footerpage").load("common_part/footer.do");  
        App.init();   
        App.initBxSlider(); 
        App.initImageZoom();
        App.initSliderRange();
        App.initUniform();
        App.initTouchspin();
      });
      
     
        function addToCart(goodsId){
 var  amount =$("#product-quantity").val();
      $.ajax({
        url:"common_part/add_to_cart.do",
        data:{
        goodsId:goodsId,
        amount:amount,
        },
       type:"GET",
      //  dataType : 'json',
        success: function(data){
        alert("添加成功");
        document.getElementById("cart-info").innerHTML=data;
            }, error:function(){
           alert("aaaaa");
            }
        });
     }
      
    </script>
    <!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>