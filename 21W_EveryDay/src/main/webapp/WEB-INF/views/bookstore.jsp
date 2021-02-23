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

.menu {
	background-color: #F5F5F5;
	height: 200px;
	border-bottom: 1px solid lightgrey;
	margin-bottom: 20px;
	width: 100%;
	text-align: center;
}

.menu-wrap {
	display: inline-block;
	text-align: center;
	overflow: hidden;
}

.menu ul {
	float: left;
	list-style-type: none;
	overflow: auto;
	margin: 16px 90px 16px 15px;
	padding-left: 0;
}

.menu li {
	padding: 2px;
	text-align: left;
}

.menu li a {
	font-size: 13px;
}

.menu li a:hover {
	color: #c12525;
}

.menu .here {
	color: #c12525;
	font-weight: bold;
}

.border {
	border-left: 1px solid lightgrey;
	float: left;
	height: 150px;
	margin-top: 20px;
}

.page-wrap {
	
}

.page-wrap:after {
	content: "";
	display: block;
}

.left {
	float: left;
	width: 55%;
	margin-left: 13%;
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
}

.title {
	margin: 15px;
	font-size: 15px;
}

.no-border {
	border: none;
}

.no-border:focus {
	outline: none;
}

textarea {
	width: 95%;
	height: 300px;
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
	padding: 15px;
	height: 60px;
}

.contents :hover {
	background-color: #F8F8F8;
}

.list-title {
	font-size: 14px;
	margin: 0;
	padding: auto;
}

.list-content {
	font-size: 12px;
	color: #B8B8B8;
	margin: 5px 0;
}

.list-date {
	font-size: 11px;
	color: #B8B8B8;
	margin: 0px;
	float: left;
}

.list-writer {
	font-size: 11px;
	margin: 0px;
	padding-left: 5px;
	float: left;
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

.right {
	width: 25%;
	float: left;
}

.boxes {
	border: 1px solid lightgrey;
	margin: 5px 20px;
	background-color: #F8F8F8;
}

.boxes .title {
	font-weight: bold;
	color: #0000CD;
	font-size: 14px;
	margin: 15px;
}

.boxes .content {
	font-size: 13px;
	height: 30px;
}

.hot .content {
	padding-left: 15px;
	height: 5px;
}

.footer {
	float: left;
	margin-left: 35%;
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

</head>
<body>

	<h2>책방</h2>
	<div class="new">
		<p class="newpost">
			책을 판매해보세요!<i class="fa fa-pencil" aria-hidden="true"></i>
		</p>
	</div>


	<div>

		<!-- 작성 form -->

		<form action="bookaddok" method="post">

			<div>
				<input type="text" name="title" placeholder="책 제목"
					class="no-border title" />
			</div>

			<div>
				<input type="text" name="writer" placeholder="책 저자"
					class="no-border title" />
			</div>

			<div>
				<input type="text" name="publisher" placeholder="출판사"
					class="no-border title" />
			</div>

			<div>
				<input type="text" name="publicationDate" placeholder="출판일"
					class="no-border title" />
			</div>

			<div>
				<input type="text" name="price" placeholder="판매가격"
					class="no-border title" />
			</div>

			<div class="content">
				<textarea name="comment" class="no-border"
					placeholder="자세한 책 정보를 적어주세요.(사용한 수업 등,,)"></textarea>
			</div>

			<p>밑줄 흔적이 있나요?</p>
			<input type="radio" id="nothing" name="underline" value="nothing">
			<label for="nothing">nothing</label><br> <input type="radio"
				id="pencil" name="underline" value="pencil"> <label
				for="pencil">pencil</label><br> <input type="radio"
				id="highlight" name="underline" value="highlight"> <label
				for="highlight">highlight</label><br>

			<p>필기 흔적이 있나요?</p>
			<input type="radio" id="nothing" name="notes" value="nothing">
			<label for="nothing">nothing</label><br> <input type="radio"
				id="pencil" name="notes" value="pencil"> <label for="pencil">pencil</label><br>
			<input type="radio" id="highlight" name="notes" value="highlight">
			<label for="highlight">highlight</label><br>

			<p>보존 상태는 어떤가요?</p>
			<p>겉표지</p>
			<input type="radio" id="clean" name="cover" value="clean"> <label
				for="clean">깨끗함</label><br> <input type="radio" id="notclean"
				name="cover" value="notclean"> <label for="notclean">깨끗하지
				않음</label><br>

			<p>이름기입</p>
			<input type="radio" id="clean" name="writingName" value="clean">
			<label for="clean">없음</label><br> <input type="radio"
				id="notclean" name="writingName" value="notclean"> <label
				for="notclean">있음</label><br>

			<p>페이지 변색</p>
			<input type="radio" id="clean" name="discoloration" value="clean">
			<label for="clean">없음</label><br> <input type="radio"
				id="notclean" name="discoloration" value="notclean"> <label
				for="notclean">있음</label><br>

			<p>페이지 훼손</p>
			<input type="radio" id="clean" name="damage" value="clean"> <label
				for="clean">없음</label><br> <input type="radio" id="notclean"
				name="damage" value="notclean"> <label for="notclean">있음</label><br>

			<div class="icons2">
				<i class="fa fa-code icon2" aria-hidden="true"></i> <i
					class="fa fa-upload icon2" aria-hidden="true"></i>

				<button type="submit" class="btn submit">
					<i class="fa fa-pencil" aria-hidden="true"
						style="font-size: 23px; margin-left: 0; text-align: center;"></i>
				</button>
			</div>
		</form>
	</div>

	<div class="contents">
		<!-- 게시글 list -->
		<c:forEach items="${bookstore}" var="u">
			<div class="list" onclick="location.href='detail/${u.seq}'"
				style="cursor: pointer;">
				<p class="list-title">${u.title}</p>
				<p class="list-content">${u.price}</p>
				<p class="list-date">${u.publicationDate}</p>
				<p class="list-writer">${u.comment}</p>
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
</body>
</html>