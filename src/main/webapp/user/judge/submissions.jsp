﻿<%--
    Document   : submissions
    Created on : Apr 30, 2021, 12:22:16 AM
    Author     : kanye
--%>

<%@ page import="com.tridiots.cms.kanye.IO"%>
<%@ page import="com.tridiots.cms.models.Submission" %>
<%@ page import="com.tridiots.cms.utils.modeldao.SubmissionUtils" %>
<%@ page import="com.tridiots.cms.utils.modeldao.ContestantUtils" %>
<%@ page import="com.tridiots.cms.utils.modeldao.UserUtils" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.tridiots.cms.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Table - CMS</title>
    <link rel="stylesheet" href="../../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="../../assets/fonts/fontawesome-all.min.css">
    <link rel="stylesheet" href="../../assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="../../assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="../../assets/css/styles.css">
</head>

<%
ArrayList<Submission> submissions = SubmissionUtils.getSubmissions();
%>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark sticky-top align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0" style="background: var(--indigo);height: 100%;">
            <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-book-open"></i></div>
                    <div class="sidebar-brand-text mx-3"><span>CMS</span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item"><a class="nav-link" href="dashboard.html"><i class="fas fa-tachometer-alt"></i><span>Dashboard</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="../profile.jsp"><i class="fas fa-user"></i><span>Profile</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="contestants.jsp"><i class="fa fa-users"></i><span>Contestants</span></a></li>
                    <li class="nav-item"><a class="nav-link active" href="submissions.jsp"><i class="fas fa-table"></i><span>Submissions</span></a></li>
                    <li class="nav-item">
                        <div style="text-align: center;">
                            <form class="form-inline" style="padding:8px;"><button class="btn btn-primary" type="submit" style="margin: auto;background: rgb(255,255,255);color: var(--purple);" name="action" value="Sign Out"><i class="fa fa-sign-out"></i>&nbsp;Sign Out</button></form>
                        </div>
                    </li>
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
                    <h3 class="text-dark mb-4">Submissions</h3>
                    <div class="card shadow">
                        <div class="card-header py-3">
                            <p class="text-primary m-0 font-weight-bold">Info</p>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 text-nowrap">
                                    <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable"><label>Show&nbsp;<select class="form-control form-control-sm custom-select custom-select-sm">
                                                <option value="10" selected="">10</option>
                                                <option value="25">25</option>
                                                <option value="50">50</option>
                                                <option value="100">100</option>
                                            </select>&nbsp;</label></div>
                                </div>
                                <div class="col-md-6">
                                    <div class="text-md-right dataTables_filter" id="dataTable_filter"><label><input type="search" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search"></label></div>
                                </div>
                            </div>
                            <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                                <table class="table my-0" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>User</th>
                                            <th>Poem Title</th>
                                            <th>Submission Date</th>
                                            <th>Final Grade (/100)</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	
                                    	<% if (submissions != null) {
                                    		for(Submission submission : submissions) {
                                    			int conid = submission.getContestantId();
                                    			int uid = ContestantUtils.getUserIdFromConId(conid);
                                    			String username = (UserUtils.getUser(uid)).getUserName();
                                    			DecimalFormat decimalFormat = new DecimalFormat("#.00");
                                    			String submissionGrade = decimalFormat.format(submission.getSubmissionFinalGrade());
                                    			%>
                                    			<tr>
                                                	<td><img class="rounded-circle mr-2" width="30" height="30" src="avatars/avatar1.jpeg"><%=username %></td>
                                                	<td><%=submission.getSubmissionPoemTitle() %></td>
                                                	<td><%=submission.getSubmissionDate() %></td>
                                                	<td><%=String.valueOf(submissionGrade) %></td>
                                                	<td>
                                                		<form action="submissions" method="get">
                                                    		<div class="form-row">
                                                    			<input type="hidden" name="conid" value="<%=conid%>">
                                                    			<input type="hidden" name="uid" value="<%=uid %>">
                                                    			<input type="hidden" name="subid" value="<%=submission.getSubmissionId() %>">
                                                        		<div class="col"><button class="btn btn-primary" type="submit" name="action" value="view">View</button></div>
                                                    		</div>
                                                		</form>
                                                	</td>
                                            	</tr>
                                    		<% }
                                    	} %>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td><strong>User</strong></td>
                                            <td><strong>Poem Title</strong></td>
                                            <td><strong>Submission Date</strong></td>
                                            <td><strong>Final Grade (/100)</strong></td>
                                            <td><strong>Action</strong></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-md-6 align-self-center">
                                    <p id="dataTable_info" class="dataTables_info" role="status" aria-live="polite">Showing 1 to 10 of 27</p>
                                </div>
                                <div class="col-md-6">
                                    <nav class="d-lg-flex justify-content-lg-end dataTables_paginate paging_simple_numbers">
                                        <ul class="pagination">
                                            <li class="page-item disabled"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                                            <li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                                        </ul>
                                    </nav>
                                </div>
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
    <script src="../../assets/js/jquery.min.js"></script>
    <script src="../../assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../assets/js/chart.min.js"></script>
    <script src="../../assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.js"></script>
    <script src="../../assets/js/theme.js"></script>
</body>

</html>