<%-- 
    Document   : contact
    Created on : Jul 13, 2022, 6:26:16 PM
    Author     : Lattae
--%>

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
        body{
            background-image: url("public/assets/backend/image/baju.png");
        }
    </style>
        
        <jsp:include page='layouts/head.jsp'>
            <jsp:param name="title" value="Contact" />
        </jsp:include>
    </head>
    <body>
        <jsp:include page='layouts/navbar.jsp'></jsp:include>
        
        <div class="row">
        <div class="col-sm-12 col-m-12 col-12 text-center">  
            <div class="contact">
              <p style="text-align:center; margin-top:120px;padding: 10px;">Contact Us</p>
            </div>
        </div>
    </div>

    <div class="row">   
        <div class="col-sm-12 col-m-12 col-12 text-center catalog-subtitle slider-wrapper about-us">
        <div class="card2" style="background-color: #688ea4;">
          <p style="color:white; margin-top: 20px; margin-bottom: -20px;"> For more information ragarding our product
            and product purchases, please visit our social media or contact us on our social media bellow:
          </p>
        </div>
    </div>
  </div>   

<div class="row">
    <div class="col-12 padding-top">
        <div class="row">
            <div class="col-sm-12 col-m-12 col-4 margin-m">
                <div class="card opacity" style="width: 40%;">
                      <div class="container">
                          <p class="creator-title">Instagram</p>
                          <a href="https://instagram.com/"  style="text-decoration:none;">
                            <img src="public/assets/backend/image/ig.png"  width="90" height="90"></a>
                      </div>
                </div>
            </div>

            <div class="col-sm-12 col-m-12 col-4 margin-m ">
                <div class="card opacity" style="width: 40%;">
                      <div class="container">
                          <p class="creator-title">Facebook</p>
                          <a href="https://facebook.com/"  style="text-decoration:none;">
                            <img src="public/assets/backend/image/fb.png"  width="90" height="90"></a>
                      </div>
                </div>
            </div>

            <div class="col-sm-12 col-m-12 col-4 margin-m">
                <div class="card opacity" style="width: 40%;">
                      <div class="container">
                          <p class="creator-title">WhatsApp</p>
                            <a href="https://web.whatsapp.com/" style="text-decoration: none;">
                            <img src="public/assets/backend/image/wa.png"  width="90" height="90"></a>
                      </div>
                </div>
            </div>
        </div>
    </div>
</div>

        <div class="col-12 col-m-12 col-sm-12" style="margin-top: 60px;">
                <jsp:include page='layouts/footer.jsp'></jsp:include>
        </div>
        <jsp:include page='layouts/scripts.js'></jsp:include>
        <jsp:include page='layouts/scripts2.js'></jsp:include>
    </body>
</html>
