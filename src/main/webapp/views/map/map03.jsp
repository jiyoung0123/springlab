<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <%-- //jstl을 쓰겠다는 뜻!!
c 로 쓰겠다는것, 그래서 밑에 c:out  으로 쓸 수 있음--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  #map{
    width: 500px;
    height: 500px;
    border: 2px solid red;
  }
</style>
<script>
  let map03={
    map:null,
    init:function (){
      this.display()
      $('#s_btn').click(function (){
        map03.go(37.5459099,  127.0545074,'s');
      });
      $('#b_btn').click(function (){
        map03.go(35.1938469, 129.1536102,'b')
      });
      $('#j_btn').click(function (){
        map03.go(33.5104135, 126.4913534,'j')
      });
    },
    display:function (){
      var mapContainer = document.querySelector('#map'); // 지도를 표시할 div
      var mapOption = {
        center: new kakao.maps.LatLng(37.5459099, 127.0545074), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
      };
      map=new kakao.maps.Map(mapContainer, mapOption);
      //controll start
      var mapTypeControl = new kakao.maps.MapTypeControl();
      // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
      // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
      // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
      var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
      //controll end
      //marker start
      var marker = new kakao.maps.Marker({
        // 지도 중심좌표에 마커를 생성합니다
        position: map.getCenter()
      });
// 지도에 마커를 표시합니다
      marker.setMap(map);
      //marker end
    },
    go:function (lat, lng, loc){
      // 이동할 위도 경도 위치를 생성합니다
      var moveLatLon = new kakao.maps.LatLng(lat,lng);
      // 지도 중심을 부드럽게 이동시킵니다
      // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
      map.panTo(moveLatLon);
      var markerPosition  = new kakao.maps.LatLng(lat,lng);
      var marker = new kakao.maps.Marker({
        // 지도 중심좌표에 마커를 생성합니다
        position: map.getCenter()
      });
// 지도에 마커를 표시합니다
      marker.setMap(map);
      map03.markers(loc);
    },
    markers:function (loc){
      $.ajax({
        url:'/markers',
        data:{'loc':loc},
        success:function (data){
          map03.displaymarkers(data);
        }
      });
    },
    displaymarkers:function (positions){
      var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
      for (var i = 0; i < positions.length; i ++) {
        var imageSize = new kakao.maps.Size(20, 30);
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
        var markerPosition = new kakao.maps.LatLng(positions[i].lat,positions[i].lng);
        var marker = new kakao.maps.Marker({
          map: map,
          position: markerPosition,
          title : positions[i].title,
          image : markerImage
        });
        // infoWindow
        var iwContent = '<h2>'+positions[i].title+'</h2>';
        iwContent += '<img src="/img/'+positions[i].img+'" style="width:50px">';
        var infowindow = new kakao.maps.InfoWindow({
          position : positions[i].latlng,
          content : iwContent
        });
        kakao.maps.event.addListener(marker, 'mouseover', mouseoverListener(marker, infowindow));
        kakao.maps.event.addListener(marker, 'mouseout', mouseoutListener(marker, infowindow));
        kakao.maps.event.addListener(marker, 'click', mouseclickListener(positions[i].target));
        function mouseoverListener(marker, infowindow) {
          return function(){
            infowindow.open(map, marker);
          };
        }
        function mouseoutListener(marker, infowindow) {
          return function(){
            infowindow.close();
          };
        }
        function mouseclickListener(target) {
          return function(){
            location.href = target;
          };
        }
      } // end for
    }
  };
  $(function(){
    map03.init();
  })
</script>
<div class="col-sm-8 text-left">
  <div class="container" id="map03">
    <h3>map03</h3>
    <button id="s_btn" type="button" class="btn btn-primary">seoul</button>
    <button id="b_btn" type="button" class="btn btn-primary">busan</button>
    <button id="j_btn" type="button" class="btn btn-primary">jeju</button>
    <div id="map"></div>
    <%--    지도 div에는 가로 세로 항상 지정해줘야함.--%>
  </div>
</div>
