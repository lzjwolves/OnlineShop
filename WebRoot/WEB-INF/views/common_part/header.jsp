<%@ page language="java"
	import="java.util.*,java.net.URLDecoder,java.net.URLEncoder,com.base.pojo.category.*,com.base.pojo.user.*"
	pageEncoding="utf-8"%>
<%
	Cookie[] cookies = request.getCookies();    //从request中获的Cookie对象的集合
String username="";
String password="";

if(request.getSession().getAttribute("userAccountInfo")!=null){
UserAccountInfo u =(UserAccountInfo)request.getSession().getAttribute("userAccountInfo");
	username=u.getUserName();
	password=u.getUserPassword();
} else if(cookies!=null){
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("username")){
	username= URLDecoder.decode(cookies[i].getValue());//获取用户名
		}
		if(cookies[i].getName().equals("password")){
	password= URLDecoder.decode(cookies[i].getValue());//获取密码
		}
	}
}
//用户是否登录	
Boolean isValid =(Boolean)request.getAttribute("isValid");

//商品类别信息
List<CategoryItem> categoryList =(List<CategoryItem>)request.getAttribute("categoryList");
List<CategoryItem> rootMenu =new ArrayList<CategoryItem>();
List<CategoryItem> secondMenu =new ArrayList<CategoryItem>();
List<CategoryItem> items =new ArrayList<CategoryItem>();
for(int i=0;i<categoryList.size();i++){
if(categoryList.get(i).getParentId()==null){
rootMenu.add(categoryList.get(i));
}else if(categoryList.get(i).getCategoryId()==null){
secondMenu.add(categoryList.get(i));
}else{
items.add(categoryList.get(i));
}


}
//商标信息
List<BrandItem> brandList =(List<BrandItem>)request.getAttribute("brandList");
//用户是否签到
Boolean isSign=(Boolean)request.getAttribute("isSignIn");
%>
<div class="pre-header">
	<div class="container">
		<div class="row">
			<!-- BEGIN TOP BAR LEFT PART -->
			<div class="col-md-6 col-sm-6 additional-shop-info">
				<ul class="list-unstyled list-inline">
					<!-- BEGIN LANGS -->
					<li class="langs-block"><a href="javascript:void(0);"
						class="current">简体中文<i class="fa fa-angle-down"></i> </a>
						<div class="langs-block-others-wrapper">
							<div class="langs-block-others">
								<a href="javascript:alert('該功能暫不開放。');">繁體中文</a> <a
									href="javascript:alert('We don&lsquo;t speak English.');">English</a>
							</div>
						</div>
					</li>
					<!-- END LANGS -->
				</ul>
			</div>
			<!-- END TOP BAR LEFT PART -->
			<!-- BEGIN TOP BAR MENU -->
			<div class="col-md-6 col-sm-6 additional-nav">
				<ul class="list-unstyled list-inline pull-right  navbar-nav">
					<li class="langs-block" ><a href="javascript:void(0);"
						class="current"><i class="fa fa-mobile"></i> 手机APP<i class="fa fa-angle-down"></i> </a>
						<div class="langs-block-others-wrapper">
							<div class="langs-block-others" style="width:170px">
								<img src="assets/img/QR_code/QR_code.png" alt="扫一扫二维码"
									height="150px" width="150px">
							</div>
						</div>
					</li>
					<%
						if(!isValid){
					%>
					<li><a href="login.do">请登录</a></li>
					<li><a href="register.do">注册</a></li>
					<%
						}else{
					%>
					<li class="langs-block"><a href="javascript:void(0);"
						class="current"><i class="fa icon-user"></i> <%=username%><i class="fa fa-angle-down"></i>
					</a>
						<div class="langs-block-others-wrapper">
							<div class="langs-block-others">
							    <a href="my_account.do">我的账户</a>
							    <a href="address.do">收货地址</a>
							    <a href="order.do">我的订单</a>
								<a href="settings.do">设置</a> 
								<a href="#" onclick="logout();">退出</a>
							</div>
						</div>
					</li>
					<li class="langs-block"><i class="fa fa-bell-o"></i> <a href="#">消息<i class="fa fa-angle-down"></i></a>
					<div class="langs-block-others-wrapper">
							<div class="langs-block-others" style="width:170px">
							    暂无消息
							    <br>
							      <br>
							</div>
						</div>
                           </li>
					<li><i class="fa fa-calendar-o"></i> <a href="#" onclick="signIn()">每日签到
					<%if(!isSign){ %>
					<span id ="badge_sign_in" class="badge badge-important">1</span>
					<%} %>
					</a></li>
					<%
						}
					%>
				</ul>
			</div>
			<!-- END TOP BAR MENU -->
		</div>
	</div>
</div>
<!-- BEGIN HEADER -->
<div role="navigation" class="navbar header no-margin">
	<div class="container">
		<div class="navbar-header">
			<a href="/ "  class="navbar-brand"><img
				src="assets/img/logo.png" alt="购物袋" height="50px"> </a>
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<button data-target=".navbar-collapse" data-toggle="collapse"
				class="navbar-toggle" type="button">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- END RESPONSIVE MENU TOGGLER -->
		</div>
		<!-- begin 加载购物车-->
		<div id="cart-info"></div>
		<!-- end 加载购物车-->
		
		<!-- BEGIN NAVIGATION -->
		<div class="collapse navbar-collapse mega-menu">
			<ul class="nav navbar-nav">
				<%
					for(int i=0;i<rootMenu.size();i++){
				%>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" data-delay="0" data-close-others="false"
					data-target="goods_list.do" href="goods_list.do"> <%
 	                out.print(rootMenu.get(i).getCategoryName());
                  %> <i class="fa fa-angle-down"></i> </a> <!-- BEGIN DROPDOWN MENU -->
					<ul class="dropdown-menu" aria-labelledby="mega-menu">
						<li>
							<div class="nav-content">
								<!-- BEGIN DROPDOWN MENU - COLUMN -->
								<%
									for(int j=0;j<secondMenu.size();j++){
								if(secondMenu.get(j).getParentId()==rootMenu.get(i).getChildId()){
								%><div class="nav-content-col">
									<h3>
										<%
											out.print(secondMenu.get(j).getCategoryName());
										%>
									</h3>
									<ul>
										<%
											for(int k=0;k<items.size();k++){
					                     if(items.get(k).getParentId().equals(secondMenu.get(j).getChildId())){
										%>
										
										<li><form style='display: none' id='<%=items.get(k).getCategoryId()%>' action='goods_list.do' method='post'>   
	                                       <input type='hidden' name='categoryId' value='<%=items.get(k).getCategoryId()%>'/>  
	                                       <input type='hidden' name='menuName' value='<%=rootMenu.get(i).getCategoryName()%>'/>
	                                        <input type='hidden' name='categoryName' value='<%=items.get(k).getCategoryName()%>'/>  
                                           </form> 
                                           <a href="javascript: void(0);"  onclick ="gotoGoodslist('<%=items.get(k).getCategoryId()%>')">
	                                       <%out.print(items.get(k).getCategoryName());%>
	                                       </a>  
										</li>
										<%
											}}
										%>
									</ul>
								</div>
								<%
									}}
								%>
								<div class="nav-brands">
									<ul>
										<%
											for(int b=0;b<brandList.size();b++){
										if(brandList.get(b).getParentId().equals(rootMenu.get(i).getChildId())){
										%><li><a href="goods_list.do"><img title="brand"
												alt="brand" src="<%=brandList.get(b).getImgUrl()%>" > </a>
										</li>
										<%
											}}
										%>

									</ul>
								</div>
								<!-- END DROPDOWN MENU - BRANDS -->
							</div></li>
					</ul></li>
				<%
					}
				%>
				<!-- BEGIN TOP SEARCH -->
				<li class="menu-search"><span class="sep"></span> <i class="fa fa-search search-btn"></i>
					<div class="search-box">
						<form action="#">
							<div class="input-group">
								<input type="text" placeholder="搜索 商品/品牌/店铺"
									class="form-control"> <span class="input-group-btn">
									<button class="btn btn-primary" type="submit">搜索</button> </span>
							</div>
						</form>
					</div></li>
				<!-- END TOP SEARCH -->
			</ul>
		</div>
		<!-- END NAVIGATION -->
	</div>
</div>
<!-- END HEADER -->
<script type="text/javascript" src="assets/scripts/cookie.js"></script>
<script type="text/javascript">
	function logout() {
		delCookie('password');
		delCookie('username');
		sessionStorage.removeItem("userAccountInfo");
	window.location.href = "logout.do";
	}
	function gotoGoodslist(categoryId){
	//document.form_goods.submit();
     $('#'+categoryId).submit();
	}
	
	function signIn(){
	$.ajax({
        url:"signIn.do", 
       type:"POST",
        success: function(data){
         alert("签到成功，获得40金币。");
         $("#badge_sign_in").remove();
            }, error:function(){
           alert("今天已经签到过了");
            }
        });
	}
	
	
	jQuery(document).ready(function() {
			$("#cart-info").load("common_part/add_to_cart.do");
		App.init();
	});
</script>