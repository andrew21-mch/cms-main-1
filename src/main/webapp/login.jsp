<%-- 
    Document   : login
    Created on : Apr 30, 2021, 12:22:16 AM
    Author     : kanye
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Login - CMS</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/css/styles.min.css">
</head>

<% 
String sessionMessage = (String) request.getSession().getAttribute("errorMessage");
String attribMessage = (String) request.getAttribute("errorMessage");
%>



<body class="bg-gradient-primary" style="background: var(--indigo);">
    <div class="container" id="login-container">
        <div class="row justify-content-center">
            <div class="col-md-9 col-lg-12 col-xl-10">
                <div class="card shadow-lg o-hidden border-0 my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-flex">
                                <div class="flex-grow-1 bg-login-image" style="background-image: url(&quot;assets/img/dogs/image3.jpeg&quot;);"></div>
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h4 class="text-dark mb-4">Welcome Back!</h4>
                                    </div>
                                    <form class="user" action="login" method="post">
                                        <hr>
                                        <input type="hidden" name="requestSource" value="login.jsp">
                                        <div class="form-group"><input class="form-control form-control-user" type="text" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter Email Address or Username..." name="login" required=""></div>
                                        <div class="form-group"><input class="form-control form-control-user" type="password" id="exampleInputPassword" placeholder="Password" name="password" required=""></div>
                                        
                                        <!--<!--  JSP for error message -->
                                        <%
                                            
                                            String message = (String) request.getAttribute("errorMessage");
                                            if(sessionMessage != null) { %>
                                            <div class="form-group" style="text-align: center; color: red"><%= sessionMessage %></div>
                                        <% } else if(attribMessage != null) { %>
                                        	<div class="form-group" style="text-align: center; color: red"><%= attribMessage %></div>
                                        <% } %>
                                       
                                        <!--EL Ending -->
                                        
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <div class="form-check"><input class="form-check-input custom-control-input" type="checkbox" id="formCheck-1"><label class="form-check-label custom-control-label" for="formCheck-1">Remember Me</label></div>
                                            </div>
                                        </div><button class="btn btn-primary btn-block text-white btn-user" type="submit" style="background: var(--purple);">Login</button>
                                        
                                        
                                        
                                        <hr>
                                    </form>
                                    <div class="text-center"><a class="small" href="forgot-password.html" style="color: var(--purple);">Forgot Password?</a></div>
                                    <div class="text-center"><a class="small" href="register.html" style="color: var(--purple);">Create an Account!</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/chart.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="assets/js/script.min.js"></script>
</body>

</html>