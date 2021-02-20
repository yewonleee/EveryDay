<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="google-signin-client_id"
	content="614414049636-vmoicaro2j8pqts15mto327u6cm9p5u0.apps.googleusercontent.com">
<title>EveryDay</title>
<style>
body {
	margin: 0;
	font-family: "맑은 고딕", 돋움, tahoma;
	display: grid;
}

.login {
	text-align: center;
	position: absolute;
	height: 300px;
	width: 400px;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
	width: 400px;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
}

.fa-calendar { /*Logo*/
	color: #c12525;
	padding: 0 50px 10px 0;
}

.top p {
	color: grey;
	display: inline;
}

input {
	border: 1px solid lightgrey;
	width: 300px;
	height: 30px;
	margin: 2px;
}

button {
	width: 306px;
	height: 30px;
	background-color: #c12525;
	color: white;
	border: none;
	margin: 2px;
}

button:focus {
	outline: none;
}

#google_id_login {
	width: 306px;
	padding: 5px 0;
	background-color: #eb4c42;
	margin-left: 47px;
}

p a {
	color: #c12525;
	font-weight: bold;
}

.footer {
	background-color: #f8f8f8;
	border-top: 1px solid #e3e3e3;
	text-align: center;
	padding: 20px;
	font-size: 13px;
	bottom: 0;
	position: fixed;
	width: 100%;
}

a {
	text-decoration: none;
}

.footer a {
	color: black;
	padding: 3px;
}

.sample {
	color: grey;
	font-style: italic;
	position: absolute;
	width: 98%;
	text-align: right;
	bottom: 55px;
}
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<link rel=" shortcut icon" href="../img/favicon.ico" type="image/x-icon">
<!--favicon 설정 -->
<link rel="icon" href="../img/favicon.ico" type="image/x-icon">
<!--favicon 설정 -->

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<!-- load the Google platform library -->
<meta name="google-signin-client_id"
	content="614414049636-vmoicaro2j8pqts15mto327u6cm9p5u0.apps.googleusercontent.com">

</head>
<body>
	<div class="login">
		<div class="top">
			<i class="fa fa-calendar" aria-hidden="true" style="font-size: 45px;"></i>
			<p>
				지금 <span style="font-weight: bold;">에브리데이</span>를 시작하세요!
			</p>
		</div>

		<form method="post" action="loginOk">
			<div>
				<input type='text' name='userid' value="admin" />
			</div>
			<div>
				<input type='password' name='password' value="1234" />
			</div>
			<button type='submit'>로그인</button>
		</form>

		<form action="/connect/google" method="POST" style="display: inline">
			<input type="hidden" name="scope" value="profile email" />
			<button type="submit" class="btn btn-danger">
				Google <span class="fa fa-google-plus"></span>
			</button>
		</form>

		<p style="color: grey">
			에브리데이에 처음이신가요? <a href="signup">회원가입</a>
		</p>
	</div>

	<p class="sample">이 웹사이트는 웹서비스 개발 연습 목적으로 만들어졌습니다.</p>
	<div class="footer">
		<a href="#">이용약관</a> <a href="#">개인정보처리방침</a> <a href="#">문의하기</a> <a
			href="#"><span>&copy; 에브리데이</span></a>
	</div>

</body>
</html>