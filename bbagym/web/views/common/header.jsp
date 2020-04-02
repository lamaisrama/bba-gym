<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="<%=request.getContextPath() %>/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="<%=request.getContextPath() %>/assets/img/logo_favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    BBAGYM-빠짐
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!-- Fonts and icons -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="<%=request.getContextPath() %>/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath() %>/assets/css/paper-kit.css?v=2.2.0" rel="stylesheet" />
  <link href="<%=request.getContextPath() %>/assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="profile-page sidebar-collapse">
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg fixed-top navbar-transparent " color-on-scroll="300">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp" rel="tooltip" title="BBAGYM" data-placement="bottom" target="_blank" style="font-size: 18px;">
          <i>빠Gym</i>
        </a>
        <button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-bar bar1"></span>
          <span class="navbar-toggler-bar bar2"></span>
          <span class="navbar-toggler-bar bar3"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse justify-content-end" id="navigation">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a href="#" class="nav-link" style="font-size: 16px;">&nbsp;시설찾기</a>
          </li>
          <li class="nav-item">
            <a href="#" target="_blank" class="nav-link" style="font-size: 16px;">&nbsp;트레이너찾기</a>
          </li>
          <li class="nav-item">
            <a href="#" target="_blank" class="nav-link" style="font-size: 16px;">&nbsp;Board</a>
          </li>
          <li class="nav-item">
            <a href="#" target="_blank" class="nav-link" style="font-size: 16px;">&nbsp;Board</a>
          </li>
         
          <!-- HelloUser Dropdown -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 16px;">
            Hello! User!
          </a>
            <div class="dropdown-menu dropdown-menu-right animate slideIn" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">My Page</a>
              <a class="dropdown-item" href="#">찜 내역</a>
              <a class="dropdown-item" href="#">장바구니</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">Log-out</a>
            </div>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- End Navbar -->
  
  <!-- <div class="page-header page-header-xs" data-parallax="true" style="background-image: url('assets/img/fabio-mangione.jpg');"></div> --> 