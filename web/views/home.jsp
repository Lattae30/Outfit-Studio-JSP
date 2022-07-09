<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="public/assets/backend/extra.css">
        <link rel="stylesheet" href="public/assets/backend/main.css">
        <jsp:include page='layouts/head.jsp'>
            <jsp:param name="title" value="Home" />
        </jsp:include>
    </head>
    <body >
        <jsp:include page='layouts/navbar.jsp'></jsp:include>
        
        <!-- Begin page content -->
        <div class="row">
            <div class="col-sm-12 col-m-12 col-12 text-center slider-wrapper">
                <p style="font-size:2.5rem; margin-top: -20px; margin-bottom: -25px;"><i style="color:#324854"><b>Outfit</b></i> <i style="color:#a08669"><b>Studio</b></i></p>
                <p class="text-center catalog-subtitle" style="margin-top: 30px;margin-bottom: -15px;">Admin Page</p>
                <img class="card-image" src="public/assets/backend/image/slidebar.png" alt="Slidebar Photo 1">
                <img class="card-image" src="public/assets/backend/image/slidebar1.png" alt="Slidebar Photo">
                <img class="card-image" src="public/assets/backend/image/slidebar2.png" alt="Slidebar Photo">
            </div>
            <div class="col-sm-12 col-m-12 col-12 text-center catalog-title" >
                <p><b>Welcome to <i style="color:#324854">Outfit</i> <i style="color:#a08669">Studio</i> Admin Page</b></p>
            </div>
        </div>
        
        <div class="col-12 col-m-12 col-sm-12">
                <jsp:include page='layouts/footer.jsp'></jsp:include>
        </div>
        
        <jsp:include page='layouts/scripts.js'></jsp:include>
        <jsp:include page='layouts/scripts2.js'></jsp:include>
    </body>
</html>
