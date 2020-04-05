<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/memberLoginEnroll.css">

<div class="wrap">
        <div class="form-wrap">
            <div class="button-wrap">
                <div id="btn"></div>
                <button type="button" class="togglebtn" onclick="login()">LOG IN</button>
                <button type="button" class="togglebtn" onclick="register()">회원가입</button>
            </div>
            <form id="login" action="" class="input-group">
                <input type="text" class="input-field" placeholder="UserId" required>
                <input type="password" class="input-field" placeholder="Enter Password" required>
                <input type="checkbox" class="checkbox"><span>Remember ID</span>
                <button class="submit">Login</button>
                <br>
                <input type="button" class="find" value="아이디/비밀번호 찾기">
            </form>
            <form id="register" action="" class="input-group">
                <input type="text" class="input-field" placeholder="userId" required>
                <input type="password" class="input-field" placeholder="Enter Password" required>
                <input type="password" class="input-field" placeholder="Checked Password" required>
                <input type="name" class="input-field" placeholder="Your Name" required>
                <input type="email" class="input-field" placeholder="Your Email" required>
                <input type="emailck" class="input-field" placeholder="Checked Email" required>
                <input type="phone" class="input-field" placeholder="Phone Number" required>
                <input type="address" class="input-field" placeholder="address" required>
                <input type="radio" class="checkbox" name="gender" value="male" required>
                <label for="male">m</label>
                <input type="radio" class="checkbox" name="gender" value="Female">
                <label for="Female">f</label>
                <button class="submit">가입 하기</button>
            </form>
        </div>
    </div>
    <script>
        var x = document.getElementById("login");
        var y = document.getElementById("register");
        var z = document.getElementById("btn");
        
        
        function login(){
            x.style.left = "50px";
            y.style.left = "450px";
            z.style.left = "0";
        }

        function register(){
            x.style.left = "-400px";
            y.style.left = "50px";
            z.style.left = "110px";
        }
    </script>


<%@ include file="/views/common/footer.jsp"%>