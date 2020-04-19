function se1(){
					$($(".my-3")[0]).css("display","flex");
					$($(".my-3")[1]).css("display","none");
					$($(".my-3")[2]).css("display","none");
					$($(".my-3")[3]).css("display","none");
				}
				
				function se2(){
					$($(".my-3")[0]).css("display","none");
					$($(".my-3")[1]).css("display","flex");
					$($(".my-3")[2]).css("display","none");
					$($(".my-3")[3]).css("display","none");
				}
								
				function se3(){
					$($(".my-3")[0]).css("display","none");
					$($(".my-3")[1]).css("display","none");
					$($(".my-3")[2]).css("display","flex");
					$($(".my-3")[3]).css("display","none");
				}
				
				function se4(){
					$($(".my-3")[0]).css("display","flex");
					$($(".my-3")[1]).css("display","flex");
					$($(".my-3")[2]).css("display","flex");
					$($(".my-3")[3]).css("display","none");
				}
				
				
				
				var isUsClicked = false;
				function updateMyProfile() {
					var el = document.getElementsByClassName("userinfo-update")[0];
					var back = document
							.querySelectorAll(".content-container>*:not(.popup)");
					console.log(back);
					// back.chi.style = "filter: blur(4px);";
					if (isUsClicked) {
						el.style = "visibility: hidden;";
						isUsClicked = false;
					} else {
						el.style = "visibility: visible;";
						isUsClicked = true;
					}
				}
				