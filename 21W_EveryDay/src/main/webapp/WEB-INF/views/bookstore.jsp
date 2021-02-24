<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EveryDay</title>
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

.header li :hover {
	color: #c12525;
}

.header li a {
	display: block;
	font-weight: bold;
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

.username {
	position: fixed;
	left: 75%;
	padding: 5px;
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
}

.container {
	width: 800px;
}

h2 {
	border: 1px solid lightgrey;
	padding: 15px;
	margin: 5px 0;
}

.new {
	border: 2px solid lightgrey;
	padding: 0px 15px;
	margin-bottom: 5px;
	background-color: #F0F0F0;
}

.newpost {
	font-size: 13px;
	color: grey;
}

.fa-pencil {
	float: right;
}

.hide {
	border: 2px solid lightgrey;
	color: grey;
	display: none;
	margin-bottom: 5px;
	background-color: #F5F5F5;
}

.info {
	text-align: center;
	margin: 5px;
	padding: 10px;
	background-color: #ffffff;
}

.info_title {
	color: black;
	font-size: 18px;
}

.title {
	margin: 3px;
	padding: 7px;
	font-size: 17px;
	border-radius: 5px;
	border: 1px solid lightgrey;
}

.title_check {
	width: 200px;
	display: table-cell;
}

.no-border {
	border: none;
}

.no-border:focus {
	outline: none;
}

textarea {
	width: 95%;
	height: 100px;
	border: 1px solid lightgrey;
	padding: 10px;
}

.content {
	border-top: 1px solid lightgrey;
	padding: 15px;
}

.icons2 {
	border-top: 1px solid lightgrey;
	height: 45px;
	padding-left: 15px;
}

.icon2 {
	padding: 15px;
}

.writer {
	width: 30px;
	float: right;
	padding: 5px;
	margin: 10px;
	border: 1px solid lightgrey;
	border-radius: 3px;
}

.unknown {
	float: right;
	padding: 12px;
}

.btn {
	background-color: #c12525;
	color: white;
	padding: 10px;
	width: 45px;
	height: 45px;
	float: right;
	border: none;
	margin-left: 10px;
}

.contents { /* border 겹치는 부분에 대한 css 더 효율적인 법?*/
	border-left: 1px solid lightgrey;
	border-right: 1px solid lightgrey;
	border-top: 1px solid lightgrey;
}

.list { /* border 겹치는 부분에 대한 css 더 효율적인 방법?*/
	border-bottom: 1px solid lightgrey;
	padding: 10px;
	height: 100px;
}

.contents :hover {
	background-color: #F8F8F8;
}

.list-photo {
	float: left;
    width: 80px;
    height: 95px;
    margin: 0;
}

.list-title {
	margin: 0;
	width: 80%;
	font-size: 17px;
}

.list-writer {
	 margin: 0;
	 font-size: 14px;
}

.list-publisher {
	 margin: 0;
	 font-size: 14px;
}

.list-price {
	 margin: 0;
	 color: #FF6347;
	 font-size: 16px;
	 font-weight: bold;
	 width: 80%;
}

.list_right {
	float: left;
	padding: 5px;
}

.line {
	border-left: 1px solid lightgrey;
    height: 15px;
    margin: 6px;
    padding: 0;
}

.search {
	font-family: FontAwesome;
	width: 30px;
	height: 30px;
	border: none;
}

.search-bt {
	border: 1px solid #505050;
	border-radius: 3px;
	width: 170px;
	height: 30px;
	margin: 5px;
}

span {
	font-weight: bold;
}

.btn_next {
	color: white;
	background-color: #FF6347;
	border-radius: 3px;
	padding: 7px;
	font-size: 16px;
	border: none;
	margin: 10px 0;
}

.info_hide {
	display: none;
}

.footer {
	text-align: center;
}

.footer a {
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
<link rel=" shortcut icon" href="../img/favicon.ico" type="image/x-icon">
<!--favicon 설정 -->
<link rel="icon" href="../img/favicon.ico" type="image/x-icon">
<!--favicon 설정 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$(".new").click(function() {
			$(".new").hide();
			$(".hide").show();
		});
		$(".btn_one").click(function() {
			$(".btn_one").hide();
			$(".hide_one").show();
		});
		$(".btn_two").click(function() {
			$(".btn_two").hide();
			$(".hide_two").show();
		});
		$(".btn_three").click(function() {
			$(".btn_three").hide();
			$(".hide_three").show();
		});
		$(".btn_four").click(function() {
			$(".btn_four").hide();
			$(".hide_four").show();
		});
	});
</script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
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
			<li><a href="bookstore" class="here">책방</a></li>
			<li><a href="#">캠퍼스픽</a></li>
		</ul>

		<div class="icons">
			<i class="fa fa-envelope-o icon" aria-hidden="true"></i>
			<div class="hv">
				<i class="fa fa-user-o icon" aria-hidden="true"></i> <a
					href="../login/logout" class="logout">로그아웃</a>
			</div>
		</div>
	</div>
	<div class="page-wrap">
		<div class="container">

			<h2>책방</h2>
			<div class="new">
				<p class="newpost">
					여기를 클릭해 책을 판매해보세요!<i class="fa fa-pencil" aria-hidden="true"></i>
				</p>
			</div>

			<div class="hide">

				<form action="bookaddok" method="post">
					<div class="info">
						<p class="info-title" style="color: black;">자세한 책 정보를 적어주세요.</p>
						<div>
							<input type="text" name="title" placeholder="책 제목" class="title" />
						</div>

						<div>
							<input type="text" name="writer" placeholder="책 저자" class="title" />
						</div>

						<div>
							<input type="text" name="publisher" placeholder="출판사"
								class="title" />
						</div>

						<div>
							<input type="text" name="publicationDate" placeholder="출판일"
								class="title" />
						</div>
						<button type="button" class="btn_next btn_one">다음</button>
					</div>

					<div class="info info_hide hide_one">
						<p class="info-title" style="color: black;">판매 가격을 적어주세요.</p>
						<input type="text" name="price" placeholder="판매가격" class="title" />
						<button type="button" class="btn_next btn_two">다음</button>
					</div>

					<div class="info info_hide hide_two">
						<p class="info-title" style="color: black;">자세한 책 정보를 적어주세요.</p>
						<textarea name="comment"
							placeholder="자세한 책 정보를 적어주세요.(사용한 수업 등,,)"></textarea>
						<button type="button" class="btn_next btn_three">다음</button>
					</div>

					<div class="info info_hide hide_three">
						<p class="info-title" style="color: black;">필기한 흔적이 있나요?</p>
						<div class="title title_check">
							<input type="checkbox" name="underline" value="pencil"> <label
								for="pencil">밑줄 (연필/샤프)</label>
						</div>
						<div class="title title_check">
							<input type="checkbox" name="underline" value="pen"> <label
								for="pen">밑줄 (볼펜/형광펜)</label>
						</div>
						<div class="title title_check">
							<input type="checkbox" name="notes" value="pencil"> <label
								for="pencil">필기 (연필/샤프)</label>
						</div>
						<div class="title title_check">
							<input type="checkbox" name="notes" value="pen"> <label
								for="pen">필기 (볼펜/형광펜)</label>
						</div>
						<button type="button" class="btn_next btn_four">다음</button>
					</div>

					<div class="info info_hide hide_four">
						<p class="info-title" style="color: black;">보존 상태는 어떤가요?</p>
						<div class="title title_check">
							<input type="checkbox" name="cover" value="clean"> <label
								for="clean">겉표지 깨끗함</label>
						</div>
						<div class="title title_check">
							<input type="checkbox" name="writingName" value="clean">
							<label for="noname">이름(서명)기입 없음</label>
						</div>
						<div class="title title_check">
							<input type="checkbox" name="discoloration" value="clean">
							<label for="nocolor">페이지 변색 없음</label>
						</div>
						<div class="title title_check">
							<input type="checkbox" name="damage" value="clean"> <label
								for="nodamage">페이지 훼손 없음</label>
						</div>
						<button type="submit" class="btn_next">등록</button>
					</div>
				</form>
			</div>

			<div class="contents">
				<!-- 게시글 list -->
				<c:forEach items="${bookstore}" var="u">
					<div class="list" onclick="location.href='bookdetail/${u.seq}'"
						style="cursor: pointer;">
						<p class="list-photo">${u.photo}</p>
						<p class="list-title list_right">${u.title}</p>
						<p class="list-writer list_right">${u.writer} 지음</p> 
						<div class="line list_right"></div>
						<p class="list-publisher list_right">${u.publisher}</p>
						<p class="list-price list_right">${u.price}원</p>
					</div>
				</c:forEach>
			</div>

			<div class="div-search">
				<form id="searchForm" action="csee" method="get"
					style="margin: 0; padding: 0">
					<input type="text" placeholder="검색어를 입력하세요."
						class="no-border search-bt" /> <input type="submit"
						value="&#xf002;" class="search " />
				</form>
			</div>
		</div>
	</div>

	<div class="footer">
		<a href="#">이용약관</a> <a href="#">개인정보처리방침</a> <a href="#">커뮤니티이용규칙</a>
		<a href="#">공지사항</a> <a href="#">문의하기</a> <a href="#"><span>&copy;
				에브리데이</span></a>

	</div>
	<p class="sample">이 웹사이트는 웹서비스 개발 연습 목적으로 만들어졌습니다.</p>
</body>
</html>