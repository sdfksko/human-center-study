<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- header section -->
<%@ include file="/WEB-INF/views/layouts/header.jsp" %>

<!-- body section -->
<form action="/articles/update" method="post" class="container">
    <input type="hidden" name="id" value='<c:out value="${article.id}" />'>
    <div class="mb-3">
        <label class="form-label">제목</label>
        <input type="text" class="form-control" name="title" value='<c:out value="${article.title}" />'>
    </div>
    <div class="mb-3">
        <label class="form-label">내용</label>
        <textarea class="form-control" rows="3" name="content"><c:out value="${article.content}" /></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
    <a href='/articles/<c:out value="${article.id}" />'>Back</a>
</form>

<!-- footer section -->
<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>