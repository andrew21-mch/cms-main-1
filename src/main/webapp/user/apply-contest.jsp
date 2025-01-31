﻿<%--
    Document   : apply-contest
    Created on : Apr 30, 2021, 12:22:16 AM
    Author     : kanye
--%>


<%@ page import="com.tridiots.cms.kanye.IO"%>
<%@ page import="com.tridiots.cms.models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Profile - CMS</title>
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="../assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="../assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="../assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="../assets/css/styles.css">
</head>

<% User user = (User) request.getSession().getAttribute("loggedInUser"); %>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark sticky-top align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0" style="background: var(--indigo);height: 100%;">
            <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-book-open"></i></div>
                    <div class="sidebar-brand-text mx-3"><span>CMS</span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item"><a class="nav-link" href="profile.jsp"><i class="fas fa-user"></i><span>Profile</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="apply-contest.jsp"><i class="fa fa-play"></i><span>Apply for Contest</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="submit.jsp"><i class="fa fa-play"></i><span>Submit Poem</span></a></li>
                    <li class="nav-item">
                        <div style="text-align: center;">
                            <form class="form-inline" style="padding:8px;" action = "logout"><button class="btn btn-primary" type="submit" style="margin: auto;background: rgb(255,255,255);color: var(--purple);" name="action" value="Sign Out"><i class="fa fa-sign-out"></i>&nbsp;Sign Out</button></form>
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
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-toggle="dropdown" href="#"><span class="d-none d-lg-inline mr-2 text-gray-600 small">{{username}}</span><img class="border rounded-circle img-profile" src="avatars/avatar1.jpeg"></a>
                                    <div class="dropdown-menu shadow dropdown-menu-right animated--grow-in"><a class="dropdown-item" href="#"><i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Profile</a><a class="dropdown-item" href="#"><i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Settings</a><a class="dropdown-item" href="#"><i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Activity log</a>
                                        <div class="dropdown-divider"></div><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>&nbsp;Logout</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="container-fluid">
                    <h3 class="text-dark mb-4">Apply for the Contest</h3>
                    <section class="apply-content-section">
                        <div>
                            <p class="text-center" style="font-weight: 100;"><br><strong>Thank you for taking the time to apply to be in Itangi-Kom Poetry Contest.&nbsp;</strong><br><strong>Complete the form below and your application will be verified.</strong><br><br></p>
                        </div>
                        <div>
                            <hr style="border-width: 4px;">
                        </div>
                        <form action="apply-contest" method="post">
                        	<div class="form-container">
                        	
                        		<input type="hidden" name="uid" value="<%=user.getUserId() %>" >
                            	<div class="row">
                               		<div class="col">
                                    	<div class="form-group"><label class="field-label-appl">First Name</label><input type="text" class="form-control form-control-user text-input-round-border text-input-appl" name="first-name" value="<%=user.getUserFirstName() %>"></div>
                                	</div>
                                	<div class="col">
                                    	<div class="form-group"><label class="field-label-appl">Last Name</label><input type="text" class="form-control form-control-user text-input-round-border text-input-appl" name="first-name" value="<%=user.getUserLastName() %>"></div>
                                	</div>
                      			</div>
                      			<div class="row" style="text-align: center; align-content:center; margin: auto;">
                      				<!-- JSP for password check -->
                                	<%
                                		String redirMessage = (String) request.getSession().getAttribute("redirMessage");
                                   	 	String message = (String) request.getAttribute("errorMessage");
                      					if(redirMessage != null) { %>
                      						<div class="form-group" style="text-align: center; align-content:center; margin:auto; color: red"><%= redirMessage %></div>
                      					<% } else if(message != null) { %>
                                    		<div class="form-group" style="text-align: center; align-content:center; margin:auto; color: red"><%= message %></div>
                                    	<% }
                               		 %>
                      			</div>
                            
                            <div class="row">
                                <div class="col" style="text-align: center;">
                                    <p style="padding-top:16px;padding-bottom:16px;">By the clicking the "Confirm button, you agree to the terms and conditions of this competition.</p>
                                </div>
                            </div>
                            <div style="text-align: center;"><button class="btn btn-primary btn-user btn-confirm-appl" type="submit" style="border-style: none;border-radius: 32px;">Confirm</button></div>
                        	</div>
                        </form>
                        
                        <div>
                            <hr style="border-width: 4px;">
                        </div>
                    </section>
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