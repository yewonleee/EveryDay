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
	padding: 20px;
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
		<!-- 상단 메뉴!!! -->
		<i class="fa fa-calendar" aria-hidden="true" style="font-size: 34px;"></i>
		<div class="logo-side">
			<p class="everytime">Everyday</p>
			<p class="hgu">HGU</p>
		</div>

		<ul>
			<li><a href="main/csee">게시판</a></li>
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
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0cb23fe49032af8301a1a128a812a793&libraries=services,clusterer,drawing"></script>

	<!-- 지도를 띄우는 코드 -->
	<script>
		var container = document.getElementById('map'); //지도를 표시할 div
		var options = {
			center : new kakao.maps.LatLng(36.10315425538241,
					129.38842737437503), //지도 중심좌표 36.10315425538241, 129.38842737437503
			level : 3
		//지도 확대 레벨 
		};

		var map = new kakao.maps.Map(container, options); //지도 생성

		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [
				{
					title : '달인의찜닭',
					latlng : new kakao.maps.LatLng(36.08625859731515,
							129.39695352628934)
				},

				{
					title : '동궁찜닭',
					latlng : new kakao.maps.LatLng(36.082336361181014,
							129.40244602445662)
				},

				{
					title : '서가앤쿡',
					latlng : new kakao.maps.LatLng(36.079865084665954,
							129.3970661686346)
				},

				{
					title : '신전떡볶이',
					latlng : new kakao.maps.LatLng(36.083060134845425,
							129.4008088823365)
				},

				{
					title : '쌀통닭',
					latlng : new kakao.maps.LatLng(36.083301158914885,
							129.4009280330675)
				},

				{
					title : '응급실떡볶이',
					latlng : new kakao.maps.LatLng(36.081940195956854,
							129.3923557265124)
				},

				{
					title : '팜스발리',
					latlng : new kakao.maps.LatLng(36.102423867683996,
							129.39151503979966)
				},

				{
					title : '인브리즈',
					latlng : new kakao.maps.LatLng(36.102491987684104,
							129.39005761096394)
				},

				{
					title : '스고이라멘',
					latlng : new kakao.maps.LatLng(36.07888978526664,
							129.40031962445653)
				},

				{
					title : '돌하르망 고기국수',
					latlng : new kakao.maps.LatLng(36.081929716503005,
							129.40150545514152)
				},

				//커피숍
				{
					title : '그냥 커피주세요',
					latlng : new kakao.maps.LatLng(36.080093532015816,
							129.39903087048398)
				},

				{
					title : '논스탠다드',
					latlng : new kakao.maps.LatLng(36.08187527505964,
							129.39615327048392)
				},

				{
					title : '양덕동 마카롱',
					latlng : new kakao.maps.LatLng(36.08332933588813,
							129.39772936873618)
				},

				{
					title : '히즈빈스랩',
					latlng : new kakao.maps.LatLng(36.08168092987332,
							129.40506007173175)
				},

				{
					title : '헤이안',
					latlng : new kakao.maps.LatLng(36.064621738594184,
							129.387321710963)
				},

				{
					title : '팜테이블',
					latlng : new kakao.maps.LatLng(36.06511306902965,
							129.38637418212747)
				},

				//피트니스

				{
					title : '온리유짐',
					latlng : new kakao.maps.LatLng(36.08895939056074,
							129.39057722445685)
				},

				{
					title : '디자인짐',
					latlng : new kakao.maps.LatLng(36.08175236719491,
							129.39558775514138)
				},

				{
					title : '핏앤밸런스',
					latlng : new kakao.maps.LatLng(36.081039952461815,
							129.39669474164825)
				},

				{
					title : '비다펠리즈 피트니스',
					latlng : new kakao.maps.LatLng()
				},

				//뷰티

				{
					title : '씨오씨 헤어',
					latlng : new kakao.maps.LatLng(36.08316660525675,
							129.38113991096353)
				},

				{
					title : '이가자 헤어비스',
					latlng : new kakao.maps.LatLng(36.08305039031604,
							129.3983939457456)
				},

				{
					title : '아담네일',
					latlng : new kakao.maps.LatLng(36.08022233262801,
							129.39885120242974)
				},

				{
					title : '반가워 뷰티',
					latlng : new kakao.maps.LatLng(36.08462756564951,
							129.39256228397713)
				},

				//의류

				{
					title : '심플핏',
					latlng : new kakao.maps.LatLng(36.103594553423164,
							129.38573153979968)
				},

				//기타

				{
					title : '알파문구(양덕)',
					latlng : new kakao.maps.LatLng(36.082756317121564,
							129.40160755155708)
				},

				{
					title : '원뮤직랩피아노',
					latlng : new kakao.maps.LatLng(36.084876369750035,
							129.4057067336322)
				},

				{
					title : '아워야',
					latlng : new kakao.maps.LatLng(36.02351776904121,
							129.35641187729664)
				}

		];

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
		//var imageSrc2 = "../img/placeholder.png"; 

		for (var i = 0; i < positions.length; i++) {

			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(24, 35);

			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage
			// 마커 이미지 
			});

			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
				content : positions[i].title
			// 인포윈도우에 표시할 내용
			});

			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			// 이벤트 리스너로는 클로저를 만들어 등록합니다 
			// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(
					map, marker, infowindow));
			kakao.maps.event.addListener(marker, 'mouseout',
					makeOutListener(infowindow));
		}

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
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