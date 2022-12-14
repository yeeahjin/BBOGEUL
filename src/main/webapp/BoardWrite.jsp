<%@page import="com.pythonchip.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardWrite</title>
<meta charset="utf-8" />
<title>Contact</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.png" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/themify/themify-icons.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/lightbox2/css/lightbox.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!--===============================================================================================-->

</head>
<body class="animsition">
<%MemberDTO info = (MemberDTO) session.getAttribute("info");%>
    <!-- Header -->
    <header>
       <!-- Header desktop -->
		<div class="wrap-menu-header gradient1 trans-0-4">
			<div class="container h-full">
					<!-- ?????? -->
				<div class="wrap_header trans-0-3">
					<div class="logo" >
						<a href="Home.jsp" > <img  src="images/logo2.png" alt="IMG-LOGO" style="width:50%"
							data-logofixed="images/logo2.png" ></a>
					</div>

                    <!-- ?????? ?????????-->
                    <div class="wrap_menu p-l-45 p-l-0-xl">
                        <nav class="menu">
                            <ul class="main_menu">
                                <li>
                                    <a href="Home.jsp">Home</a>
                                </li>

                                <li>
                                    <a href="MapSearch.jsp">map search</a>
                                </li>

                                <li>
                                    <a href="Store.jsp">store</a>
                                </li>

                                <li>
                                    <a href="BoardMain.jsp">Community</a>
                                </li>

                                <li>
                                    <a href="JoinStore.jsp">store join</a>
                                </li>


                            </ul>
                        </nav>
                    </div>

                    <!-- ?????? ?????????, ???????????? -->
                    <div class="social flex-w flex-l-m p-r-20">
                     							<!--  ????????? ????????? ??????! --> <%
						 if (info != null) {
						 %> <a href="./Mypage.jsp" style="padding-right: 20px;"> MyPage
						</a>
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
            <!-- ??????????????? ??????  -->

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

					<li class="t-center m-b-13"><a href=" BoardMain.jsp"
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


    <!-- ?????? ????????? -->
    <section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(images/photo-gallery-thumb-08.jpg);">
        <h2 class="tit6 t-center">
            review
        </h2>
    </section>
<!--==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==  -->
<!-- ????????? ?????? ??? -->
	<div id="con">
		<div id="login">
			<div id="join_form">
				<form action="BoardService.do" method="post" enctype="multipart/form-data">
				
					<h3 class="login" style="letter-spacing: -1px;">??? ??????</h3>

					<hr>
					<label style="width:500px;"> ?????? <p style="font-color:gray;">*?????? ????????? ????????? ?????? ??? ?????????????????????* </p>
					<input id=filename type="file" name="filename" style="width:250px;">
					</label style="width:650px;"> <br><br><label> ??????
						<p style="text-align": left; font-size: 12px; color: #666></p> 
						<input type="text" placeholder="?????? ??????" name="title" class="size"
						maxlength="50" style="width: 420px;">
					</label><br> 
					<li><input type="hidden" name = "writer" value=<%=info.getId() %>></li>
					<label>
						<p style="text-align: left; font-size: 12px; color: #666">??????</p> 
						<textarea rows="10" name="content" type="text" class="size" style="width: 420px; height: 266px;"></textarea>
					</label>
					<p>
						<input type="reset" value="?????????" class="btn10">
						<input type="submit" value="????????????" class="btn10">
					</p>
					</form>
					
					
			</div>
		</div>
	</div>



	<!-- <div id = "board">
				<form action="BoardService.do" method="post" enctype="multipart/form-data">
		
				
				<table id="list">
					<tr>
						<td>??????</td>
						<td><input type="file" name="filename" > </td>
					</tr>
					<tr>
						<td>??????</td>
						<td><input type="text" name="title" > </td>
					</tr>
					<tr>
						<td>?????????</td>
						<td><input  type="text" name="writer"> </td>
					</tr>
					<tr>
						<td colspan="2">??????</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea  rows="10" name = "content" style="resize: none;"></textarea>			
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="reset" value="?????????">
							<input type="submit" value="????????????">
						</td>
					</tr>
				</table>
				</form>
			</div> -->
			
			
			
			
			
			
			
			
			
			
			
<!--==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==*==  -->			
			
            <!-- Back to top -->
            <div class="btn-back-to-top bg0-hov" id="myBtn">
                <span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
            </div>

            <!-- Container Selection1 -->
            <div id="dropDownSelect1"></div>



            <!--===============================================================================================-->
            <script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
            <!--===============================================================================================-->
            <script type="text/javascript" src="vendor/animsition/js/animsition.min.js"></script>
            <!--===============================================================================================-->
            <script type="text/javascript" src="vendor/bootstrap/js/popper.js"></script>
            <script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
            <!--===============================================================================================-->
            <script type="text/javascript" src="vendor/select2/select2.min.js"></script>
            <!--===============================================================================================-->
            <script type="text/javascript" src="vendor/daterangepicker/moment.min.js"></script>
            <script type="text/javascript" src="vendor/daterangepicker/daterangepicker.js"></script>
            <!--===============================================================================================-->
            <script type="text/javascript" src="vendor/slick/slick.min.js"></script>
            <script type="text/javascript" src="js/slick-custom.js"></script>
            <!--===============================================================================================-->
            <script type="text/javascript" src="vendor/parallax100/parallax100.js"></script>
            <script type="text/javascript">
                $('.parallax100').parallax100();
            </script>
            <!--===============================================================================================-->
            <script type="text/javascript" src="vendor/countdowntime/countdowntime.js"></script>
            <!--===============================================================================================-->
            <script type="text/javascript" src="vendor/lightbox2/js/lightbox.min.js"></script>
            <!--===============================================================================================-->
            <script src="js/main.js"></script>

</body>
</html>