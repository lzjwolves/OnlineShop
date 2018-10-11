package com.base.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.base.pojo.category.BrandItem;
import com.base.pojo.category.CategoryItem;
import com.base.pojo.user.UserAccountInfo;
import com.base.service.category.CategoryService;
import com.base.service.user.UserAccountInfoService;
import com.base.utils.validator.AccountValidatorUtil;

@Controller
public class HomeController {
	@Autowired
	private UserAccountInfoService userAccountInfoService;
	@Autowired
	private CategoryService categoryService;
	@RequestMapping(value = {"","/home.do","/index.do"}, method = RequestMethod.GET)
	public String home(HttpServletRequest request) {
		// HttpSession session = request.getSession(false);
		//System.out.println("home: "+session.getAttribute("username") );
		return "home";
	}

	@RequestMapping(value = "common_part/header.do", method = RequestMethod.GET)
	public String head(HttpServletRequest request, HttpServletResponse response) {
		// 加载购物车信息
		// to do
		String username = "";
		Boolean isValid = false;
		UserAccountInfo  u=AccountValidatorUtil.accAvalidate(request, userAccountInfoService);
		 if(u!=null){
			 //session里的密码已做过加密
			 username=u.getUserName() ;
			 userAccountInfoService.updateLoginRecord(username);
			isValid = true;
		 }
		// 加载商品类别信息
		List<CategoryItem> categoryList = categoryService.getCategory();
		// 加载商品商标信息
		List<BrandItem> brandList = categoryService.getBrands();
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("brandList", brandList);
		request.setAttribute("isValid", isValid);
		request.setAttribute("isSignIn", userAccountInfoService.isUserSignIn(username));
		return "common_part/header";
	}

	@RequestMapping(value = "common_part/footer.do", method = RequestMethod.GET)
	public String footer() {
		return "common_part/footer";
	}
	
	@RequestMapping(value = "common_part/right_sidebar.do", method = RequestMethod.GET)
	public String rightSidebar() {
		return "common_part/right_sidebar";
	}
	
	@RequestMapping(value = "common_part/infomation_note.do", method = RequestMethod.GET)
	public String infomationNote() {
		return "common_part/infomation_note";
	}
}