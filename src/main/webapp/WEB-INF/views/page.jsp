<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Detail</title>
<link rel="stylesheet" href="css/kakaomap.css" />
<style>
	.container { 
	    display: flex;
	    justify-content: space-between;
	    align-items: flex-start;
	    max-width: 800px;
	    margin: 0 auto;
	    padding: 20px; 
	}
	
	.product-map {
	    flex: 1; /* 확장 가능한 크기 */
	    margin-right: 20px;
	}
	
	.product-options {
	    flex: 1; /* 확장 가능한 크기 */
	    margin-left: 20px;
	}
		
		/* 테이블 스타일 */
	table {
	    border-collapse: collapse;
	    width: 100%;
	}
	
	th, td {
	    border: 1px solid black;
	    padding: 8px;
	    text-align: left;
	}
	
	/* 리뷰 작성 양식 숨김 */
	.review {
	    display: none;
	}
	
	/* 탭 스타일 */
	.tab {
	    overflow: hidden;
	    border: 1px solid #ccc;
	    background-color: #f1f1f1;
	}
	
	.tab button {
	    background-color: inherit;
	    float: left;
	    border: none;
	    outline: none;
	    cursor: pointer;
	    padding: 14px 16px;
	    transition: 0.3s;
	}
	
	/* 리뷰 리스트 테이블 스타일 */
	#tbl_review {
	    width: 100%;
	}
	
	#tbl_review th {
	    background-color: #f2f2f2;
	}
	
	#tbl_review th, #tbl_review td {
	    padding: 10px;
	}
	
	/* 리뷰 작성 양식 스타일 */
	.review_form {
	    margin-top: 20px;
	}
	
	.review_form input[type="text"], .review_form textarea {
	    width: 100%;
	    padding: 10px;
	    margin-bottom: 10px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
	}
	.borad_id{
		display:none;
	}
	.btn-like {
	  color: transparent;
	  text-shadow: 0 0 2px rgba(255,255,255,.7), 0 0 0 #000;
	  border: none;
	  background-color: transparent;
	}
	.btn-like:hover {
	  text-shadow: 0 0 0 #ea0;
	}
	.btn-like.done {
	  color: inherit;
	  text-shadow: 0;
	}
	.btn-like.done:hover {
	  color: transparent;
	  text-shadow: 0 0 0 #777;
	}
</style>
</head>
<body>
<input type=hidden id=jjim_id >
<input type=hidden id=userid value=${email }>
<input type=hidden id=hpage value=${page } >
<input type=hidden id=hlastpage value=${lastpage }>

    <header>	<h1 id="shop-name"></h1>	</header>

    <div class="container">
    
        <div class="product-map">
            <p><div id="map" style="width:500px;height:400px;"></div></p> 
        </div>
        <div class="product-options">
            <table>
                <tr>
                    <th colspan="3" ><button class="btn-like" id=like>❤️</button><input type="hidden" id="pet_id" value=${id }>
                    <input type="hidden" id="wido" ><input type="hidden"  id="gyeongdo" >
                    </th>
                </tr>
                <tr>
                    <td>주소</td>
                    <td colspan="2" id='localAddress'></td>
                </tr>
                <tr>
                    <td>연락처</td>
                    <td colspan="2" id='number'></td>
                </tr>
                <tr>
                    <td>홈페이지</td>
                    <td colspan="2" id='homepage'></td>
                </tr>
                <tr>
                    <td>영업시간</td>
                    <td colspan="2" id='operating_time'></td>
                </tr>
                <tr>
                    <td>휴일</td>
                    <td colspan="2" id='holiday'></td>
                </tr>
                <tr>
                    <td>기타</td>
                    <td colspan="2" id='petben'></td>
                </tr>
                <tr >
				    <td rowspan="3">
				     <img src="https://appdata.hungryapp.co.kr/images/hatdog/img/travel/icon_dog_line.png?ver=2" alt="아이콘" />
				     <p id='pet_size'></p>
				    </td>
				  <td>
				     <img src="https://appdata.hungryapp.co.kr/images/hatdog/img/travel/icon_door_line.png?ver=2" alt="아이콘" />
                     <p id='area'></p>
				  </td>
				  <td>
                     <img src="https://appdata.hungryapp.co.kr/images/hatdog/img/travel/icon_door_line.png?ver=2" alt="아이콘" />
				     <p id='parking'></p>
				  </td>
				</tr>
            </table>
        </div>
    </div>
   <hr>
    <div>
        <div class="tab">
            <button class="tablinks">기본정보</button>
            <button class="tablinks">리뷰</button>
        </div>   
    </div>

    <div id="Container">
	<!-- 기본정보 s -->
		<div id="information">
		    <h1>기본정보(지도)</h1>
		    <div class="map_wrap">
		        <div id="map2" style="width:100%;height:500px;position:relative;overflow:hidden;"></div>
		        
		        <ul id="category">
		            <li id="CT1" data-order="0"> 
		                <span class="category_bg bank"></span>
		                문화시설
		            </li>       
		            <li id="AT4" data-order="1"> 
		                <span class="category_bg attractions"></span>
		                관광명소
		            </li>  
		            <li id="HP8" data-order="2"> 
		                <span class="category_bg hospital"></span>
		                병원
		            </li> 
		            <li id="PM9" data-order="2"> 
		                <span class="category_bg pharmacy"></span>
		                약국
		            </li> 
		            <li id="AD5" data-order="3"> 
		                <span class="category_bg accommodation"></span>
		                숙박
		            </li>  
		             <li id="CE7" data-order="4"> 
		                <span class="category_bg cafe"></span>
		                카페
		            </li>  
		            <li id="FD6" data-order="5"> 
		                <span class="category_bg restaurant"></span>
		                음식점
		            </li>  
		           
		            
		                 
		        </ul>
		    </div>
		</div>
	</div>

<!-- 리뷰 s -->
        <div id="review">
          <h1>리뷰 </h1>
            <div>
                <h5>유저리뷰</h5> <button id="new_write" >리뷰작성</button>
                 <div id='data_list' style="cursor: pointer;" >
                 	<table id=tbl_review>
				 	</table>
                 </div >
                 
                	<table id=showpage>
                	</table>

         	</div>
         	
        	
      	    <!-- <!-- 네이버 리뷰 s -->
			<div>
				<div>
					<h5>네이버 리뷰 <span id="naver_total"></span></h5>
				</div>
					<div class="s21_review_listb" id="review_n">				
					<a href="https://search.naver.com/search.naver?where=post&sm=tab_jum&query=서울 쁘라텟타이" target="_blank">
					<p class="s21_review_more">+ 더보기</p></a>
				</div>
			</div>	                   		
    	  </div>
</body>


<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d129ecc6b869c11eb7e257e7089bcf6b&libraries=services,clusterer,drawing"></script>
<script type="text/javascript"></script>
<script>

$(document)
.ready(function(){
	$("#review").hide();
	showList();
	showpage();
	chekJjim();
	var wido,gyeongdo; 
	$.ajax({
		type: 'post', 
        url: '/doload',
        data: {id:$('#pet_id').val()}, 
        dataType: 'json',
        success: function(data) {
        	if(data.homepage!='정보없음'){
        		$('#homepage2').text(data.homepage);
        		$("#homepage2").attr("href", data.homepage);
        	} else{
        		$('#homepage').text(data.homepage);
        	}
        	$('#shop-name').text(data.name);
        	$('#localAddress').text(data.localAddress);
        	$('#number').text(data.number);
        	$('#operating_time').text(data.time);
        	$('#holiday').text(data.holiday);
        	$('#petben').text(data.petben);
        	$('#pet_size').text(data.size);
        	$('#parking').text(data.parking);  
        	$('#area').text(data.areain+'/'+data.areaout); 
        	wido = data.wido; 
        	gyeongdo = data.gyeongdo;
	    }
        
	}).done(function() {// ajax 호출 완료 후에 실행되는 코드
		$('#wido').val(wido);  // 위도 경도를 바로 넣으면 왜 값이 안나오는지 확인하기.
		$('#gyeongdo').val(gyeongdo);
		map();
		map2();
		
    })  
	 	
})

.on('click','#like',function(){
	$.ajax({
		type:'post',
		url:'like',
		data:{id:$('#pet_id').val(),userid:$('#userid').val(),jjim_id:$('#jjim_id').val()},
		dataType:'text',
		success:function(data){
			if(data>0){
				alert('찜')
				$(".btn-like").toggleClass("done");
				$('#jjim_id').val(data)
				return 
			} else if(data=='-1') {
				$(".btn-like").toggleClass("done");
				$('#jjim_id').val("")
				return
			}
			alert('실패')
		}
		
	})
})

	
.on('click','#pagenum',function(){
	let a=$(this).text()
	a=a.replace(/(\s*)/g, "")
	$('#hpage').val(a)
	//console.log($('#hpage').val()+'s')
	showList()
	showpage()
})
.on('click','#prev',function(){
	let num=$('#hpage').val()-1
	$('#hpage').val(num)
	showList()
	showpage()
})
.on('click','#next',function(){
	let num=parseInt($('#hpage').val())+1
	$('#hpage').val(num)
	showList()
	showpage()
})
.on('click','#first',function(){
	let num=1
	$('#hpage').val(num)
	showList()
	showpage()
})
.on('click','#last',function(){
	let num=parseInt($('#hlastpage').val())
	$('#hpage').val(num)
	showList()
	showpage()
})


$(".tablinks:eq(0)").on("click", function() {      
    $("#review").hide(); 
    $("#information").show(); 
});
$(".tablinks:eq(1)").on("click", function() {  
    $("#information").hide(); 
    $("#review").show(); 
});
$("#new_write").on("click", function() {      
	openPop();
});
$('#data_list').on('click', '#tbl_review tr', function() {
    var reviewContent = $(this).find('td:eq(0)').text();
    var name = $(this).find('td:eq(1)').text();
   
    $('#content').val(reviewContent); 
    $('#writer').val(name); 
});

/* function doReview(){
	$.ajax({
		type: 'post', 
        url: '/doReview',
        data: {id:$('#pet_id').val()}, 
        dataType: 'json',
        success: function(data) {
        	$('#tbl_review').empty();
        	for(let i=0; i< data.length; i++){
        		let ob=data[i];
        		let str='<tr><td>'+ob['content']+'</td><td>'+ob['writer']+'</td><td>'+ob['time']+'</td><td class="borad_id" >' + ob['id'] +
                '</td><td>'+'<a href="#" onclick="modiPop(' + ob['id'] + ')">수정</a><a href="/rDelet?id=' + ob['id'] + '">삭제</a></td></tr>';
				$('#tbl_review').append(str);			
        	} 
     	 $("#data_list").html(JSON.stringify(data));   	
	    }
	});
} */

function openPop(){
  var popup = window.open('http://localhost:8081/review', '네이버팝업', 'width=700px,height=800px,scrollbars=yes');
 
} 
function modiPop(id) {
    var popup = window.open('http://localhost:8081/review?id=' + id, '네이버팝업', 'width=700px,height=800px,scrollbars=yes');
}

function showList(){
	$.ajax({
		type:'post',
		url:'/doReview',
		data:{id:$('#pet_id').val(),page:$('#hpage').val()},
		dataType:'json',
		success:function(data){
			$('#tbl_review').empty();
        	for(let i=0; i< data.length; i++){
        		let ob=data[i];
        		let str='<tr><td>'+ob.content+'</td><td>'+ob.writer+'</td><td>'+ob.time+'</td><td class="borad_id" >' + ob['id'] +
                '</td><td>'+'<a href="#" onclick="modiPop(' + ob.id + ')">수정</a><a href="/rDelet?id=' + ob.id + '">삭제</a></td></tr>';
				$('#tbl_review').append(str);			
        	} 
			
		}
	})
} 
function showpage(){
	$.ajax({
		type:'get',
		url:'/showpage',
		data:{id:$('#pet_id').val(),page:$('#hpage').val()},
		dataType:'text',
		success:function(data){
			$('#showpage').empty()
			//console.log(data)
			let b=data.slice(1,-1)
			b=b.replace(/(\s*)/g, "")
			//console.log(b)
			let a=b.split(',')
			//console.log(a)
			let str='<tr><td>&nbsp;&nbsp;&nbsp;<button id=first>맨처음</button><button id=prev>이전</button>'
			for(let i=0;i<a.length;i++){
				str+='<a href="#" id=pagenum value='+a[i]+'>'+a[i]+'&nbsp;</a>'
			}
			str+='<button id=next>다음</button><button id=last>마지막</button></td></tr>'
			$('#showpage').append(str)
			if($('#hpage').val() ==1){
				$('#prev').hide()
			}
			if($('#hpage').val() ==$('#hlastpage').val()){
				$('#next').hide()
			}
		}
	})
}

function chekJjim(){
	$.ajax({
		type:'post',
		url:'cheklike',
		data:{id:$('#pet_id').val(),userid:$('#userid').val()},
		dataType:'text',
		success:function(data){
			if(data>0){
				$(".btn-like").toggleClass("done");
				$('#jjim_id').val(data)
				console.log($('#jjim_id').val())
				return 
			}
		}
		
	})	
}



/* -------------------카카오맵 api----------------- */
  function map(){
		var container = document.getElementById('map');
	    var options = {
	       center: new kakao.maps.LatLng($('#wido').val(),$('#gyeongdo').val()),
	       level: 3
	    };
	    
	    var map = new kakao.maps.Map(container, options);
	    
	  	//지도 컨트롤
		var mapTypeControl = new kakao.maps.MapTypeControl();
	    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	    var zoomControl = new kakao.maps.ZoomControl();
	    
	    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	    var markerPosition  = new kakao.maps.LatLng($('#wido').val(),$('#gyeongdo').val());
	    console.log(markerPosition);
	    var marker = new kakao.maps.Marker({
	        position: markerPosition
	    });
	    
	    
	    
	    marker.setMap(map);
	}
  
/* ----------------------------카테고리 표시 ---------------------- */
var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 
function map2(){
	var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div 
    mapOption2 = {
		center: new kakao.maps.LatLng($('#wido').val(),$('#gyeongdo').val()),
        level: 5 // 지도의 확대 레벨
    }; 
    console.log(mapContainer2);
    
 // 지도를 생성합니다    
    var map2 = new kakao.maps.Map(mapContainer2, mapOption2); 

    // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places(map2); 

    //지도에 idle 이벤트를 등록합니다
    kakao.maps.event.addListener(map2, 'idle', searchPlaces);

    // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
    contentNode.className = 'placeinfo_wrap';

    //커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
    //지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
    addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
    addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

    //커스텀 오버레이 컨텐츠를 설정합니다
    placeOverlay.setContent(contentNode);  

    // 각 카테고리에 클릭 이벤트를 등록합니다
    addCategoryClickEvent();

    // 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
    function addEventHandle(target, type, callback) {
        if (target.addEventListener) {
            target.addEventListener(type, callback);
        } else {
            target.attachEvent('on' + type, callback);
        }
    }

    // 카테고리 검색을 요청하는 함수입니다
    function searchPlaces() {
        if (!currCategory) {
            return;
        }
        
        // 커스텀 오버레이를 숨깁니다 
        placeOverlay.setMap(null);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();
        
        ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
    }
    //장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
            displayPlaces(data);
        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
            // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

        } else if (status === kakao.maps.services.Status.ERROR) {
            // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
            
        }
    }

    // 지도에 마커를 표출하는 함수입니다
    function displayPlaces(places) {

        // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
        // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
        var order = document.getElementById(currCategory).getAttribute('data-order');

        for ( var i=0; i<places.length; i++ ) {

                // 마커를 생성하고 지도에 표시합니다
                var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

                // 마커와 검색결과 항목을 클릭 했을 때
                // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
                (function(marker, place) {
                    kakao.maps.event.addListener(marker, 'click', function() {
                        displayPlaceInfo(place);
                    });
                })(marker, places[i]);
        }
    }

    




// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map2); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    }  else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map2);  
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 
    }
</script>

</html>
        