<%-- 
    Document   : login
    Created on : Jul 13, 2022, 3:25:23 PM
    Author     : Lattae
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 
    Document   : login
    Created on : Jul 8, 2022, 4:56:47 AM
    Author     : Hudya
--%>

<%--<%@ taglib prefix="c" uri="http://java.sun/com/jstl/core" %>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="public/assets/backend/extra.css">
        <link rel="stylesheet" href="public/assets/backend/main.css">
        
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Crimson+Text:wght@700&display=swap" rel="stylesheet">
        <jsp:include page='layouts/head.jsp'>
            <jsp:param name="title" value="Login" />
        </jsp:include>
        <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>

    </head>
    <body class="d-flex flex-column h-100">

            <main>
                <div class="row">
                <div class="col-sm-12 col-m-12 col-12 text-center slider-wrapper">
                    <p style="font-size:2.5rem; margin-top: 80px; margin-bottom: 10px;"><i style="color:#324854"><b>Outfit</b></i> <i style="color:#a08669"><b>Studio</b></i></p>
                </div>
                    <h2 class="text-center slider-wrapper">Login</h2>
                    <p class="text-center slider-wrapper">Insert Username and Password</p>
                     <div class="alert alert-danger alert-dismissible fade show " role="alert">
                    <% if (request.getSession(true).getAttribute("errors") != null) {%>
                    <div class="col-12 mb-3 text-center">
                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <strong>Error!</strong> <%= request.getSession(true).getAttribute("errors")%>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </div>
                    <% } %>
                    <div class="col-12 col-m-12 col-sm-12">
                        <form method="POST" action="login" style="margin-left:330px;">
                            <div class="col-12 col-m-12 col-sm-12">
                                <label class="label-input" >Username</label>
                                <input type="text" class="search" style="width: 30%;" placeholder="Type your Username..." name="username" required>
                            </div>
                            <div class="col-12 col-m-12 col-sm-12">
                                <label class="label-input">Password</label>
                                <input type="password" class="search" style="width: 30%;" placeholder="Type your Password..." name="password" required>
                            </div>
                            <div class="col-12 col-m-12 col-sm-12">
                                <button type="submit" class="button-edit" style="margin-left:310px; color:white;">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <div class="col-12 col-m-12 col-sm-12" style="margin-top: 170px;">
            <jsp:include page='layouts/footer.jsp'></jsp:include>
        </div>
        <jsp:include page='layouts/scripts2.js'></jsp:include>
        <jsp:include page='layouts/scripts3.js'></jsp:include>
    </body>
</html>

