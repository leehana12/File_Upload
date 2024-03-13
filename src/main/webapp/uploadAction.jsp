<%@page import="file.FileDAO"%>
<%@page import="java.io.File"%>

<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="javax.swing.DefaultBoundedRangeModel"%>

<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	String directory = application.getRealPath("/upload/"); //경로지정
	int maxSize = 1024 * 1024 * 100; // 100MB 까지만 가능. 1024는 2의 10성 - MB단위(용량)이다.
	String encoding = "UTF-8"; // 한글파일 사용
	
	MultipartRequest multiparRequest //
	= new MultipartRequest(request, directory, maxSize, encoding, 
			new DefaultFileRenamePolicy()); // 동일한이름이 있을때 동일한 이름이 들어오면 새로운이름으로 바꾸는 정챙
	
	String fileName = multiparRequest.getOriginalFileName("file"); 
	String fileRealName = multiparRequest.getFilesystemName("file");
	
	new FileDAO().upload(fileName, fileRealName);
	out.write("파일명: " + fileName + "<br>" );
	out.write("실제파일명: " + fileRealName + "<br>" );
	
	
%>
</body>
</html>


