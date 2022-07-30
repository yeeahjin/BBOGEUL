<!DOCTYPE html>
<html lang="en">

<head>
    <title>Gallery</title>
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

<style>

.keywordBtn{
    font-size: 2em;
    width: auto;
    height: 2em;
    background-color: black;
    margin-top: 0.25em;
}
#store_table{
margin-top: 40px;
text-align: center;
}
</style>

</head>

<body class="animsition">

    <!-- Header -->
    <header>
        <!-- Header desktop -->
        <div class="wrap-menu-header gradient1 trans-0-4">
            <div class="container h-full">
                <div class="wrap_header trans-0-3">
                    <!-- Logo -->
                    <div class="logo">
                        <a href="index.html">
                            <img src="images/icons/logo.png" alt="IMG-LOGO" data-logofixed="images/icons/logo2.png">
                        </a>
                    </div>

                    <!-- Menu -->
                    <div class="wrap_menu p-l-45 p-l-0-xl">
                        <nav class="menu">
                            <ul class="main_menu">
                                <li>
                                    <a href="index.html">Home</a>
                                </li>

                                <li>
                                    <a href="menu.html">map search</a>
                                </li>

                                <li>
                                    <a href="gallery.html">store</a>
                                </li>

                                <li>
                                    <a href="blog.html">comunity</a>
                                </li>

                                <li>
                                    <a href="storejoin.html">가게등록</a>
                                </li>

                            </ul>
                        </nav>
                    </div>
                    <!-- Social -->
                    <div class="social flex-w flex-l-m p-r-20">
                        <li>
                            <a href="contact.html">-login-</a>
                        </li>
                        <li>
                            <a href="join.html">-Join-</a>
                        </li>
                        <li>
                            <a href="storejoin.html">-가게등록-</a>
                        </li>

                        <button class="btn-show-sidebar m-l-33 trans-0-4"></button>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Sidebar -->
    <aside class="sidebar trans-0-4">
        <!-- Button Hide sidebar -->
        <button class="btn-hide-sidebar ti-close color0-hov trans-0-4"></button>


        <div class="gallery-sidebar t-center p-l-60 p-r-60 p-b-40">
            <!-- - -->
            <h4 class="txt20 m-b-33">
                my page
            </h4>
            <ul class="menu-sidebar p-t-95 p-b-70">
                <li class="t-center m-b-13">
                    <a href="index.html" class="txt19">Home</a>
                </li>

                <li class="t-center m-b-13">
                    <a href="회원가입수정.html" class="txt19">회원가입 수정</a>
                </li>



                <li class="t-center m-b-13">
                    <a href="about.html" class="txt19">즐겨찾기</a>
                </li>

                <li class="t-center m-b-13">
                    <a href="reservation.html" class="txt19">예약</a>
                </li>

                <li class="t-center m-b-33">
                    <a href="contact.html" class="txt19">review</a>
                </li>

                <li class="t-center">
                    <!-- Button3 -->
                    <a href="contact.html" class="btn3 flex-c-m size13 txt11 trans-0-4 m-l-r-auto">
					login
				</a>
                </li>
            </ul>

    </aside>


    <!-- Title Page -->
<section class="bg-title-page flex-c-m p-t-160 p-b-80 p-l-15 p-r-15" style="background-image: url(images/마들렌.png);min-height: 17em;">
            Gallery
        </h2>
    </section>



    <!-- Gallery -->
    
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="com.pythonchip.model.StoreDTO"%>
<%@page import="com.pythonchip.model.StoreDAO"%>
<div id="store_table" style="
    margin: 3.6em 10em;
">
	<div id="seachDIV" >
        <form onsubmit="return false;">
            <select class="selector" name="job" id="searchSelector" style="
            width: 100px;height: 2.5em;border-radius: 0.8em;
            " height="2.5em">
                <option value="name" selected>가게 이름</option>
                <option value="location">위치</option>
                <option value="menu">메뉴</option>
            </select>
          
            <input type="text" size="66em" id="searchinput" style="
                height: 2.5em;
    border: solid !important;
    margin-left: 0.1em;
    margin-right: 0.3em;
    border-radius: 0.7em;
    padding-left: 1em;
            ">
            <button id = "searchButton"
            style="    
    border: solid brown;
    width: 4.3em;
    height: 2.5em;
    border-style: groove;
    border-radius: 0.7em;"
            >검색</button>
            </form>
            
            </div>  
<div style="
    margin-left: 9em;
    margin-right: 9em;">
            <% String[] keywordArr = {"식혜","흑염소","양갱","막걸리","인절미","말차","흑임자","쑥"
                    ,"한방","미숫가루","떡","달고나","전통차","팥"};%>
            <% String[] btnClassArr = {"red","aqua","goldenrod","orangered","violet","purple","green","goldenrod","orangered"};%>
            <%
            int cnt=0;
            for(int i = 0; i<keywordArr.length; i++) {
            if(btnClassArr.length-1 <= cnt) {cnt = 0;
            %><!-- <br> --><%}%>
            <button type="button" style="background-color:<%=btnClassArr[cnt++]%>;" class="keywordBtn btn btn-outline-danger"><%=keywordArr[i]%></button>
            <%}%>
            
            </div>
            <div class="wrap-gallery isotope-grid flex-w p-l-25 p-r-25" id="insideStoreTable">
            
            <%
            ArrayList<StoreDTO> arr =  new StoreDAO().getStoreList();
            
            for(int i=0;i<arr.size();i++){%>
            
              <div class="item-gallery isotope-item bo-red-10 hov-img-zoom">

                  <!-- <img src="https://www.coffeebeankorea.com/data/menu/%EC%BD%9C%EB%93%9C%EB%B8%8C%EB%A3%A815_1.jpg" class="card-img-top" alt="...">
                   -->
                   <img src="images/photo-gallery-14.jpg" class="card-img-top" alt="...">
                  
                  <div class="overlay-item-gallery trans-0-10 flex-c-m">
                <a class="btn-show-gallery flex-c-m fa fa-search" href="https://www.coffeebeankorea.com/data/menu/%EC%BD%9C%EB%93%9C%EB%B8%8C%EB%A3%A815_1.jpg" data-lightbox="gallery"></a>
                </div>
                
                    <h5 class=""><%=arr.get(i).getStore_name() %></h5><br>
                    <p class=""> 주소 : <%=arr.get(i).getLocation_dong() %><%=arr.get(i).getLocation_gu() %></p>
                    <br><p class=""> tel : <%=arr.get(i).getStore_tel()%></p><br>
              </div>
            
            <%} %>
            </div>
            
            
            
    </div>

    <!-- Sign up -->
    <div class="section-signup bg1-pattern p-t-85 p-b-85">
        <form class="flex-c-m flex-w flex-col-c-m-lg p-l-5 p-r-5">
            <span class="txt5 m-10">
				Specials Sign up
			</span>

            <div class="wrap-input-signup size17 bo2 bo-rad-10 bgwhite pos-relative txt10 m-10">
                <input class="bo-rad-10 sizefull txt10 p-l-20" type="text" name="email-address" placeholder="Email Adrress">
                <i class="fa fa-envelope ab-r-m m-r-18" aria-hidden="true"></i>
            </div>

            <!-- Button3 -->
            <button type="submit" class="btn3 flex-c-m size18 txt11 trans-0-4 m-10">
				Sign-up
			</button>
        </form>
    </div>


    <!-- Footer -->
    <footer class="bg1">
        <div class="container p-t-40 p-b-70">
            <div class="row">
                <div class="col-sm-6 col-md-4 p-t-50">
                    <!-- - -->
                    <h4 class="txt13 m-b-33">
                        Contact Us
                    </h4>

                    <ul class="m-b-70">
                        <li class="txt14 m-b-14">
                            <i class="fa fa-map-marker fs-16 dis-inline-block size19" aria-hidden="true"></i> 8th floor, 379 Hudson St, New York, NY 10018
                        </li>

                        <li class="txt14 m-b-14">
                            <i class="fa fa-phone fs-16 dis-inline-block size19" aria-hidden="true"></i> (+1) 96 716 6879
                        </li>

                        <li class="txt14 m-b-14">
                            <i class="fa fa-envelope fs-13 dis-inline-block size19" aria-hidden="true"></i> contact@site.com
                        </li>
                    </ul>

                    <!-- - -->
                    <h4 class="txt13 m-b-32">
                        Opening Times
                    </h4>

                    <ul>
                        <li class="txt14">
                            09:30 AM – 11:00 PM
                        </li>

                        <li class="txt14">
                            Every Day
                        </li>
                    </ul>
                </div>

                <div class="col-sm-6 col-md-4 p-t-50">
                    <!-- - -->
                    <h4 class="txt13 m-b-33">
                        Latest twitter
                    </h4>

                    <div class="m-b-25">
                        <span class="fs-13 color2 m-r-5">
							<i class="fa fa-twitter" aria-hidden="true"></i>
						</span>
                        <a href="#" class="txt15">
							@colorlib
						</a>

                        <p class="txt14 m-b-18">
                            Activello is a good option. It has a slider built into that displays the featured image in the slider.
                            <a href="#" class="txt15">
								https://buff.ly/2zaSfAQ
							</a>
                        </p>

                        <span class="txt16">
							21 Dec 2017
						</span>
                    </div>

                    <div>
                        <span class="fs-13 color2 m-r-5">
							<i class="fa fa-twitter" aria-hidden="true"></i>
						</span>
                        <a href="#" class="txt15">
							@colorlib
						</a>

                        <p class="txt14 m-b-18">
                            Activello is a good option. It has a slider built into that displays
                            <a href="#" class="txt15">
								https://buff.ly/2zaSfAQ
							</a>
                        </p>

                        <span class="txt16">
							21 Dec 2017
						</span>
                    </div>
                </div>

                <div class="col-sm-6 col-md-4 p-t-50">
                    <!-- - -->
                    <h4 class="txt13 m-b-38">
                        Gallery
                    </h4>

                    <!-- Gallery footer -->
                    <div class="wrap-gallery-footer flex-w">
                        <a class="item-gallery-footer wrap-pic-w" href="images/photo-gallery-01.jpg" data-lightbox="gallery-footer">
                            <img src="images/photo-gallery-thumb-01.jpg" alt="GALLERY">
                        </a>

                        <a class="item-gallery-footer wrap-pic-w" href="images/photo-gallery-02.jpg" data-lightbox="gallery-footer">
                            <img src="images/photo-gallery-thumb-02.jpg" alt="GALLERY">
                        </a>

                        <a class="item-gallery-footer wrap-pic-w" href="images/photo-gallery-03.jpg" data-lightbox="gallery-footer">
                            <img src="images/photo-gallery-thumb-03.jpg" alt="GALLERY">
                        </a>

                        <a class="item-gallery-footer wrap-pic-w" href="images/photo-gallery-04.jpg" data-lightbox="gallery-footer">
                            <img src="images/photo-gallery-thumb-04.jpg" alt="GALLERY">
                        </a>

                        <a class="item-gallery-footer wrap-pic-w" href="images/photo-gallery-05.jpg" data-lightbox="gallery-footer">
                            <img src="images/photo-gallery-thumb-05.jpg" alt="GALLERY">
                        </a>

                        <a class="item-gallery-footer wrap-pic-w" href="images/photo-gallery-06.jpg" data-lightbox="gallery-footer">
                            <img src="images/photo-gallery-thumb-06.jpg" alt="GALLERY">
                        </a>

                        <a class="item-gallery-footer wrap-pic-w" href="images/photo-gallery-07.jpg" data-lightbox="gallery-footer">
                            <img src="images/photo-gallery-thumb-07.jpg" alt="GALLERY">
                        </a>

                        <a class="item-gallery-footer wrap-pic-w" href="images/photo-gallery-08.jpg" data-lightbox="gallery-footer">
                            <img src="images/photo-gallery-thumb-08.jpg" alt="GALLERY">
                        </a>

                        <a class="item-gallery-footer wrap-pic-w" href="images/photo-gallery-09.jpg" data-lightbox="gallery-footer">
                            <img src="images/photo-gallery-thumb-09.jpg" alt="GALLERY">
                        </a>

                        <a class="item-gallery-footer wrap-pic-w" href="images/photo-gallery-10.jpg" data-lightbox="gallery-footer">
                            <img src="images/photo-gallery-thumb-10.jpg" alt="GALLERY">
                        </a>

                        <a class="item-gallery-footer wrap-pic-w" href="images/photo-gallery-11.jpg" data-lightbox="gallery-footer">
                            <img src="images/photo-gallery-thumb-11.jpg" alt="GALLERY">
                        </a>

                        <a class="item-gallery-footer wrap-pic-w" href="images/photo-gallery-12.jpg" data-lightbox="gallery-footer">
                            <img src="images/photo-gallery-thumb-12.jpg" alt="GALLERY">
                        </a>
                    </div>

                </div>
            </div>
        </div>

        <div class="end-footer bg2">
            <div class="container">
                <div class="flex-sb-m flex-w p-t-22 p-b-22">
                    <div class="p-t-5 p-b-5">
                        <a href="#" class="fs-15 c-white"><i class="fa fa-tripadvisor" aria-hidden="true"></i></a>
                        <a href="#" class="fs-15 c-white"><i class="fa fa-facebook m-l-18" aria-hidden="true"></i></a>
                        <a href="#" class="fs-15 c-white"><i class="fa fa-twitter m-l-18" aria-hidden="true"></i></a>
                    </div>

                    <div class="txt17 p-r-20 p-t-5 p-b-5">
                        Copyright &copy; 2018 All rights reserved | This template is made with <i class="fa fa-heart"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>


    <!-- Back to top -->
    <div class="btn-back-to-top bg0-hov" id="myBtn">
        <span class="symbol-btn-back-to-top">
			<i class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
    </div>



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
    <script type="text/javascript" src="vendor/isotope/isotope.pkgd.min.js"></script>
    <!--===============================================================================================-->
    <script src="js/main.js"></script>
    
    <script type="text/javascript" src = "ajax/SearchStoreAjax.js"></script>
    

</body>

</html>