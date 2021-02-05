<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EveryDay</title>
<style>

* {
  box-sizing: border-box;
}

.top {
	padding-left: 40px;
}

.container {
  border-radius: 5px;
  padding: 30px;
  margin: 0px 10%;
  text-align: center;
  display: inline-block;
}

body {
	margin: 0;
	font-family: "맑은 고딕", 돋움, tahoma;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
  
}

input[type=text], [type=password], [type=email] {
  width: 200px;
  padding: 12px;
  border: 1px solid #ccc;
  resize: vertical;
}

input[type=submit] {
  background-color: #c12525;
  color: white;
  padding: 5px 20px;
  border: none;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: grey;
}

.signup{
	text-align: center;
	position: absolute;
    height: 300px;
    width: 400px;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto;
}

.fa-calendar { /*Logo*/
	color: #c12525;
	padding-right: 10px;
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

input:focus {
	outline: none;
}

button {
	width: 306px;
	height: 30px;
	background-color: #c12525;
	color: white;
	border: none;
	margin: 2px;
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

.left{
    float: left;
	width: 100px;
    height:auto;
    display: inline-block;
    text-align: left;
}

.right{
    float: left;
    height:auto;
    display: inline-block;
}

.row {
	
}

.row:after {
  content: "";
  display: table;
  clear: both;
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
</head>

<body>
	<!-- <img src='../img/snowman.jpg' height="250"> -->
	<div class="signup">
		<div class="top">
			<i class="fa fa-calendar" aria-hidden="true" style="font-size: 45px;"></i>
			<p>
				지금 <span style="font-weight: bold;">에브리데이</span>를 시작하세요!
			</p>
		</div>
	
	 <!-- <tr><td>Id:</td><td><input type="text" name="userid"/></td></tr>   -->
	 
	   <div class="container">  
	   
	   <form method="post" action="signupok"> 
	   	
	   		<div class="row">
		   		<div class="left">
	      			<label for="fname">아이디 : </label>
	    		</div>
	    		
	    		<div class="right">
	      			<input  type="text" name="userid" placeholder="ID">
	    		</div>
	   		</div>
	   	
	   	
	   		<div class="row">
		   		<div class="left">
	      			<label for="fname">비밀번호 : </label>
	    		</div>
	    		
	    		<div class="right">
	      			<input type="password" name="password" placeholder="Password">
	    		</div>	
	   		</div>
	   	
	   	
		   	<div class="row">
		   		<div class="left">
	      			<label for="fname">닉네임 : </label>
	    		</div>
	    		
	    		<div class="right">
	      			<input type="text" name="username" placeholder="닉네임">
	    		</div>
		   	</div>
		   	
		   	<div class="row">
		   		<div class="left">
	      			<label for="fname">이메일 : </label>
	    		</div>
	    		
	    		<div class="right">
	      			<input type="email" name="email" placeholder="이메일">
	    		</div>
		   	</div>
	   	
			<div class="row"><input type="submit" value="회원가입하기"/></div>
			
			</form>
			
		</div>
		
	   </div>
  	
	<p class="sample">이 웹사이트는 웹서비스 개발 연습 목적으로 만들어졌습니다.</p>
	
	<div class="footer">
		<a href="#">이용약관</a> <a href="#">개인정보처리방침</a> <a href="#">문의하기</a> <a
			href="#"><span>&copy; 에브리데이</span></a>
	</div>


</body>
</html>