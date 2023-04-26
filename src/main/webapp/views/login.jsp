<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

    $(function(){
        login_form.init();
    });

</script>

<div class="col-sm-8 text-center">
    <div class="container">
        <div class="col-sm-6 text-center">
        <h1 style="text-align: center">Login Page</h1>
        <br/>
        <form id="login_form" class="form-horizontal well">
            <div class="form-group">
                <label class="control-label col-sm-2" for="id">ID:</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" placeholder="id입력" id="id" name="id">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="pwd">Password:</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" placeholder="Enter password"  id="pwd"  name="pwd">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button id="login_btn" type="button" class="btn btn-default">Login</button>
                </div>
            </div>
        </form>
        </div>
    </div>.
</div>