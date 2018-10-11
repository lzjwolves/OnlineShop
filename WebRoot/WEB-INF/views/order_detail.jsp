<%@ page language="java" import="java.util.*,com.base.pojo.order.*"
	pageEncoding="utf-8"%>
<%
	Integer count = 0;
	List<OrderDetailInfo> list = (List) request.getAttribute("orderDetailInfoList");
	if (list != null) {
		count = list.size();
	}
%>
<div class="table-wrapper-responsive">
	<table summary="Shopping cart" class="table">
		<thead>
			<tr>
				<th class="shopping-cart-quantity"  colspan="2">描述</th>
				<th class="shopping-cart-quantity">商品编号</th>
				<th class="shopping-cart-quantity">单价</th>
				<th class="shopping-cart-total" colspan="2">价格</th>
			</tr>
			<%for(int i=0;i<count;i++){
				  OrderDetailInfo cartItem =list.get(i);
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
				  <tr>
				  <td class="shopping-cart-quantity">
				  <a href="#"  style="color:#333"><img src="<%=cartItem.getImgUrl()%>" alt="<%=cartItem.getGoodsName()%>"  width="37"  height="34" >
				  <span class="cart-content-count">x<%=cartItem.getAmount()%></span></a>
				  </td>
				  <td class="shopping-cart-description">
                      <p><a href="#" style="color:#333"><%=cartItem.getGoodsName()%></a></p>
                    </td>
                    <td class="shopping-cart-ref-no">
                      <%=cartItem.getGoodsId()%>
                    </td>
                    <td class="shopping-cart-price">
                      <%=unitPrice+"元"%>
                    </td>
                    <td class="shopping-cart-total">
                      <%=price+"元"%>
                    </td>
                  </tr>
				 <%} %>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>