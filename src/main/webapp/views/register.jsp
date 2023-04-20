<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let login_form = {

        init:function(){
            $('#login_btn').click(function(){
                login_form.send();
            });
        },
        send:function(){
            $('#login_form').attr({
                'action':'/loginimpl',
                'method':'get'
            });
            $('#login_form').submit();

        }
    };
    $(function(){
        login_form.init();
    });

</script>

<div class="col-sm-8 text-center">
    <div class="container">
        <div class="col-sm-6 text-center">
            <h1 style="text-align: center">Regiter Page</h1>
            <br/>
            <form id="login_form" class="form-horizontal well">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="id">ID:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="id" placeholder="id입력" name="id">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Password:</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">이름:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="username" placeholder="Enter name" name="username">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="login_btn" type="button" class="btn btn-default">Register</button>
                    </div>
                </div>


            </form>




        </div>
    </div>
</div>