<%@page import="com.pythonchip.model.MemberDTO"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.pythonchip.model.StoreDAO"%>
<%@page import="com.pythonchip.model.StoreDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--store-->
<!DOCTYPE html>
<html lang="en">

<head>
<title>Map Search</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/themify/themify-icons.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/lightbox2/css/lightbox.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
bg-title-page {
	min-height: 0px !important;
	height: 0px;
}

html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

.map_wrap {
	position: relative;
	overflow: hidden;
	width: 100%;
	height: 100%;
}

.radius_border {
	border: 1px solid #919191;
	border-radius: 5px;
}

.custom_typecontrol {
	position: absolute;
	top: 10px;
	right: 10px;
	overflow: hidden;
	width: 130px;
	height: 30px;
	margin: 0;
	padding: 0;
	z-index: 1;
	font-size: 12px;
	font-family: 'Malgun Gothic', '?????? ??????', sans-serif;
}

.custom_typecontrol span {
	display: block;
	width: 65px;
	height: 30px;
	float: left;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
}

.custom_typecontrol .btn {
	background: #fff;
	background: linear-gradient(#fff, #E6E6E6);
}

.custom_typecontrol .btn:hover {
	background: #F5F5F5;
	background: linear-gradient(#F5F5F5, #E3E3E3);
}

.custom_typecontrol .btn:active {
	background: #E6E6E6;
	background: linear-gradient(#E6E6E6, #fff);
}

.custom_typecontrol .selected_btn {
	color: #fff;
	background: #425470;
	background: linear-gradient(#425470, #5B6D8A);
}

.custom_typecontrol .selected_btn:hover {
	color: #fff;
}

.custom_zoomcontrol {
	position: absolute;
	top: 50px;
	right: 10px;
	width: 36px;
	height: 80px;
	overflow: hidden;
	z-index: 1;
	background-color: #F5F5F5;
}

.custom_zoomcontrol span {
	display: block;
	width: 36px;
	height: 40px;
	text-align: center;
	cursor: pointer;
}

.custom_zoomcontrol span img {
	width: 15px;
	height: 15px;
	padding: 12px 0;
	border: none;
}

.custom_zoomcontrol span:first-child {
	border-bottom: 1px solid #BFBFBF;
}

/* ????????? ???????????? css */
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '??????', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}

.kakaomap {
	
}

.map_wrap {
	padding: 0px 0.5em;
	height: 960px;
}

#custom_map_controller {
	top: 0px;
	right: 0px;
	background-color: white;
	position: absolute;
	width: 428px;
	height: inherit;
	z-index: 1;
	border: solid 0.18em;
}

ul, li {
	list-style: none;
}

.tab {
	width: inherit;
	height: inherit;
}

.tabnav {
	font-size: 0;
	width: 600px;
}

.tabnav li {
	display: inline-block;
	height: 46px;
	text-align: center;
	border-right: 1px solid #ddd;
}

.tabnav li a:before {
	content: "";
	position: absolute;
	left: 0;
	top: 0px;
	width: 100%;
	height: 3px;
}

.tabnav li a.active:before {
	background: #7ea21e;
}

.tabnav li a.active {
	border-bottom: 1px solid #fff;
}

.tabnav li a {
	position: relative;
	display: block;
	background: #f8f8f8;
	color: #000;
	padding: 0 55px;
	line-height: 46px;
	text-decoration: none;
	font-size: 16px;
}

.tabnav li a:hover, .tabnav li a.active {
	background: #fff;
	color: #7ea21e;
}

.tabcontent {
	border: 1px solid #ddd;
	border-top: none;
	width: inherit;
	height: 95%;
}

#placesList {
	width: inherit;
	height: 86%;
	overflow-y: scroll;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

#tab01 {
	font-size: 20px;
    text-align: center;
    font-family: 'Montserrat';
}

#tab02 {
	width: inherit;
	height: inherit;
}

.option {
	padding: 0em 5em;
}

#keyword {
	border: solid !important;
	border-radius: 0.6em;
}
</style>
</head>

<body class="animsition">
<%
	MemberDTO info = (MemberDTO) session.getAttribute("info");
	%>
	<!-- ????????? api -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2f8c752aae632b4c611274927d3bbb6a"></script>

	<!-- Header -->
	<header>
		<!-- Header desktop -->
		<div class="wrap-menu-header gradient1 trans-0-4">
			<div class="container h-full">
				<div class="wrap_header trans-0-3">
					<!-- ?????? -->
					<div class="logo">
					<a href="Home.jsp"> <img src="images/logo2.png"
							alt="IMG-LOGO" data-logofixed="images/logo2.png">
						</a>
					</div>

					<!-- ?????? ?????????-->
					<div class="wrap_menu p-l-45 p-l-0-xl">
						<nav class="menu">
							<ul class="main_menu">
								<li><a href="Home.jsp">Home</a></li>

								<li><a href="MapSearch.jsp">map search</a></li>

								<li><a href="Store.jsp">store</a></li>

								<li><a href="BoardMain.jsp">Community</a></li>

								<li><a href="JoinStore.jsp">store join</a></li>


							</ul>
						</nav>
					</div>

					<!-- ?????? ?????????, ???????????? -->
					<div class="social flex-w flex-l-m p-r-20">
						<li>
							<!--  ????????? ????????? ??????! --> <%
						 if (info != null) {
						 %> <a href="./Mypage.jsp" style="padding-right: 20px;">
														MyPage </a>
						<li><a href="LogoutService.do" style="padding-left: 20px;">
								Logout </a></li>

						<%
						} else {
						%>
						<a href="Login.jsp" style="padding-right: 20px;"> login </a>
						<li><a href="Join.jsp" style="padding-left: 20px;"> join
						</a></li>
						<%
						}
						%>
						</li>


						<button class="btn-show-sidebar m-l-33 trans-0-4"></button>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- ???????????? ??? -->
	<aside class="sidebar trans-0-4">
		<!-- Button Hide sidebar -->
		<button class="btn-hide-sidebar ti-close color0-hov trans-0-4"></button>


		<div class="gallery-sidebar t-center p-l-60 p-r-60 p-b-40">
			<ul class="menu-sidebar p-t-95 p-b-70">
				<div class="logo">
						<a href="Home.jsp"> <img src="images/logo.png" alt="IMG-LOGO"
							data-logofixed="images/logo.png"></a>
					</div>
				<ul class="menu-sidebar p-t-95 p-b-70">


					<li class="t-center m-b-13"><a href="MapSearch.jsp"
						class="txt19">map search</a></li>



					<li class="t-center m-b-13"><a href="Store.jsp" class="txt19">store</a>
					</li>

					<li class="t-center m-b-13"><a href="BoardMain.jsp"
						class="txt19">Community</a></li>

					<li class="t-center m-b-13"><a href="JoinStore.jsp"
						class="txt19">StoreJoin</a></li>
					<!--  ????????????????????? mypage ???????????? -->
					<%
					if (info != null) {
					%>
					<li class="t-center m-b-13"><a href="Mypage.jsp" class="txt19">my
							page</a></li>
					<%
					} else {
					%>
					<!-- ??????????????? ????????? -->
					<a href="Login.jsp"
						class="btn3 flex-c-m size13 txt11 trans-0-4 m-l-r-auto"> login
					</a>
					<%
					}
					%>

					<li class="t-center"></li>
				</ul>
	</aside>

	<!-- Title Page -->
	<section  class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15"
		style="background-image: url(images/????????????.JPG);">
		
		<h2 class="tit6 t-center">Map search</h2>
	</section>
	
	
	
	
	<!-- Gallery -->
	<div class="kakaomap" style="margin-left: 18em; margin-right: 18em;">
		<div class="bread-crumb bo5-b p-t-17 p-b-17">
			<div class="container">
				<a href="./Home.jsp" class="txt27"> Home  </a> <span
					class="txt29 m-l-10 m-r-10">/</span> <a href="blog.html"
					class="txt27"> Map search </a> 
			</div>
		</div>
		<form>
			<!-- 1. ????????? -->
			<input id=input type="text" maxlength="50"><br> <br>

		</form>
		<div class="map_wrap" radius=20%>
			<div id="map"
				style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
			<!-- ???????????? ????????? div ????????? -->
			<div class="custom_typecontrol radius_border">
				<span id="btnRoadmap" class="selected_btn"
					onclick="setMapType('roadmap')">??????</span> <span id="btnSkyview"
					class="btn" onclick="setMapType('skyview')">????????????</span>
			</div>
			<!-- ?????? ??????, ?????? ????????? div ????????? -->
			<div class="custom_zoomcontrol radius_border">
				<span onclick="zoomIn()"><img
					src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png"
					alt="??????"></span> <span onclick="zoomOut()"><img
					src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png"
					alt="??????"></span>
			</div>


			<div id="custom_map_controller" >
				<div class="tab">
					<ul class="tabnav" >
						<li ><a href="#tab01" style="font-family:Montserrat; font-weight: bold;">???????????? ??????</a></li>
						<li ><a href="#tab02" style="font-family:Montserrat; font-weight: bold; ">???????????? ??????</a></li>
					</ul>
					<div class="tabcontent">
						<div id="tab01">

							<!-- 2. check box -->
							<br><br>
							<span>?????????</span> <input id=k1 type="checkbox" name="k1" value="?????????">
							<span>???</span> <input id=k2 type="checkbox" name="keyword" value="???">
							<span>?????????</span> <input id=k3 type="checkbox" name="keyword" value="?????????"> 
							<span>?????? </span><input id=k4 type="checkbox" name="keyword" value="??????">
							<span>??????</span>	<input id=k5 type="checkbox" name="keyword" value="??????"> <br>
							<span>????????????</span> <input id=k6 type="checkbox" name="keyword"	value="????????????">
							<span>?????????</span> <input id=k7				type="checkbox" name="keyword" value="?????????">
							 <span>?????????</span>				<input id=k8 type="checkbox" name="keyword" value="?????????">
							<span>??? </span> <input id=k9 type="checkbox" name="keyword"							value="???">
							 <span>??? </span><input id=k10 type="checkbox"				name="keyword" value="???"> <br> 
							 <span>?????????</span> <input			id=k11 type="checkbox" name="keyword" value="?????????">
							 <span>?????????</span>		<input id=k12 type="checkbox" name="keyword" value="?????????">
							 <span>??????</span> <input id=k13 type="checkbox" name="keyword"		value="??????"> 
							 <span>??????</span> <input id=k14		type="checkbox" name="keyword" value="??????">
							 <span>??????</span>		<input id=k15 type="checkbox" name="keyword" value="??????">
							<span>??????</span> <input id=k16 type="checkbox" name="keyword"value="??????">
						</div>
						<div id="tab02">
							<div class="option">
								<div>
									<form class="formSearch"
										onsubmit="searchPlaces();return false;">
										????????? ??? <input type="text" placeholder="???????????? ??????????????????" id="keyword" size="18">
										<button type="submit">????????????</button>
									</form>
								</div>
							</div>
							<hr>
							<ul id="placesList"></ul>
							<div id="pagination"></div>
						</div>
					</div>
				</div>
				<!--tab-->



			</div>
			<%

			%>
			<%
			ArrayList<StoreDTO> arr = new StoreDAO().getStoreList();
			Gson gson = new Gson();
			String json = gson.toJson(arr);
			System.out.println(json);
			%>

			<script>
	var arr2 = <%=json%>; <!-- ????????? ????????? ???????????????????????? ?????? ??? ??? ?????? ?????? ?????????????????????. -->
	
	let keyword = []; <!-- ???????????? ????????? ???????????? ?????? ???????????????. -->
	let arr3 = []; <!-- ???????????? ????????? ???????????? ???????????? ????????? ???????????? ?????? ???????????????. -->

	<!-- ????????? ????????? ????????? ????????? ????????? ?????? ?????? ??????????????? -->
	let overlays = [];
	let markers=[];
	
	<!-- ??????, ?????? -->
	let positions = [];
	let latlng =[];
	
	let selectOverlay = null;
	let selectMarker =null;
	
	</script>
			<!--  kakao open api ?????? -->
			<!-- ????????? ?????? script -->
			<script>
		let mapContainer = document.getElementById('map'), // ????????? ????????? div
		mapOption = {
			center : new kakao.maps.LatLng(35.16017229999956, 126.84807380000012),
			// ????????? ????????????(???????????????)
			level : 7
		// ????????? ?????? ??????
		};
		let map = new kakao.maps.Map(mapContainer, mapOption);

	    mapContainer.style.height = '1000px'; 
	    map.relayout();
	    
	    
	</script>


			<!-- ?????? ?????? ????????? ?????? -->
			<p>
				<button onclick="setBounds()">?????? ?????? ????????? ??????</button>
			</p>
			<script>
	//????????? ???????????? ??????????????? ????????? ?????? LatLngBounds ????????? ???????????????
	let bounds = new kakao.maps.LatLngBounds();
	function setBounds() {
	for (var i = 0; i < arr3.length; i++) {
	    // LatLngBounds ????????? ????????? ???????????????
	    bounds.extend(new kakao.maps.LatLng(arr3[i].store_x, arr3[i].store_y));
	}
	    // LatLngBounds ????????? ????????? ???????????? ???????????? ????????? ????????? ??????????????????
	    // ?????? ????????? ??????????????? ????????? ????????? ??? ????????????
	    map.setBounds(bounds);
	}
</script>
		</div>


<br><br><br><br><br><br><br><br>		
		<!-- Footer -->
		<footer class="bg1">
			<div class="container p-t-40 p-b-70">
				<div class="row">
					<div class="col-sm-6 col-md-4 p-t-50">
						<!-- - -->
						<h4 class="txt13 m-b-33">Contact Us</h4>

						<ul class="m-b-70">
							<li class="txt14 m-b-14"><i
								class="fa fa-map-marker fs-16 dis-inline-block size19"
								aria-hidden="true"></i> 8th floor, 379 Hudson St, New York, NY
								10018</li>

							<li class="txt14 m-b-14"><i
								class="fa fa-phone fs-16 dis-inline-block size19"
								aria-hidden="true"></i> (+1) 96 716 6879</li>

							<li class="txt14 m-b-14"><i
								class="fa fa-envelope fs-13 dis-inline-block size19"
								aria-hidden="true"></i> contact@site.com</li>
						</ul>

						<!-- - -->
						<h4 class="txt13 m-b-32">Opening Times</h4>

						<ul>
							<li class="txt14">09:30 AM ??? 11:00 PM</li>

							<li class="txt14">Every Day</li>
						</ul>
					</div>

					<div class="col-sm-6 col-md-4 p-t-50">
						<!-- - -->
						<h4 class="txt13 m-b-33">Latest twitter</h4>

						<div class="m-b-25">
							<span class="fs-13 color2 m-r-5"> <i class="fa fa-twitter"
								aria-hidden="true"></i>
							</span> <a href="#" class="txt15"> @colorlib </a>

							<p class="txt14 m-b-18">
								Activello is a good option. It has a slider built into that
								displays the featured image in the slider. <a href="#"
									class="txt15"> https://buff.ly/2zaSfAQ </a>
							</p>

							<span class="txt16"> 21 Dec 2017 </span>
						</div>

						<div>
							<span class="fs-13 color2 m-r-5"> <i class="fa fa-twitter"
								aria-hidden="true"></i>
							</span> <a href="#" class="txt15"> @colorlib </a>

							<p class="txt14 m-b-18">
								Activello is a good option. It has a slider built into that
								displays <a href="#" class="txt15"> https://buff.ly/2zaSfAQ
								</a>
							</p>

							<span class="txt16"> 21 Dec 2017 </span>
						</div>
					</div>

					<div class="col-sm-6 col-md-4 p-t-50">
						<!-- - -->
						<h4 class="txt13 m-b-38">Gallery</h4>

						<!-- Gallery footer -->
						<div class="wrap-gallery-footer flex-w">
							<a class="item-gallery-footer wrap-pic-w"
								href="images/photo-gallery-01.jpg"
								data-lightbox="gallery-footer"> <img
								src="images/photo-gallery-thumb-01.jpg" alt="GALLERY">
							</a> <a class="item-gallery-footer wrap-pic-w"
								href="images/photo-gallery-02.jpg"
								data-lightbox="gallery-footer"> <img
								src="images/photo-gallery-thumb-02.jpg" alt="GALLERY">
							</a> <a class="item-gallery-footer wrap-pic-w"
								href="images/photo-gallery-03.jpg"
								data-lightbox="gallery-footer"> <img
								src="images/photo-gallery-thumb-03.jpg" alt="GALLERY">
							</a> <a class="item-gallery-footer wrap-pic-w"
								href="images/photo-gallery-04.jpg"
								data-lightbox="gallery-footer"> <img
								src="images/photo-gallery-thumb-04.jpg" alt="GALLERY">
							</a> <a class="item-gallery-footer wrap-pic-w"
								href="images/photo-gallery-05.jpg"
								data-lightbox="gallery-footer"> <img
								src="images/photo-gallery-thumb-05.jpg" alt="GALLERY">
							</a> <a class="item-gallery-footer wrap-pic-w"
								href="images/photo-gallery-06.jpg"
								data-lightbox="gallery-footer"> <img
								src="images/photo-gallery-thumb-06.jpg" alt="GALLERY">
							</a> <a class="item-gallery-footer wrap-pic-w"
								href="images/photo-gallery-07.jpg"
								data-lightbox="gallery-footer"> <img
								src="images/photo-gallery-thumb-07.jpg" alt="GALLERY">
							</a> <a class="item-gallery-footer wrap-pic-w"
								href="images/photo-gallery-08.jpg"
								data-lightbox="gallery-footer"> <img
								src="images/photo-gallery-thumb-08.jpg" alt="GALLERY">
							</a> <a class="item-gallery-footer wrap-pic-w"
								href="images/photo-gallery-09.jpg"
								data-lightbox="gallery-footer"> <img
								src="images/photo-gallery-thumb-09.jpg" alt="GALLERY">
							</a> <a class="item-gallery-footer wrap-pic-w"
								href="images/photo-gallery-10.jpg"
								data-lightbox="gallery-footer"> <img
								src="images/photo-gallery-thumb-10.jpg" alt="GALLERY">
							</a> <a class="item-gallery-footer wrap-pic-w"
								href="images/photo-gallery-11.jpg"
								data-lightbox="gallery-footer"> <img
								src="images/photo-gallery-thumb-11.jpg" alt="GALLERY">
							</a> <a class="item-gallery-footer wrap-pic-w"
								href="images/photo-gallery-12.jpg"
								data-lightbox="gallery-footer"> <img
								src="images/photo-gallery-thumb-12.jpg" alt="GALLERY">
							</a>
						</div>

					</div>
				</div>
			</div>

			<div class="end-footer bg2">
				<div class="container">
					<div class="flex-sb-m flex-w p-t-22 p-b-22">
						<div class="p-t-5 p-b-5">
							<a href="#" class="fs-15 c-white"><i
								class="fa fa-tripadvisor" aria-hidden="true"></i></a> <a href="#"
								class="fs-15 c-white"><i class="fa fa-facebook m-l-18"
								aria-hidden="true"></i></a> <a href="#" class="fs-15 c-white"><i
								class="fa fa-twitter m-l-18" aria-hidden="true"></i></a>
						</div>

						<div class="txt17 p-r-20 p-t-5 p-b-5">
							Copyright &copy; 2018 All rights reserved | This template is made
							with <i class="fa fa-heart"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
						</div>
					</div>
				</div>
			</div>
		</footer>


		<!-- Back to top -->
		<div class="btn-back-to-top bg0-hov" id="myBtn">
			<span class="symbol-btn-back-to-top"> <i
				class="fa fa-angle-double-up" aria-hidden="true"></i>
			</span>
		</div>



		<!--===============================================================================================-->
		<script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
		<!--===============================================================================================-->
		<script type="text/javascript"
			src="vendor/animsition/js/animsition.min.js"></script>
		<!--===============================================================================================-->
		<script type="text/javascript" src="vendor/bootstrap/js/popper.js"></script>
		<script type="text/javascript"
			src="vendor/bootstrap/js/bootstrap.min.js"></script>
		<!--===============================================================================================-->
		<script type="text/javascript" src="vendor/select2/select2.min.js"></script>
		<!--===============================================================================================-->
		<script type="text/javascript"
			src="vendor/daterangepicker/moment.min.js"></script>
		<script type="text/javascript"
			src="vendor/daterangepicker/daterangepicker.js"></script>
		<!--===============================================================================================-->
		<script type="text/javascript" src="vendor/slick/slick.min.js"></script>
		<script type="text/javascript" src="js/slick-custom.js"></script>
		<!--===============================================================================================-->
		<script type="text/javascript" src="vendor/parallax100/parallax100.js"></script>
		<script type="text/javascript">
        $('.parallax100').parallax100();
    </script>
		<!--===============================================================================================-->
		<script type="text/javascript"
			src="vendor/countdowntime/countdowntime.js"></script>
		<!--===============================================================================================-->
		<script type="text/javascript"
			src="vendor/lightbox2/js/lightbox.min.js"></script>
		<!--===============================================================================================-->
		<script type="text/javascript"
			src="vendor/isotope/isotope.pkgd.min.js"></script>
		<!--===============================================================================================-->
		<script type="text/javascript" src="js/main.js"></script>
		<script type="text/javascript" src="js/mapMain.js"></script>


		<!-- <script type="text/javascript" src="js/keyWordSearch"></script> -->

		<script>

$('.bg-title-page').css({'min-height':??'0px'})
$('.bg-title-page').css({'height':??'0px'})

$(function(){
  $('.tabcontent > div').hide();
  $('.tabnav a').click(function () {
    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
    $('.tabnav a').removeClass('active');
    $(this).addClass('active');
    return false;
  }).filter(':eq(0)').click();
  });
$('.formSearch').attr("onsubmit", "searchPlaces(); return false;");


//?????? ?????? ????????? ???????????????
//let ps = new kakao.maps.services.Places();
//?????? ?????? ???????????? ????????? ???????????? ??? ???????????? ????????? ?????????????????? ???????????????
let infowindow = new kakao.maps.InfoWindow({zIndex:1});

//???????????? ????????? ???????????????
//searchPlaces();
//????????? ????????? ???????????? ???????????????
function searchPlaces() {
	console.log('searchPlaces')
 var searchkeyword = document.getElementById('keyword').value;

 if (!searchkeyword.replace(/^\s+|\s+$/g, '')) {
     alert('???????????? ??????????????????!');
     return false;
 }
 
 // ???????????? ????????? ?????? ???????????? ??????????????? ???????????????
 var url = "http://localhost:8081/pythonchip/SearchStoreAjax";

 $.ajax({
     type:"GET",
     url:url,
     dataType:"json",
     data:{
         keyword : searchkeyword,
     },
     success : function(d){
         placesSearchCB(d)

     },
     error : function(request,status,error){

         console.log(error);

     }
 })
}

//??????????????? ???????????? ??? ???????????? ???????????? ?????????
function placesSearchCB(data) {

     // ??????????????? ????????? ???????????????
     // ?????? ????????? ????????? ???????????????
     console.log(data)
     if(data.length > 0){
     slice = data.slice(0,15)
     console.log(slice)
     displayPlaces(slice);
     // ????????? ????????? ???????????????

     //pagination
     last = Math.ceil(data.length/15)
     pagination={
         current :0,
         first:1,
         gotoFirst : function(){},
         gotoLast : function(){},
         gotoPage : function(idx){
             slice = data.slice(0+((idx-1)*15),15*(idx-1)+15)
             displayPlaces(slice);
             console.log(idx)
             console.log(data)
         },
         hasNextPage : true,
         hasPrevPage : false,
         last : last,
         nextPage : function(){},
         perPage: 15,
         prevPage : function(){},
         totalCount: data.length
     }
     console.log(pagination)
     displayPagination(pagination);
 }else
 {
     alert('?????? ?????? : 0 ')
 }
}

//?????? ?????? ????????? ????????? ???????????? ???????????????
function displayPlaces(places) {

 var listEl = document.getElementById('placesList'), 
 menuEl = document.getElementById('tab02'),

 fragment = document.createDocumentFragment(), 
 bounds = new kakao.maps.LatLngBounds(), 
 listStr = '';
 
 // ?????? ?????? ????????? ????????? ???????????? ???????????????
 removeAllChildNods(listEl);

 // ????????? ???????????? ?????? ????????? ???????????????
 removeMarker();
 
 for ( var i=0; i<places.length; i++ ) {

     // ????????? ???????????? ????????? ???????????????
     var placePosition = new kakao.maps.LatLng(places[i].store_x, places[i].store_y),
         marker = addMarker(placePosition, i, places.store_name), 
         itemEl = getListItem(i, places[i]); // ?????? ?????? ?????? Element??? ???????????????

     // ????????? ?????? ????????? ???????????? ?????? ????????? ?????????????????????
     // LatLngBounds ????????? ????????? ???????????????
     bounds.extend(placePosition);

     // ????????? ???????????? ????????? mouseover ?????????
     // ?????? ????????? ?????????????????? ???????????? ???????????????
     // mouseout ?????? ?????? ?????????????????? ????????????
     (function(marker, title) {
         kakao.maps.event.addListener(marker, 'mouseover', function() {
             displayInfowindow(marker, title);
         });

         kakao.maps.event.addListener(marker, 'mouseout', function() {
             infowindow.close();
         });

         itemEl.onmouseover =  function () {
             displayInfowindow(marker, title);
         };

         itemEl.onmouseout =  function () {
             infowindow.close();
         };
     })(marker, places[i].store_name);

     fragment.appendChild(itemEl);
 }

 // ???????????? ???????????? ???????????? ?????? Element??? ???????????????
 listEl.appendChild(fragment);
 menuEl.scrollTop = 0;

 // ????????? ?????? ????????? ???????????? ?????? ????????? ??????????????????
 map.setBounds(bounds);
}

//???????????? ????????? Element??? ???????????? ???????????????
function getListItem(index, places) {

 var hrefStr= "http://localhost:8081/pythonchip/DetailStore.jsp?store_seq="+places.store_seq;

 var el = document.createElement('li'),
 itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
             '<div class="info">' +
             '   <h5><a href='+hrefStr+' > ' + places.store_name+ '</a></h5>';

 if (places.location_dong) {
     itemStr += '    <span>' + places.location_dong + places.location_gu + '</span>';
 } else {
     itemStr += '    <span>' +  places.address_name  + '</span>'; 
 }
              
   itemStr += '  <span class="tel">' + places.store_tel  + '</span>' +
             '</div>';           

 el.innerHTML = itemStr;
 el.className = 'item';

 return el;
}

//????????? ???????????? ?????? ?????? ????????? ???????????? ???????????????
function addMarker(position, idx, title) {
 var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // ?????? ????????? url, ??????????????? ???????????? ?????????
     imageSize = new kakao.maps.Size(36, 37),  // ?????? ???????????? ??????
     imgOptions =  {
         spriteSize : new kakao.maps.Size(36, 691), // ??????????????? ???????????? ??????
         spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // ??????????????? ????????? ??? ????????? ????????? ????????? ??????
         offset: new kakao.maps.Point(13, 37) // ?????? ????????? ???????????? ????????? ???????????? ??????
     },
     markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
         marker = new kakao.maps.Marker({
         position: position, // ????????? ??????
         image: markerImage 
     });

 marker.setMap(map); // ?????? ?????? ????????? ???????????????
 markers.push(marker);  // ????????? ????????? ????????? ???????????????

 return marker;
}

//?????? ?????? ???????????? ?????? ????????? ?????? ???????????????
function removeMarker() {
 for ( var i = 0; i < markers.length; i++ ) {
     markers[i].setMap(null);
 }   
 markers = [];
}

//???????????? ?????? ????????? ?????????????????? ????????? ???????????????
function displayPagination(pagination) {
 var paginationEl = document.getElementById('pagination'),
     fragment = document.createDocumentFragment(),
     i; 

 // ????????? ????????? ?????????????????? ???????????????
 while (paginationEl.hasChildNodes()) {
     paginationEl.removeChild (paginationEl.lastChild);
 }

 for (i=1; i<=pagination.last; i++) {
     var el = document.createElement('a');
     el.href = "#";
     el.innerHTML = i;

     if (i===pagination.current) {
         el.className = 'on';
     } else {
         el.onclick = (function(i) {
             return function() {
                 pagination.gotoPage(i);
             }
         })(i);
     }

     fragment.appendChild(el);
 }
 paginationEl.appendChild(fragment);
}
//???????????? ?????? ?????? ????????? ???????????? ??? ???????????? ???????????????
//?????????????????? ???????????? ???????????????
function displayInfowindow(marker, title) {
 var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

 infowindow.setContent(content);
 infowindow.open(map, marker);
}

// ???????????? ????????? ?????? Element??? ???????????? ???????????????
function removeAllChildNods(el) {   
 while (el.hasChildNodes()) {
     el.removeChild (el.lastChild);
 }
}


</script>
</body>

</html>