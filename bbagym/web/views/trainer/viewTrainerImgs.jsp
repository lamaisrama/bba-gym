<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <style>
        body {
            background-color: black;
            color: black;
        }
        
        .close{
        	color: white;
        	font-size: 40px;
        	margin-right: 40px;
        }
        
        #close-container{
        	display: flex;
            float: right;
        }
        
        #close-container:hover{
        	color: white;
        	font-size: 40px;
        }
        
        .carousel-control-next{
        	z-index: 900;
        }
        
        #myModal .modal-content {
  			background-color: transparent;
  			border: 0;
		}
    </style>
</head>
<body>
<div id="myModal" class="modal fade" role="dialog" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
	<div id="close-container">
		<button type="button" class="close" aria-label="Close" data-dismiss="modal">
		  <span aria-hidden="true" >&times;</span>
		</button>
	</div>
	<div id="demo" class="carousel slide" data-ride="carousel" style="text-align: center;">

        <!-- Indicators -->
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
        </ul>

        <!-- The slideshow -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://i.pinimg.com/originals/2e/3c/fa/2e3cfaf8033f69efdfac56c35fee1ee3.jpg"
                    alt="Los Angeles" style="height: 100vh; overflow: hidden;">
            </div>
            <div class="carousel-item">
                <img src="https://i.pinimg.com/originals/2e/3c/fa/2e3cfaf8033f69efdfac56c35fee1ee3.jpg" alt="Chicago" style="height: 100vh; overflow: hidden;">
            </div>
            <div class="carousel-item">
                <img src="https://i.pinimg.com/originals/2e/3c/fa/2e3cfaf8033f69efdfac56c35fee1ee3.jpg" alt="New York" style="height: 100vh; overflow: hidden;">
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>
    </div>
    </div>
    </div>
    <script>
    	$('#myModal').modal('show');
    	
    	
    </script>
</body>
</html>