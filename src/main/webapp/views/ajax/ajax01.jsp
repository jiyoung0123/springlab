<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <%-- //jstl을 쓰겠다는 뜻!!
c 로 쓰겠다는것, 그래서 밑에 c:out  으로 쓸 수 있음--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
  let ajax01 = {
    init : function(){
      //주기적으로 server에 요청하는 함수
      setInterval(function (){
        $.ajax({  //2. ajax 호출
          url:'/getservertime',   //3. url에 요청
          success:function (data){
            ajax01.display(data)
          }, //4. 성공 시
          error:function (){
            alert('error!');
          }  //4. 실패 시
        });},3000);
      $.ajax({  //2. ajax 호출
        url:'/getservertime',   //3. url에 요청
        success:function (data){
          ajax01.display(data)
        }, //4. 성공 시
        error:function (){
          alert('error!');
        }  //4. 실패 시
      });
    },
    display:function (data){
      $('#server_time').text(data);
    }
  };

    $(function(){
      ajax01.init();
    })

</script>



<div class="col-sm-8 text-left">
  <div class="container">
    <h3>Ajax01</h3>
    <h4>Server Time</h4>
    <h5 id="server_time"></h5>

  </div>
</div>