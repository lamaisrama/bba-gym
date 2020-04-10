let lat="";
let lng="";


	var container = document.getElementById('map1'); //지도 담을 영역
	var options = { //지도 생성에 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.450701, 126.570667), //지도 중심 좌표 -> 사용자 위치 넣으면 될 듯
	level: 3  //지도의 확대 축소 정도
	};
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	//지도 클릭한 위치에 표출할 마커 - 중앙에 마커 생성
	var marker = new kakao.maps.Marker({
		position: map.getCenter(),
		clickable: true
	});
	//마커가 지도 위에 표시되도록 설정
	marker.setMap(map);
	
	//지도에 클릭 이벤트 등록
	kakao.maps.event.addListener(map, 'click', function(mouseEvent){
	var latlng = mouseEvent.latLng;
	marker.setPosition(latlng);
	
	//위도 가져오기
		lat = latlng.getLat();
		lng = latlng.getLng();
		console.log(lat, lng);
	})
	
	// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
	var iwContent = '<div style="padding:5px; text-align:center;">';
		iwContent+='<input type="button" class="btn btn-light btn-sm" onclick="relocation();" value="이 위치 주변 검색">';
			iwContent+='</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	
	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    content : iwContent,
	    removable : iwRemoveable
	});
	
	// 마커에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'click', function() {
	  // 마커 위에 인포윈도우를 표시합니다
	      infowindow.open(map, marker);  
	});

		
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 
		
		// 키워드로 장소를 검색합니다
		function searchKeyword(){
			var keyword = document.querySelector("#searchKeyword").value;
			ps.keywordSearch(keyword, placesSearchCB); 	
		}
		
		
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		    // LatLngBounds 객체에 좌표를 추가합니다
		    var bounds = new kakao.maps.LatLngBounds();
		
		    for (var i=0; i<data.length; i++) {
		        //displayMarker(data[i]);    
		        bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		    }       
		
		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}
		
		
		
		//장소 변경 후 검색하는 ftn
		function relocation(){
			console.log('현재 입력된 위/경도 :' + lat, lng);
		//
		}

		$("#amap").on("click",function(){
			map.relayout();
		});
	
			