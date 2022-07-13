<%-- 
    Document   : editusers
    Created on : Jul 13, 2022, 11:24:34 AM
    Author     : Lattae
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Controller.ProductController"%>
<%@page import="Controller.ProductController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
        <style>
            .input-group-append {
                cursor: pointer;
            }
        </style>
        
        <jsp:include page='layouts/head.jsp'>
            <jsp:param name="title" value="Edit User" />
        </jsp:include>
    </head>
    <body>
        <jsp:include page='layouts/navbar.jsp'></jsp:include>
        
        <% String user_id = request.getParameter("user_id"); 
            if (user_id == null || user_id.equals("")) { 
                response.sendRedirect("users"); 
            } 
    
           ProductController pc = new ProductController(); 
           ResultSet rs = pc.getUsersById(user_id); 
    
           System.out.println(rs); 
    
           if (!rs.isBeforeFirst()) { 
           response.sendRedirect("users"); 
            } 
        %>
        
        <% while(rs.next()) { %>
        <main>
            <div class="row">
                <div class="col-12 col-sm-6 col-m-12 text-center slider-wrapper">
                    <p style="font-size:2.5rem; margin-top: 60px; margin-bottom: -25px;"><i style="color:#324854"><b>Outfit</b></i> <i style="color:#a08669"><b>Studio</b></i></p>
                    <p class="catalog-subtitle" style="margin-top: 25px; font-size: 1.5rem;">Edit Users List</p>
                    <h3 class="mt-5">Edit Users - <%= rs.getString("u_name") %></h3>
                </div>
            </div>
        
            <div class="row">
            <div class="col-12 col-m-12 col-sm-12">
                <form method="POST" action="editUsers">
                    <input type="hidden" name="user_id" value="<%= rs.getString("user_id")%>" />
                    <div class="col-12 col-m-12 col-sm-12">
                        <label class="label-input">Name</label>
                        <br>
                        <input class="search" type="text" palceholder="Input name..." name="u_name" required 
                               value="<%= rs.getString("u_name")%>">
                    </div>
                    <div class="col-12 col-m-12 col-sm-12">
                        <label class="label-input">username</label>
                        <br>
                        <input class="search" type="text" palceholder="Input username..." name="username" required
                         value="<%= rs.getString("username")%>">
                    </div>
                    <div class="col-12 col-m-12 col-sm-12">
                        <label class="label-input">Password</label>
                        <br>
                        <input type="text" class="search" placeholder="Input password..." name="password" required
                               value="<%= rs.getString("password") %>">
                    </div>
                    <div class="col-12 col-m-12 col-sm-12">
                        <button type="submit" class="button-search" style="margin-left: 121px; color: white;">
                            Submit
                        </button>
                    <div class="col-12 col-m-12 col-sm-12">
                </form>
            </div>
        </div>
        </main>
        <% } %>
        
        <div class="col-12 col-m-12 col-sm-12" style="margin-top: 40px;">
            <jsp:include page='layouts/footer.jsp'></jsp:include>
        </div>
        <jsp:include page='layouts/scripts2.js'></jsp:include>
    </body>
</html>
