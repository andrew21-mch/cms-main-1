﻿<%--
    Document   : submit
    Created on : Apr 30, 2021, 12:22:16 AM
    Author     : kanye
--%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.tridiots.cms.kanye.DoubleObject" %>
<%@ page import="com.tridiots.cms.kanye.IO"%>
<%@ page import="com.tridiots.cms.models.Contestant"%>

<%@ page import="com.tridiots.cms.models.User" %>
<%@ page import="com.tridiots.cms.utils.modeldao.ContestantUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Blank Page - CMS</title>
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="../assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="../assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="../assets/css/styles.css">
</head>

<%
Contestant loggedInContestant = (Contestant) request.getSession().getAttribute("loggedInContestant");
String message = (String) request.getAttribute("message");

if(loggedInContestant == null) {
	/*request.getSession().setAttribute("redirMessage", "You need to apply for the contest first");
	response.sendRedirect(request.getContextPath() + "/user/apply-contest.jsp");
		
		request.setAttribute("message", "You need to apply for the contest first");
		request.getRequestDispatcher("/user/apply-contest").forward(request, response);
	*/
}
%>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark sticky-top align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0" style="background: var(--indigo);height: 100%;">
            <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-laugh-wink"></i></div>
                    <div class="sidebar-brand-text mx-3"><span>CMS</span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item"><a class="nav-link" href="profile.jsp"><i class="fas fa-user"></i><span>Profile</span></a></li>
                     <li class="nav-item"><a class="nav-link" href="apply-contest.jsp"><i class="fa fa-play"></i><span>Apply for Contest</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="#"><i class="fa fa-play"></i><span>Submit Poem</span></a></li>
                    <li class="nav-item">
                        <div style="text-align: center;">
                            <form class="form-inline" style="padding:8px;" action="logout"><button class="btn btn-primary" type="submit" style="margin: auto;background: rgb(255,255,255);color: var(--purple);" name="action" value="Sign Out"><i class="fa fa-sign-out"></i>&nbsp;Sign Out</button></form>
                        </div>
                    </li>
                    <li class="nav-item"></li>
                </ul>
                <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle mr-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <form class="form-inline d-none d-sm-inline-block mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">
                                <div class="input-group-append"><button class="btn btn-primary py-0" type="button" style="background: var(--purple);"><i class="fas fa-search"></i></button></div>
                            </div>
                        </form>
                        <ul class="navbar-nav flex-nowrap ml-auto">
                            <li class="nav-item dropdown no-arrow">
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#"><span class="d-none d-lg-inline mr-2 text-gray-600 small">{{username}}</span><img class="border rounded-circle img-profile" src="avatars/avatardeaedae1.jpeg" alt="{{profile-image}}"></a>
                                    <div class="dropdown-menu shadow dropdown-menu-right animated--grow-in"><a class="dropdown-item" href="../profile.html"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Profile</a><a class="dropdown-item" href="#"><i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Settings</a><a class="dropdown-item" href="#"><i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Activity log</a>
                                        <div class="dropdown-divider"></div><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Logout</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="container-fluid">
                    <h3 class="text-dark mb-1">Submit your poem</h3>
                </div>
                <div class="card shadow-lg o-hidden border-0 my-5">
                    <div class="card-body p-0">
                        <div class="container">
                            <div class="para-5">
                                <div class="text-center">
                                    <h4 class="text-dark mb-4">Confirm Your Information</h4>
                                </div>
                                <% if (loggedInContestant != null) { %>
                                	<form class="user" action="submit" method="post">
                                    <hr>
                                    <div class="form-group row">
                                    	<input type="hidden" name="conid" value="<%=loggedInContestant.getContestantId() %>" >
                                        <div class="col-sm-6 mb-3 mb-sm-0"><input class="form-control form-control-user" type="text" id="firstName" placeholder="First Name" name="first_name" value="<%=loggedInContestant.getUserFirstName() %>" required=""></div>
                                        <div class="col-sm-6"><input class="form-control form-control-user" type="text" id="lastName" placeholder="Last Name" name="last_name" value="<%=loggedInContestant.getUserLastName() %>" required=""></div>
                                    </div>
                                    <div class="form-group"><input class="form-control form-control-user" type="email" id="inputEmail" aria-describedby="emailHelp" placeholder="Email Address" name="email" value="<%=loggedInContestant.getUserEmail() %>" required=""></div>
                                    <div class="form-group"><input class="form-control form-control-user" type="text" id="inputPoemTitle" aria-describedby="emailHelp" placeholder="My Poem" name="poemTitle" value="" required=""></div>
                                    
                                    <div class="form-group row" id="file-upload-wrapper">
                                        <div class="container">
                                            <h5>Poem in Itangi-Kom</h5><textarea class="form-control text-area-submit" cols="100%" rows="12" name="komPoem"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row" id="file-upload-wrapper">
                                        <div class="container">
                                            <h5>Poem in English</h5><textarea class="form-control text-area-submit" cols="100%" rows="12" name="engPoem"></textarea>
                                        </div>
                                    </div>
                                    
                                    <% if(message != null) { %>
                                    
                                    	<div class="form-group row" id="file-upload-wrapper">
                                        	<div class="container" style="text-align:center;">
                                           		<span style="color: red;"><%=message %></span>
                                        	</div>
                                    	</div>
                                    <% } %>
                                    
                                    <div id="submit-button-wrapper" class="form-control-user"><button class="btn btn-primary btn-block text-white btn-user" type="submit" name="action" value="submit" style="background: var(--purple);">Submit</button></div>
                                    <hr>
                                </form>
                            
                                <%} else { 
                                	request.getSession().setAttribute("redirMessage", "You need to apply for the contest first");
                                	response.sendRedirect(request.getContextPath() + "/user/apply-contest.jsp");
                                } %>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright © CMS 2021</span></div>
                </div>
            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../assets/js/chart.min.js"></script>
    <script src="../assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="../assets/js/theme.js"></script>
</body>

</html>