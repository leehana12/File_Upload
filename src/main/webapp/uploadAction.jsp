<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 파일 업로드</title>
</head>
<body>
<% 
	String directory = application.getRealPath("/uploac/");
	int maxSize = 1024 * 1024 * 100; // 100MB 까지만 가능. 1024는 2의 10성 - MB단위(용량)이다.
%>
</body>
</html>