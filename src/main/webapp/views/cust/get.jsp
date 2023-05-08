<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

    $(function(){

    });

</script>

<div class="col-sm-8 text-center">
    <div class="container">
        <div class="col-sm-6 text-center">
            <h1>Detail Page</h1>
            <br/>
            <form id="update_form" class="form-horizontal well">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="id">ID:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" value="${gcust.id}" id="id"  name="id" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Password:</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="pwd" value="${gcust.pwd}" name="pwd">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">이름:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="name" value="${gcust.name}" name="name">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="update_btn" type="button" class="btn btn-default">Update</button>
                    </div>
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="remove_btn" type="button" class="btn btn-default">Remove</button>
                    </div>
                </div>


            </form>




        </div>
    </div>
</div>