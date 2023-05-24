<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <%-- //jstl을 쓰겠다는 뜻!!
c 로 쓰겠다는것, 그래서 밑에 c:out  으로 쓸 수 있음--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
  #map02 > #map{
    width:400px;
    height: 400px;
    border :2px solid red;
  }
</style>

<script>
  let map02={
    map:null,
    init:function(){
      this.display();
      $('#s_btn').click(function(){
        map02.go(37.5323053, 127.0667564);
      });
      $('#b_btn').click(function(){
        map02.go(37.5218225, 127.0365464);
      });
      $('#j_btn').click(function(){
        map02.go(37.533844, 127.0675258);

      });
    },
    display:function(){
      var mapContainer = document.querySelector('#map02 > #map');
      var mapOption =  {
        center: new kakao.maps.LatLng(37.5323053, 127.0667564), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
      };
      map = new kakao.maps.Map(mapContainer, mapOption);

      var mapTypeControl = new kakao.maps.MapTypeControl();

      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

      var zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

      var markerPosition  = new kakao.maps.LatLng(37.5323053, 127.0667564);

      var marker = new kakao.maps.Marker({
        position: markerPosition
      });

// 마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(map);

    },
    go:function(lat,lng){
      var moveLatLon = new kakao.maps.LatLng(lat, lng);


      // 지도 중심을 부드럽게 이동시킵니다
      // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
      map.panTo(moveLatLon);


      var markerPosition  = new kakao.maps.LatLng(lat, lng);
      var marker = new kakao.maps.Marker({
        position: map.getCenter()
      });

      marker.setMap(map);


    }

  };

    $(function(){
        map02.init();
    })
</script>



<div class="col-sm-8 text-left">
  <div class="container" id="map02">
    <h3>MAP02</h3>
    <button id="s_btn" type="button" class="btn btn-primary">Seoul</button>
    <button id="b_btn" type="button" class="btn btn-primary">Busan</button>
    <button id="j_btn" type="button" class="btn btn-primary">Jeju</button>
    <div id="map"></div>

  </div>
</div>