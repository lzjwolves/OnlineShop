package com.base.controller.address;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.base.pojo.address.AddressDetailInfo;
import com.base.pojo.user.UserAccountInfo;
import com.base.service.address.AddressInfoService;
import com.base.service.user.UserAccountInfoService;
import com.base.utils.validator.AccountValidatorUtil;

@Controller
public class AddressController {
	@Autowired
	private AddressInfoService addressInfoService;
	@Autowired
	private UserAccountInfoService userAccountInfoService;
	
	@RequestMapping(value = "address.do", method = RequestMethod.GET)
	public String address(HttpServletRequest request) {
		List<AddressDetailInfo> addressList =new ArrayList<AddressDetailInfo>();
		UserAccountInfo  u=AccountValidatorUtil.accAvalidate(request, userAccountInfoService);
		String username="";
		if(u!=null){
			 username=u.getUserName();
			 addressList=addressInfoService.getAddressListByUserName(username);	
		}else{
			System.out.println("addressController:用户尚未登录");
		}
		request.setAttribute("addressList", addressList);
		return "address";
	}
	@RequestMapping(value = "add_address.do", method = RequestMethod.POST)
	public String addAddress(HttpServletRequest request,String address,String recipient,String mobile,Integer isDefault) {
		UserAccountInfo  u=AccountValidatorUtil.accAvalidate(request, userAccountInfoService);
		if(u!=null){
             if(isDefault==1){//如果插入的是默认地址，将其他所有地址的isDefault都设为0
            	 AddressDetailInfo a2 =new AddressDetailInfo();
            	 Long id =0l;
				 a2.setId(id);
				 a2.setUserName(u.getUserName());
				 addressInfoService.changeDefaultAddress(a2); 
			 }
			 AddressDetailInfo a =new AddressDetailInfo();
			 a.setUserName(u.getUserName());
			 a.setRecipient(recipient);
			 a.setMobile(mobile);
			 a.setAddress(address);
			 a.setIsDefault(isDefault);
			 a.setCreateTime(new Date());
			 addressInfoService.insert(a);
		}else{
			System.out.println("addressController:用户尚未登录");
		}
		return "address";
	}
	@RequestMapping(value = "delete_address.do", method = RequestMethod.POST)
	public String deleteAddress(HttpServletRequest request,Long id) {
		UserAccountInfo  u=AccountValidatorUtil.accAvalidate(request, userAccountInfoService);
		if(u!=null){
			 AddressDetailInfo a =new AddressDetailInfo();
			 a.setUserName(u.getUserName());
			 a.setId(id);
			 addressInfoService.delete(a);
		}else{
			System.out.println("addressController:用户尚未登录");
		}
		return "address";
	}
	@RequestMapping(value = "update_address.do", method = RequestMethod.POST)
	public String updateAddress(HttpServletRequest request,Long id,Integer isDefault,String address,String recipient,String mobile) {
		UserAccountInfo  u=AccountValidatorUtil.accAvalidate(request, userAccountInfoService);
		if(u!=null){
			if(address!=null||recipient!=null||mobile!=null){
			AddressDetailInfo a1 =new AddressDetailInfo();
			 a1.setUserName(u.getUserName());
			 a1.setId(id);
			 a1.setAddress(address);
			 a1.setRecipient(recipient);
			 a1.setMobile(mobile);
			 a1.setIsDefault(isDefault);
			 addressInfoService.update(a1);
			 }
			 if(isDefault==1){
				 AddressDetailInfo a2 =new AddressDetailInfo();
				 a2.setId(id);
				 a2.setUserName(u.getUserName());
				 addressInfoService.changeDefaultAddress(a2);
			 }
		}else{
			System.out.println("addressController:用户尚未登录");
		}
		return "address";
	}
	
}
