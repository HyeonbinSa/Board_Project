<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="include/header.jsp" %>
<section class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="box-header with-border">
				<h1>
					Hello world!  
				</h1>
				
				<P>  The time on the server is ${serverTime}. </P>
				<hr>
				<form method="get">
				<input type	="submit" value="등록"></input>
				</form>	
			</div>
		</div>
	</div>
</section>

<%@include file="include/footer.jsp" %>
