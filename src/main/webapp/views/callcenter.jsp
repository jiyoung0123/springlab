<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #all {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid red;
    }

    #me {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid blue;
    }

    #to {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid green;
    }
</style>

<script>
    let callcenter = {
        id:null,
        stompClient:null,
        init:function(){
            this.id = $('#adm_id').text();
            $("#connect").click(function() {
                callcenter.connect();
            });
            $("#disconnect").click(function() {
                callcenter.disconnect();
            });
            $("#sendall").click(function() {
                callcenter.sendAll();
            });
            $("#sendme").click(function() {
                callcenter.sendMe();
            });
            $("#sendto").click(function() {
                callcenter.sendTo();
            });
        },
        connect:function(){
            var sid = this.id;

            // 관리자 서버로 접속:8088
            var socket = new SockJS('${adminserver}/ws');
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                callcenter.setConnected(true);
                console.log('Connected: ' + frame);
                this.subscribe('/send/to/'+sid, function(msg) {
                    $("#to").prepend(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });
            });
        },
        disconnect:function(){
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            callcenter.setConnected(false);
            console.log("Disconnected");
        },
        setConnected:function(connected){
            if (connected) {
                $("#status").text("Connected");
            } else {
                $("#status").text("Disconnected");
            }
        },
        // receiveall한테 메세지를 보내는것 -receiveall은 8088/ws에 있음-관리자의 msgcontroller로 들어옴

        sendTo:function(){
            var msg = JSON.stringify({
                'sendid' : this.id,        //나는
                'receiveid' : $('#target').val(),          //누구에게
                'content1' : $('#totext').val()           //메세지를 보낸다
            });
            //admin 컨트롤러에서 /receiveto 요기로 감
            this.stompClient.send('/receiveto', {}, msg);
        }

    };
    $(function(){
        callcenter.init();
    })

</script>
    <!-- Begin Page Content -->
    <div class="col-sm-8 text-left">

                <h1 >1:1 Call Center</h1>
                <h1 id="adm_id">${logincust.id}</h1>
                <H1 id="status">Status</H1>
                <button id="connect">Connect</button>
                <button id="disconnect">Disconnect</button>

                <h3>To</h3>
                <input type="text" id="target">
                <input type="text" id="totext"><button id="sendto">Send</button>
                <div id="to"></div>

    <!-- /.container-fluid -->
</div>
