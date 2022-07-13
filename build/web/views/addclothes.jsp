<%-- 
    Document   : addclothes
    Created on : Jul 11, 2022, 10:37:15 PM
    Author     : Lattae
--%>

<%@page import="Controller.ProductEditionController"%>
<%@page import="java.sql.ResultSet"%>
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
            <jsp:param name="title" value="Add Clothes" />
        </jsp:include>
    </head>
    <body>
        <jsp:include page='layouts/navbar.jsp'></jsp:include>
        <%
            ProductEditionController ptc = new ProductEditionController();
            ResultSet rs = ptc.getEdition();
        %>
        
        <div class="row">
            <div class="col-12 col-sm-6 col-m-12 text-center slider-wrapper">
                 <p style="font-size:2.5rem; margin-top: 60px; margin-bottom: -25px;"><i style="color:#324854"><b>Outfit</b></i> <i style="color:#a08669"><b>Studio</b></i></p>
                 <p class="catalog-subtitle" style="margin-top: 25px; font-size: 1.5rem;">Add Clothes List</p>
            </div>
        </div>
        
        <div class="row">
            <div class="col-12 col-m-12 col-sm-12">
                <form method="POST" action="addclothes">
                    <div class="col-12 col-m-12 col-sm-12">
                        <label class="label-input">Clothes Name</label>
                        <br>
                        <input class="search" type="text" palceholder="Input clothes name..." name="name" required>
                    </div>
                    <div class="col-12 col-m-12 col-sm-12">
                        <label class="label-input">Description</label>
                        <br>
                        <input class="search" type="text" palceholder="Input clothes description..." name="description" required>
                    </div>
                    <div class="col-12 col-m-12 col-sm-12">
                        <label class="label-input">Gender</label>
                        <br>
                        <select class="search" aria-label="Default select example" name="gender_type" required>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Unisex">Unisex</option>
                        </select>
                    </div>
                    <div class="col-12 col-m-12 col-sm-12">
                        <label class="label-input">Edition</label>
                        <br>
                        <select class="search" aria-label="Default select example" name="edition_id" required>
                                    <% while(rs.next()) { %>
                                        <option value="<%= rs.getString("edition_id")%>"><%= rs.getString("edition_name") %></option>
                                    <% } %>
                                </select>
                    </div>
                    <div class="col-12 col-m-12 col-sm-12">
                        <label class="label-input">Clothes Price</label>
                        <br>
                        <input type="number" min="0" class="search" placeholder="Input price..." name="price" required>
                    </div>
                    <div class="col-12 col-m-12 col-sm-12">
                        <label class="label-input">Stock</label>
                        <br>
                        <input type="number" min="0" class="search" placeholder="Input stok..." name="stock" required>
                    </div>
                    <div class="col-12 col-m-12 col-sm-12">
                        <label class="label-input">Admin</label>
                        <br>
                        <input class="search" type="text" palceholder="Input admin..." name="admin_id" required 
                               value="<%= request.getSession(true).getAttribute("user_id") %>">
                    </div>
                    <div class="col-12 col-m-12 col-sm-12">
                        <button type="submit" class="button-search" style="margin-left: 121px; color: white;">
                            Submit
                        </button>
                    <div class="col-12 col-m-12 col-sm-12">
                </form>
            </div>
        </div>
        
        <div class="col-12 col-m-12 col-sm-12" style="margin-top: 40px;">
            <jsp:include page='layouts/footer.jsp'></jsp:include>
        </div>
        <jsp:include page='layouts/scripts2.js'></jsp:include>
    </body>
</html>
