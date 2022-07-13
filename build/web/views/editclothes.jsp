<%-- 
    Document   : addclothes
    Created on : Jul 11, 2022, 10:37:15 PM
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
        
        <style>
            .input-group-append {
                cursor: pointer;
            }
        </style>
        
        <jsp:include page='layouts/head.jsp'>
            <jsp:param name="title" value="Edit Clothes" />
        </jsp:include>
    </head>
    <body>
        <jsp:include page='layouts/navbar.jsp'></jsp:include>
        
        <% String id = request.getParameter("id"); 
            if (id == null || id.equals("")) { 
                response.sendRedirect("clothes"); 
            } 
    
           ProductController pc = new ProductController(); 
           ResultSet rs = pc.getClothesById(id); 
    
           System.out.println(rs); 
    
           if (!rs.isBeforeFirst()) { 
           response.sendRedirect("clothes"); 
            } 
        %>
        
        <% while(rs.next()) { %>
        <main>
            <div class="row">
                <div class="col-12 col-sm-6 col-m-12 text-center slider-wrapper">
                    <p style="font-size:2.5rem; margin-top: 60px; margin-bottom: -25px;"><i style="color:#324854"><b>Outfit</b></i> <i style="color:#a08669"><b>Studio</b></i></p>
                    <p class="catalog-subtitle" style="margin-top: 25px; font-size: 1.5rem;">Edit Clothes List</p>
                    <h3 class="mt-5">Edit Produk - <%= rs.getString("name") %></h3>
                </div>
            </div>
        
            <div class="row">
            <div class="col-12 col-m-12 col-sm-12">
                <form method="POST" action="editClothes">
                    <input type="hidden" name="id" value="<%= rs.getString("id")%>" />
                    <div class="col-12 col-m-12 col-sm-12">
                        <label class="label-input">Clothes Name</label>
                        <br>
                        <input class="search" type="text" palceholder="Input clothes name..." name="name" required 
                               value="<%= rs.getString("name")%>">
                    </div>
                    <div class="col-12 col-m-12 col-sm-12">
                        <label class="label-input">Description</label>
                        <br>
                        <input class="search" type="text" palceholder="Input clothes description..." name="description" required
                         value="<%= rs.getString("description")%>">
                    </div>
                    <div class="col-12 col-m-12 col-sm-12">
                        <label class="label-input">Gender</label>
                        <br>
                        <select class="search" aria-label="Default select example" name="gender_type" required>
                            <option value="Male" <%= rs.getString("gender_type") == "Male" ? "selected" : ""%>>
                                Male
                            </option>
                            <option value="Female"<%= rs.getString("gender_type") == "Female" ? "selected" : ""%>>
                                Female
                            </option>
                            <option value="Unisex" <%= rs.getString("gender_type") == "Unisex" ? "selected" : ""%>>
                                Unisex
                            </option>
                        </select>
                    </div>
                    <div class="col-12 col-m-12 col-sm-12">
                        <label class="label-input">Edition</label>
                        <br>
                        <select class="search" aria-label="Default select example" name="edition_id" required>
                              <option value="<%= rs.getString("edition_id")%>"><%= rs.getString("name") %></option>
                        </select>
                    </div>
                    <div class="col-12 col-m-12 col-sm-12">
                        <label class="label-input">Clothes Price</label>
                        <br>
                        <input type="number" min="0" class="search" placeholder="Input price..." name="price" required
                               value="<%= rs.getString("price") %>">
                    </div>
                    <div class="col-12 col-m-12 col-sm-12">
                        <label class="label-input">Stock</label>
                        <br>
                        <input type="number" min="0" class="search" placeholder="Input stok..." name="stock" required
                               value="<%= rs.getString("stock") %>">
                    </div>
                    <div class="col-12 col-m-12 col-sm-12">
                        <label class="label-input">Admin</label>
                        <br>
                        <input class="search" type="text" palceholder="Input admin..." name="admin_id" required
                               value="<%= rs.getString("admin_id") %>">
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
