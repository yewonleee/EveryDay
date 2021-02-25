<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Everyday</title>
<style>
html, body {
	height: 100%;
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

.border {
	border-left: 1px solid lightgrey;
	float: left;
	height: 150px;
	margin-top: 20px;
}

.page-wrap {
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #f2f2f2;
}

.container {
	width: 800px;
	font-size: 13px;
}

.top {
	background-color: white;
	padding: 10px;
	margin: 10px;
}

.set {
	display: flex;
	margin: 5px;
}

.info_title {
	color: grey;
	width: 65px;
	font-size: 13px;
	margin: 0;
}

.info_content {
	margin: 0;
	padding-right: 10px;
}

.price {
	color: #FF6347;
	font-size: 20px;
	font-weight: bold;
	margin: 5px;
}

.middle {
	background-color: white;
	padding: 10px;
	margin: 10px;
}

.cmt {
	background-color: #f2f2f2;
	height: 30px;
	border-radius: 5px;
	margin: 5px;
	padding: 5px;
}

.bottom {
	background-color: white;
	padding: 10px;
	margin: 10px;
}

.grey {
	color: lightgrey;
}

.action {
	color: lightgrey;
	float: right;
}

.action a {
	color: grey;
	font-size: 12px;
}

.post-title {
	font-size: 20px;
	font-weight: bold;
}

.reply {
	background-color: #F8F8F8;
	border-bottom: 1px solid lightgrey;
	border-left: 1px solid lightgrey;
	border-right: 1px solid lightgrey;
	height: 45px;
}

.reply input[type="text"] {
	font-size: 13px;
	padding: 7px;
	float: left;
	border: none;
	background-color: #F8F8F8;
	margin: 8px;
	width: 80%;
}

input[type="text"]:focus {
	outline: none;
}

.submit {
	background-color: #c12525;
	color: white;
	width: 45px;
	height: 45px;
	float: right;
	border: none;
}

.back {
	border: 1px solid #c12525;
	border-radius: 3px;
	color: #c12525;
	background-color: white;
	font-weight: bold;
	font-size: 13px;
	padding: 7px;
	margin: 5px;
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
<script>
	function delete_ok(id) {
		var a = confirm("정말 삭제하시겠습니까?");
		if (a)
			location.href = '../deletebookok/' + id;
	}
</script>
<link rel=" shortcut icon" href="../img/favicon.ico" type="image/x-icon">
<!--favicon 설정 -->
<link rel="icon" href="../img/favicon.ico" type="image/x-icon">
<!--favicon 설정 -->
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
			<li><a href="main/csee">게시판</a></li>
			<li><a href="#">시간표</a></li>
			<li><a href="#">강의평가</a></li>
			<li><a href="hgushop">HGU SHOP</a></li>
			<li><a href="#">친구</a></li>
			<li><a href="../bookstore" class="here">책방</a></li>
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

	<div class="page-wrap">
		<div class="container">
			<input type="hidden" name="seq" value="${u.seq}" />
			<div class="top">
				<h3 style="font-size: 18px; margin: 7px 5px;">${u.title}</h3>
				<div class="set">
					<p class="info_title">저자</p>
					<p class="info_content">${u.writer}</p>
				</div>
				<div class="set">
					<p class="info_title">출판사</p>
					<p class="info_content">${u.publisher}</p>
				</div>
				<div class="set">
					<p class="info_title">출판일</p>
					<p class="info_content">${u.publicationDate}</p>
				</div>

				<p class="price">${u.price}원</p>

			</div>

			<div class="middle">
				<h3 style="margin: 5px;">판매자의 말</h3>
				<p class="cmt">${u.comment}</p>
			</div>

			<div class="bottom">
				<h3 style="margin: 5px;">책 상태</h3>
				<div class="set">
					<p class="info_title">밑줄 흔적</p>
					<p class="info_content grey" id="under_no">없음</p>
					<p class="info_content grey" id="under_pencil">연필/샤프</p>
					<p class="info_content  grey" id="under_pen">볼펜/형광펜</p>
				</div>
				<div class="set">
					<p class="info_title">필기 흔적</p>
					<p class="info_content grey" id="note_no">없음</p>
					<p class="info_content grey" id="note_pencil">연필/샤프</p>
					<p class="info_content grey" id="note_pen">볼펜/형광펜</p>
				</div>
				<div class="set">
					<p class="info_title">겉표지</p>
					<p class="info_content grey" id="clean">깨끗함</p>
					<p class="info_content grey" id="dirty">깨끗하지 않음</p>
				</div>
				<div class="set">
					<p class="info_title">이름 기입</p>
					<p class="info_content grey" id="name_yes">있음</p>
					<p class="info_content grey" id="name_no">없음</p>
					<p class="info_content grey"></p>
				</div>
				<div class="set">
					<p class="info_title">페이지 변색</p>
					<p class="info_content grey" id="color_yes">있음</p>
					<p class="info_content grey" id="color_no">없음</p>

				</div>
				<div class="set">
					<p class="info_title">페이지 훼손</p>
					<p class="info_content grey" id="damage_yes">있음</p>
					<p class="info_content grey" id="damage_no">없음</p>
				</div>

				<p class="list-photo"><img src="${pageContext.request.contextPath}/resources/img/${u.photo}" width=100, height=120></p>
			</div>

			<div class="post">
				<div class="action">
					<a href="../editform/${u.seq}">수정</a> <a
						href="javascript:delete_ok('${u.seq}')">삭제</a>
				</div>
			</div>

			<button type="button" class="back"
				onclick="location.href='../bookstore' ">
				<i class="fa fa-list" aria-hidden="true" style="margin: 5px;"></i>책
				목록
			</button>
		</div>
	</div>

	<div class="footer">
		<a href="#">이용약관</a> <a href="#">개인정보처리방침</a> <a href="#">커뮤니티이용규칙</a>
		<a href="#">공지사항</a> <a href="#">문의하기</a> <a href="#"><span>&copy;
				에브리데이</span></a>
	</div>
	<p class="sample">이 웹사이트는 웹서비스 개발 연습 목적으로 만들어졌습니다.</p>



</body>
<script>
	var underline = "${u.underline}";
	var notes = "${u.notes}";
	var cover = "${u.cover}";
	var writingName = "${u.writingName}";
	var page = "${u.discoloration}";
	var damage = "${u.damage}";
	
	if (underline == 'pencil') {
		document.getElementById("under_pencil").style.color = "black"; //body 끝에 script를 놓아야 함!
	}
	if (underline == 'pen'){
		document.getElementById("under_pen").style.color = "black";
	}
	if ((underline != 'pencil') && (underline != 'pen')){
		document.getElementById("under_no").style.color = "black";
	}

	if (notes == 'pencil') {
		document.getElementById("note_pencil").style.color = "black"; 
	}
	if (notes == 'pen'){
		document.getElementById("note_pen").style.color = "black";
	}
	if ((notes != 'pencil') && (notes != 'pen')){
		document.getElementById("note_no").style.color = "black";
	}

	if (cover == 'clean') {
		document.getElementById("clean").style.color = "black"; 
	} else {
		document.getElementById("dirty").style.color = "black";
	}

	if (writingName == 'clean') {
		document.getElementById("name_no").style.color = "black"; 
	} else {
		document.getElementById("name_yes").style.color = "black";
	}

	if (page == 'clean') {
		document.getElementById("color_no").style.color = "black"; 
	} else {
		document.getElementById("color_yes").style.color = "black";
	}
	
	if (damage == 'clean') {
		document.getElementById("damage_no").style.color = "black"; 
	} else {
		document.getElementById("damage_yes").style.color = "black";
	}
	
	
</script>
</html>