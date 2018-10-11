<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>


<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
<meta charset="utf-8">
<title>注册 | 购物袋</title>

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
				<li class="active">注册</li>
			</ul>
			<!-- BEGIN SIDEBAR & CONTENT -->
			<div class="row margin-bottom-40">
				<!-- BEGIN SIDEBAR -->
				<div id="right_sidebar"></div>
				<!-- END SIDEBAR -->

				<!-- BEGIN CONTENT -->
				<div class="col-md-9 col-sm-9">
					<h1>新用户注册</h1>
					<div class="content-form-page">
						<div class="row">
							<div class="col-md-7 col-sm-7">
								<form class="form-horizontal" role="form"
									action="registerCrf.do" method="post" id="registerForm"
									onsubmit="return register();">
									<fieldset>
										<legend>个人信息</legend>
										<div class="form-group">
											<label for="username" class="col-lg-4 control-label">手机号/邮箱
												<span class="require">*</span> </label>
											<div class="col-lg-8">
												<input type="text" class="form-control" name="username"
													onblur="checkAccount(this.value);">
												<p style="display:none" class="form-control" id="username">
													<font color="red">请输入正确的手机号或邮箱</font>
												</p>
											</div>
										</div>
									</fieldset>
									<fieldset>
										<legend>密码</legend>
										<div class="form-group">
											<label for="password" class="col-lg-4 control-label">密码
												<span class="require">*</span> </label>
											<div class="col-lg-8">
												<input type="password" class="form-control" name="password"
													id="password" onblur="checkPassword(this.value);">
												<p style="display:none" class="form-control"
													id="passwordError">
													<font color="red">密码必须为数字+字母组合，长度6~20位</font>
											</div>
										</div>
										<div class="form-group">
											<label for="confirm-password" class="col-lg-4 control-label">确认密码
												<span class="require">*</span> </label>
											<div class="col-lg-8">
												<input type="password" class="form-control" id="rePassword"
													onblur="checkRePwd(this.value);">
												<p style="display:none" class="form-control" id="rePwd">
													<font color="red">两次密码输入不一致</font>
											</div>
										</div>
									</fieldset>
									<fieldset>
										<legend>验证码</legend>
										<div class="form-group">
											<label for="checkCode" class="col-lg-4 control-label">验证码
												<span class="require">*</span> </label>
											<div class="col-lg-8">
												<input type="text" class="form-control" id="checkCode">
											</div>
										</div>
										<div class="form-group">
											<label for="checkCode" class="col-lg-4 control-label"></label>
											<div class="col-lg-8">
												<img src="assets/img/checkCode/okjzr.png" alt="okjzr">
											</div>
										</div>
									</fieldset>
									<fieldset>
										<legend>隐私声明</legend>
										<div class="checkbox form-group">
											<label>
												<div class="col-lg-4 col-sm-4">我已阅读并同意条款</div>
												<div class="col-lg-8 col-sm-8">
													<input type="checkbox" checked id="agree">
												</div> </label>
										</div>
									</fieldset>
									<div class="row">
										<div
											class="col-lg-8 col-md-offset-4 padding-left-0 padding-top-20">
											<p style="display:none" class="form-control"
												id="registerError">
												<font color="red">信息填写有误</font>
											</p>
											<input type="submit" class="btn btn-primary" value="注册" /> <input
												type="button" class="btn btn-default"
												onclick="history.go(-1);" value="返回" />
										</div>
									</div>
								</form>
							</div>
							<div id="infomation_note"></div>
						</div>
					</div>
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
		var accValid = false;
		var pwdValid = false;
		var rePwdValid = false;
		var codeValid = true;
		var agreeValid = false;
		jQuery(document).ready(function() {
			$("#headerpage").load("common_part/header.do");
			$("#footerpage").load("common_part/footer.do");
            $("#right_sidebar").load("common_part/right_sidebar.do");
            $("#infomation_note").load("common_part/infomation_note.do");
			App.init();
			App.initUniform();
			App.initBxSlider();
		});
		//检查账号
		function checkAccount(str) {
			document.getElementById('registerError').style.display = "none";
			if (str.indexOf("@") == -1) {
				var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
				if (!myreg.test(str)) {
					accValid = false;
					document.getElementById('username').style.display = "";
				} else {
					accValid = true;
					document.getElementById('username').style.display = "none";
				}
			} else {
				var myreg2 = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
				if (!myreg2.test(str)) {
					accValid = false;
					document.getElementById('username').style.display = "";
				} else {
					accValid = true;
					document.getElementById('username').style.display = "none";
				}
			}
		}
		//检查密码
		function checkPassword(str) {
			document.getElementById('registerError').style.display = "none";
			var myreg = /^(?!([a-zA-Z]+|\d+)$)[a-zA-Z\d]{6,20}$/;
			if (!myreg.test(str)) {
				pwdValid = false;
				document.getElementById('passwordError').style.display = "";
				if (document.getElementById('rePassword').value != ''
						&& document.getElementById('rePassword').value != str) {
					rePwdValid = false;
					document.getElementById('rePwd').style.display = "";
				}
			} else {
				pwdValid = true;
				document.getElementById('passwordError').style.display = "none";
				if (document.getElementById('rePassword').value != ''
						&& document.getElementById('rePassword').value != str) {
					rePwdValid = false;
					document.getElementById('rePwd').style.display = "";
				}
			}
		}
		//检查二次密码是否一致
		function checkRePwd(str) {
			document.getElementById('registerError').style.display = "none";
			if (str != document.getElementById('password').value) {
				rePwdValid = false;
				document.getElementById('rePwd').style.display = "";
			} else {
				rePwdValid = true;
				document.getElementById('rePwd').style.display = "none";
			}
		}
		//提交注册
		function register() {
			agreeValid = document.getElementById('agree').checked;
			if (!accValid || !pwdValid || !rePwdValid || !codeValid
					|| !agreeValid) {
				document.getElementById('registerError').style.display = "";
				return false;
			} else {
				return true;
			}
		}
	</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>