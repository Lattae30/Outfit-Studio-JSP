<%-- 
    Document   : clothes
    Created on : Jul 9, 2022, 10:03:41 PM
    Author     : Lattae
--%>

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
        <jsp:include page='layouts/head.jsp'>
            <jsp:param name="title" value="Clothes" />
        </jsp:include>
    </head>
    <body>
        <jsp:include page='layouts/navbar.jsp'></jsp:include>
        <%
            ProductController pc = new ProductController();

            String search = "";
            ResultSet rs;

            if (request.getParameter("search") != null) {
                search = request.getParameter("search");
            } 

            if (search.equals("")) {
                rs = pc.get();
            } else {
                rs = pc.getByName(search);
            }
        %>
        
        <div class="row">
            <div class="col-12 col-sm-6 col-m-12 text-center slider-wrapper">
                 <p style="font-size:2.5rem; margin-top: 80px; margin-bottom: -25px;"><i style="color:#324854"><b>Outfit</b></i> <i style="color:#a08669"><b>Studio</b></i></p>
                 <p class="catalog-subtitle" style="margin-top: 25px; font-size: 2rem;">Clothes List</p>
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-m-12 col-sm-12">
            <div class="col-6 col-m-6 col-sm-6">
                <form action="clothes" method="GET">
                    <label style="margin-left: 121px;">Search</label>
                    <div>
                      <input class="search" type="text" name="search" value="<%= search%>">
                         <span>
                             <button class="button-search">
                                 <i class='bx bx-search-alt' style='color:rgba(249,248,248,0.99)' ></i>
                             </button>
                        </span>
                    </div>
                </form>
            </div>
            <div class="col-6 col-m-6 col-sm-6" style="margin-top: 21PX;">
                <button class="button-search" style="color: white;">
                 <a href="http://localhost:8080/OutfitStudio/addclothes" style="text-decoration: none; color: white;">
                     <i class='bx bx-add-to-queue' style='color:#fff5f5'></i>
                     Add list</a>
                </button>
            </div>
            </div>
                <div class="row">
                    <div class="col-12 col-m-12 col-sm-12">
                        <table>
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Name</th>
                                    <th>Decription</th>
                                    <th>Gender</th>
                                    <th>Edition</th>
                                    <th>Prize</th>
                                    <th>Stock</th>
                                    <th>Admin ID</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% while(rs.next()) { %>
                                <tr>
                                    <td><%= rs.getString("id") %></td>
                                    <td><%= rs.getString("name") %></td>
                                    <td><%= rs.getString("description") %></td>
                                    <td><%= rs.getString("gender_type") %></td>
                                    <td><%= rs.getString(5)%></td>
                                    <td><%= rs.getString("price") %></td>
                                    <td><%= rs.getString("stock") %></td>
                                    <td><%= rs.getString("admin_id") %></td>
                                    <td>
                                        <form action="deleteClothes?id=<%= rs.getString("id") %>" method="POST"
                                              onsubmit="return confirm('Are you sure want to delete the data?')">
                                            <a href="editClothes?id=<%= rs.getString("id") %>" class="button-edit" style="text-decoration: none; color: white;">Edit</a>
                                            <input type="hidden" name="id" value="<%= rs.getString("id")%>" />
                                            <button type="submit" class="button-delete" style="color:white;">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>                   
                </div>           
        </div>
        
        <div class="col-12 col-m-12 col-sm-12" style="margin-top: 150px;">
            <jsp:include page='layouts/footer.jsp'></jsp:include>
        </div>
        <jsp:include page='layouts/scripts2.js'></jsp:include>
    </body>
</html>
