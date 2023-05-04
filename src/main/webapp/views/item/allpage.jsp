<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .small_img{
        width: 80px;
    }

</style>


<div class="col-sm-8 text-left">
<div class="container">

    <div class="row content">
        <div class="col-sm-6 text-left">
            <h3>Item All Page</h3>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>IMG</th>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>PRICE</th>
                    <th>REGDATE</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="obj" items="${cpage.getList()}">
                    <tr>
<%--                        application property에서 uimg 등록했으니, uimg만 써도 그 폴더 찾음--%>
                        <td ><img class="small_img" src="/uimg/${obj.imgname}"></td>
                        <td>${obj.id}</td>
                        <td>${obj.name}</td>
                        <td><fmt:formatNumber value="${obj.price}" type="currency" /></td>
                        <td><fmt:formatDate  value="${obj.rdate}" pattern="yyyy-MM-dd" /></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
           <jsp:include page = "../page.jsp"/>
        </div>
    </div>
</div>
</div>