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
            <h1 style="text-align: center"> CFR2</h1>
            <h2><img class="small_img" src="/uimg/${imgname}"></h2>
            <h2>${result.emotion}</h2>
            <h2>${result.pose}</h2>
            <h2>${result.gender}</h2>
            <h2>${result.age}</h2>
            <br/>
            <form action="/cfr2impl" method="post" enctype="multipart/form-data" id="cfr2_form" class="form-horizontal well">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="img">Image:</label>
                    <div class="col-sm-10">
                        <input type="file" class="form-control" placeholder="Input Image" id="img" name="img">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button id="cfr2_btn" type="submit" class="btn btn-default">Send</button>
                    </div>
                </div>
            </form>
        </div>
    </div>.
</div>