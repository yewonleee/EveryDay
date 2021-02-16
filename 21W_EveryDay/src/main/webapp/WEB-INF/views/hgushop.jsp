<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EveryDay</title>
<style>
html, body {
	margin: 0;
	padding: 0;
	font-family: "맑은 고딕", 돋움, tahoma;
	letter-spacing: -0.5px;
}

body {
	padding-top: 90px;
}

.header {
	padding: 15px 10%;
	border-bottom: 1px solid lightgrey;
	position: fixed;
	width: 100%;
	height: 60px;
	background: white;
	top: 0px;
}

a {
	text-decoration: none;
	color: black;
}

.header ul {
	list-style-type: none;
	overflow: hidden;
	position: fixed;
	left: 35%;
	top: 12px;
}

.header li {
	float: left;
	padding: 10px;
	height: 100%;
}

.header li a {
	display: block;
	font-weight: bold;
}

.header li a:hover {
	color: #c12525;
}

.header .here {
	border-bottom: 5px solid #c12525;
	padding-bottom: 26px;
	color: #c12525;
}

.fa-calendar { /*Logo*/
	float: left;
	color: #c12525;
	padding: 12px;
}

.logo-side {
	float: left;
	margin: 10px 0 0 5px;
}

.everytime {
	color: #c12525;
	font-size: 12px;
	margin: 0;
	font-weight: bold;
}

.hgu {
	font-size: 24px;
	margin: 0px;
	padding-left: 2px;
}

.icons {
	position: fixed;
	top: 28px;
	left: 85%;
}

.icon {
	border: 1px solid lightgrey;
	border-radius: 10px;
	padding: 10px;
}

.logout {
	display: none;
	position: absolute;
	width: 55px;
	padding: 10px;
	margin: 5px;
	background-color: #c12525;
	color: white;
	border-radius: 5px;
}

.hv {
	display: inline-block;
}

.hv:hover .logout {
	display: block;
}

.wrapper {
	padding:20px;
}

.footer {
	float: left;
	margin-left: 35%;
}

.footer a {
	text-decoration: none;
	color: grey;
	font-size: 12px;
	padding: 3px;
}

.footer a:hover {
	color: #c12525;
}

.sample {
	color: grey;
	float: right;
	font-style: italic;
	margin: 5px;
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link rel=" shortcut icon" href="../img/favicon.ico" type="image/x-icon">
<!--favicon 설정 -->
<link rel="icon" href="../img/favicon.ico" type="image/x-icon">
<!--favicon 설정 -->	
</head>
<body>
	<div class="header">
		<!-- 상단 메뉴 -->
		<i class="fa fa-calendar" aria-hidden="true" style="font-size: 34px;"></i>
		<div class="logo-side">
			<p class="everytime">Everyday</p>
			<p class="hgu">HGU</p>
		</div>

		<ul>
			<li><a href="../main/csee">게시판</a></li>
			<li><a href="#">시간표</a></li>
			<li><a href="#">강의평가</a></li>
			<li><a href="hgushop" class="here">HGU SHOP</a></li>
			<li><a href="#">친구</a></li>
			<li><a href="#">책방</a></li>
			<li><a href="#">캠퍼스픽</a></li>
		</ul>

		<div class="icons">
			<i class="fa fa-envelope-o icon" aria-hidden="true"></i>
			<div class="hv">
				<i class="fa fa-user-o icon" aria-hidden="true"></i> <a
					href="../../login/logout" class="logout">로그아웃</a>
			</div>

		</div>
	</div>

	<!-- 지도를 담을 영역 -->
	<div class="wrapper">
		<div id="map" style="width: 100%; height: 650px;"></div>
	</div>
	

	<!-- 발급받은 javascript app key -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0cb23fe49032af8301a1a128a812a793"></script>

	<!-- 지도를 띄우는 코드 -->
	<script>
		var container = document.getElementById('map'); //지도를 표시할 div
		var options = {
			center : new kakao.maps.LatLng(36.10315425538241,
					129.38842737437503), //지도 중심좌표 
			level : 3
		//지도 확대 레벨 
		};

		var map = new kakao.maps.Map(container, options); //지도 생성
	</script>
	<script>
		var gps_use = null; //gps의 사용가능 여부
		var gps_lat = null; // 위도
		var gps_lng = null; // 경도
		var gps_position; // gps 위치 객체

		gps_check();
		// gps가 이용가능한지 체크하는 함수이며, 이용가능하다면 show location 함수를 불러온다.
		// 만약 작동되지 않는다면 경고창을 띄우고, 에러가 있다면 errorHandler 함수를 불러온다.
		// timeout을 통해 시간제한을 둔다.
		function gps_check() {
			if (navigator.geolocation) {
				var options = {
					timeout : 60000
				};
				navigator.geolocation.getCurrentPosition(showLocation,
						errorHandler, options);
			} else {
				alert("GPS_추적이 불가합니다.");
				gps_use = false;
			}
		}

		// gps 이용 가능 시, 위도와 경도를 반환하는 showlocation함수
		function showLocation(position) {
			gps_use = true;
			gps_lat = position.coords.latitude;
			gps_lng = position.coords.longitude;
		}

		// error발생 시 에러의 종류를 알려주는 함수.
		function errorHandler(error) {
			if (error.code == 1) {
				alert("접근차단");
			} else if (err.code == 2) {
				alert("위치를 반환할 수 없습니다.");
			}
			gps_use = false;
		}

		function gps_tracking() {
			if (gps_use) {
				map.panTo(new kakao.maps.LatLng(gps_lat, gps_lng));
				var gps_content = '<div><img class="pulse" draggable="false" unselectable="on" src="https://ssl.pstatic.net/static/maps/m/pin_rd.png" alt=""></div>';
				var currentOverlay = new kakao.maps.CustomOverlay({
					position : new kakao.maps.LatLng(gps_lat, gps_lng),
					content : gps_content,
					map : map
				});
				currentOverlay.setMap(map);
			} else {
				alert("접근차단하신 경우 새로고침, 아닌 경우 잠시만 기다려주세요.");
				gps_check();
			}
		}
	</script>
	
	<div class="footer">
		<a href="#">이용약관</a> <a href="#">개인정보처리방침</a> <a href="#">커뮤니티이용규칙</a>
		<a href="#">공지사항</a> <a href="#">문의하기</a> <a href="#"><span>&copy;
				에브리데이</span></a>
	</div>
	<p class="sample">이 웹사이트는 웹서비스 개발 연습 목적으로 만들어졌습니다.</p>

</body>
</html>