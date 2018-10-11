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
<!-- BEGIN CART -->
		<div class="cart-block">
			<div class="cart-info">
				<a href="javascript:void(0);" class="cart-info-count">购物车<%=count%>件|共<%=totalPrice%>元</a>
				<!--<a href="javascript:void(0);" class="cart-info-value">1260元</a>-->
			</div>
			<i class="fa fa-shopping-cart"></i>
			<!-- BEGIN CART CONTENT -->
			<div class="cart-content-wrapper" >
				<div class="cart-content">
					<ul class="scroller" style="max-height:250px;OVERFLOW-Y: auto; OVERFLOW-X:hidden;">
					<%if(count==0){%>
					<!-- <div style="padding-left:50px;"><img style="border:0" src="assets/img/cart/empty_cart2.jpg" width="293" height="240"></div> -->
					 <div class="alert alert-warning"  align="center">
                   购物车是空的。
                   </div>
					<%}else{
					for(int i=0;i<count;i++){
					CartItem cartItem =list.get(i); 
					Double rate =1.00;
					String priceWithUnit ="";
					if("RMB".equals(cartItem.getCurrency())){
					rate =1.00;
					}else if("USD".equals(cartItem.getCurrency())){
					rate =6.00;
					}
					priceWithUnit=cartItem.getPrice()*rate*cartItem.getAmount()+"元";
			%><li><a href="goods_detail.do"><img src="<%=cartItem.getImgUrl()%>" alt="<%=cartItem.getGoodsName()%>"
			width="37" height="34"> </a> 
			<span class="cart-content-count">x<%=cartItem.getAmount()%></span>
			<strong><a href="goods_detail.do?goodsId=<%=cartItem.getGoodsId()%>"><%=cartItem.getGoodsName()%></a> </strong>
			 <em><%=priceWithUnit%></em>
			<span ><a  href="#" onclick="deleteItem('<%=cartItem.getGoodsId()%>')"  style="color:#595f65;">删除</a></span>
			</li><%}} %>
					</ul>
					<%if(count!=0){%><div class="text-right">
						<a href="shopping_cart.do" class="btn btn-default">查看购物车</a> 
						<a href="shopping_cart.do" class="btn btn-primary">去结算</a>
					</div><%} %>
				</div>
			</div>
			<!-- END CART CONTENT -->
		</div>
		<!-- END CART -->
<script type="text/javascript">
  function deleteItem(goodsId){
  $.ajax({
        url:"common_part/deleteItem.do",
        data:{
        goodsId:goodsId,
        },
       type:"POST",
      //  dataType : 'json',
        success: function(data){
        $("#cart-info").load("common_part/add_to_cart.do");
            }, error:function(){
           alert("aaaaa");
            }
        });
  }
</script>
		