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

		// infowindow title+content 합치기 
		var dal_in = '<div style="padding:5px; background-color:#F15F5F"> <b>달인의 찜닭</b> <br>-매장 방문시 현금/계좌 송금 소자 1000원/ 중,대자 2000원 할인</div>';
		var dong_gung = '<div style="padding:5px; background-color:#F15F5F"> <b>동궁 찜닭</b> <br>-홀 방문시 찜닭 메뉴에 한해 10%할인</div>';
		var seoga = '<div style="padding:5px; background-color:#F15F5F"> <b>서가앤쿡</b> <br>-카드 5%, 현금 10%할인<br>-테이블당 음료수 한잔 서비스</div>';
		var shinjeon = '<div style="padding:5px; background-color:#F15F5F"> <b>신전 떡볶이</b> <br>-매장에서 현금결제시 1만원당 1천원 현금할인<br>-매장에서 카드결제시 1만원 이상 주문시 튀만두 or 튀오뎅 1인분 서비스<br>-배달 시 현금 or 이체의 경우 퀵비 2천원 할인</div>';
		var ssal = '<div style="padding:5px; background-color:#F15F5F"> <b>쌀통닭</b> <br>-매장 방문 시 현금결제 10% 할인<br>-카드 결제 5%할인</div>';
		var unggeup = '<div style="padding:5px; background-color:#F15F5F"> <b>응급실 떡볶이</b> <br>-16000원 이상 구매시 배달비 1000원 할인<br>-30000원 이상 구매시 배달비 무료<br>-수요일 팀모임 시간, 시험기간 점심, 저녁, 야식 이벤트 별도: 쿨피스 무료</div>';
		var pambal = '<div style="padding:5px; background-color:#F15F5F"> <b>팜스발리</b> <br>-현금/계좌 결제 6%할인</div>';
		var inbreeze = '<div style="padding:5px; background-color:#F15F5F"> <b>인브리즈</b> <br>-공연/행사 등을 위한 장소 무료 제공 (영업시간 등 조율 필요)</div>';
		var segoi = '<div style="padding:5px; background-color:#F15F5F"> <b>스고이 라멘</b> <br>-음료 or 밥 무료 제공</div>';
		var dolhar = '<div style="padding:5px; background-color:#F15F5F"> <b>돌하르방 국수</b></div>';

		var gecoffee = '<div style="padding:5px; background-color:#F2CB61"> <b>그냥 커피주세요</b> <br>-전체금액의 10%할인</div>';
		var nonstand = '<div style="padding:5px; background-color:#F2CB61"> <b>논스탠다드</b> <br>-전메뉴 10%할인<br>-프로젝트 공간 제공 가능</div>';
		var ydd = '<div style="padding:5px; background-color:#F2CB61"> <b>양덕동 마카롱</b> <br>-개당 100원 할인</div>';
		var hisbeans = '<div style="padding:5px; background-color:#F2CB61"> <b>히즈빈스 랩</b> <br>-음료 500원 할인</div>';
		var hayan = '<div style="padding:5px; background-color:#F2CB61"> <b>헤이안</b> <br>-음료 10%할인</div>';
		var pamtable = '<div style="padding:5px; background-color:#F2CB61"> <b>팜테이블</b> <br>-메뉴당 평일 10% 할인(주말,공휴일 제외)</div>';

		var onlyu = '<div style="padding:5px; background-color:#BCE55C"> <b>온리유 짐</b> <br>-월 10만원 (개인맞춤 자율운동&체형교정 관리)<br>-체형교정 및 관리 무료체험 가능</div>';
		var design = '<div style="padding:5px; background-color:#BCE55C"> <b>디자인 짐</b> <br>-2개월 등록시 20%할인(16만원)<br>-3개월 등록시 30%할인(18만원)</div>';
		var fitn = '<div style="padding:5px; background-color:#BCE55C"> <b>핏앤밸런스</b> <br>-1개월 등록시 50,000원+반신욕 포함</div>';
		var vida = '<div style="padding:5px; background-color:#BCE55C"> <b>비다펠리즈</b></div>';

		var coc = '<div style="padding:5px; background-color:#5CD125"> <b>COC 헤어</b> <br>-전체시술 현금/계좌 30%할인 , 카드 20%할인<br>-컷트, 뿌리시술 20%할인(현금,카드 상관 X)</div>';
		var igaza = '<div style="padding:5px; background-color:#5CD125"> <b>이가자 헤어비스</b> <br>-펌 30%, 컷트 20%, 염색 30% 할인</div>';
		var adam = '<div style="padding:5px; background-color:#5CD125"> <b>아담 네일</b> <br>-반영구눈썹,미인점,슈가왁싱,젤네일,패디,속눈썹펌 등 모든관리 10% 할인 (이벤트 적용불가, 동시 시술 불가)</div>';
		var hello = '<div style="padding:5px; background-color:#5CD125"> <b>반가워 뷰티</b> <br>-기본할인가 추가 10%할인 (속눈썹 연장, 펌, 스킨케어, 반영구)</div>';

		var simplefit = '<div style="padding:5px; background-color:#A366FF"> <b>Simple Fit</b> <br>-단체복 주문시 배송비 무료<br>-티 제작시 교수님티 무료</div>';
		var alpha = '<div style="padding:5px; background-color:#A366FF"> <b>알파문구</b> <br>-할인 10%(일부 품목제외)</div>';
		var onemusic = '<div style="padding:5px; background-color:#A366FF"> <b>원뮤직 피아노</b> <br>-원비의 10% 할인/레슨 30분 주 2회/ 50분 주 1회)</div>';
		var ouryard = '<div style="padding:5px; background-color:#A366FF"> <b>아워야드</b> <br>-대여료 50% 할인</div>';

		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [
				{
					title : '달인의찜닭',
					content : dal_in,
					latlng : new kakao.maps.LatLng(36.08625859731515,
							129.39695352628934)
				},

				{
					title : '동궁찜닭',
					content : dong_gung,
					latlng : new kakao.maps.LatLng(36.082336361181014,
							129.40244602445662)
				},

				{
					title : '서가앤쿡',
					content : seoga,
					latlng : new kakao.maps.LatLng(36.079865084665954,
							129.3970661686346)
				},

				{
					title : '신전떡볶이',
					content : shinjeon,
					latlng : new kakao.maps.LatLng(36.083060134845425,
							129.4008088823365)
				},

				{
					title : '쌀통닭',
					content : ssal,
					latlng : new kakao.maps.LatLng(36.083301158914885,
							129.4009280330675)
				},

				{
					title : '응급실떡볶이',
					content : unggeup,
					latlng : new kakao.maps.LatLng(36.081940195956854,
							129.3923557265124)
				},

				{
					title : '팜스발리',
					content : pambal,
					latlng : new kakao.maps.LatLng(36.102423867683996,
							129.39151503979966)
				},

				{
					title : '인브리즈',
					content : inbreeze,
					latlng : new kakao.maps.LatLng(36.102491987684104,
							129.39005761096394)
				},

				{
					title : '스고이라멘',
					content : segoi,
					latlng : new kakao.maps.LatLng(36.07888978526664,
							129.40031962445653)
				},

				{
					title : '돌하르방 고기국수',
					content : dolhar,
					latlng : new kakao.maps.LatLng(36.081929716503005,
							129.40150545514152)
				},

				//커피숍
				{
					title : '그냥 커피주세요',
					content : gecoffee,
					latlng : new kakao.maps.LatLng(36.080093532015816,
							129.39903087048398)
				},

				{
					title : '논스탠다드',
					content : nonstand,
					latlng : new kakao.maps.LatLng(36.08187527505964,
							129.39615327048392)
				},

				{
					title : '양덕동 마카롱',
					content : ydd,
					latlng : new kakao.maps.LatLng(36.08332933588813,
							129.39772936873618)
				},

				{
					title : '히즈빈스랩',
					content : hisbeans,
					latlng : new kakao.maps.LatLng(36.08168092987332,
							129.40506007173175)
				},

				{
					title : '헤이안',
					content : hayan,
					latlng : new kakao.maps.LatLng(36.064621738594184,
							129.387321710963)
				},

				{
					title : '팜테이블',
					content : pamtable,
					latlng : new kakao.maps.LatLng(36.06511306902965,
							129.38637418212747)
				},

				//피트니스

				{
					title : '온리유짐',
					content : onlyu,
					latlng : new kakao.maps.LatLng(36.08895939056074,
							129.39057722445685)
				},

				{
					title : '디자인짐',
					content : design,
					latlng : new kakao.maps.LatLng(36.08175236719491,
							129.39558775514138)
				},

				{
					title : '핏앤밸런스',
					content : fitn,
					latlng : new kakao.maps.LatLng(36.081039952461815,
							129.39669474164825)
				},

				{
					title : '비다펠리즈 피트니스',
					content : vida,
					latlng : new kakao.maps.LatLng(36.07989356872374,
							129.39784904000675)
				},

				//뷰티

				{
					title : '씨오씨 헤어',
					content : coc,
					latlng : new kakao.maps.LatLng(36.08316660525675,
							129.38113991096353)
				},

				{
					title : '이가자 헤어비스',
					content : igaza,
					latlng : new kakao.maps.LatLng(36.08305039031604,
							129.3983939457456)
				},

				{
					title : '아담네일',
					content : adam,
					latlng : new kakao.maps.LatLng(36.08022233262801,
							129.39885120242974)
				},

				{
					title : '반가워 뷰티',
					content : hello,
					latlng : new kakao.maps.LatLng(36.08462756564951,
							129.39256228397713)
				},

				//의류

				{
					title : '심플핏',
					content : simplefit,
					latlng : new kakao.maps.LatLng(36.103594553423164,
							129.38573153979968)
				},

				//기타

				{
					title : '알파문구(양덕)',
					content : alpha,
					latlng : new kakao.maps.LatLng(36.082756317121564,
							129.40160755155708)
				},

				{
					title : '원뮤직랩피아노',
					content : onemusic,
					latlng : new kakao.maps.LatLng(36.084876369750035,
							129.4057067336322)
				},

				{
					title : '아워야드',
					content : ouryard,
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
				image : markerImage
			// 마커 이미지 
			});

			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content
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