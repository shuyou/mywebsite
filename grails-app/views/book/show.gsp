
<%@ page import="mywebsite.Book" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-book" class="content scaffold-show" role="main">
            <div class="list-title"><span class="titlefont"><g:message code="default.list.label" args="[entityName]" /></span></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list book">
			
				<g:if test="${bookInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="book.author.label" default="Author" /></span>
					
						<span class="property-value" aria-labelledby="author-label"><g:fieldValue bean="${bookInstance}" field="author"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.bookname}">
				<li class="fieldcontain">
					<span id="bookname-label" class="property-label"><g:message code="book.bookname.label" default="Bookname" /></span>
					
						<span class="property-value" aria-labelledby="bookname-label"><g:fieldValue bean="${bookInstance}" field="bookname"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.picurl}">
				<li class="fieldcontain">
					<span id="picurl-label" class="property-label"><g:message code="book.picurl.label" default="Picurl" /></span>
					
						<span class="property-value" aria-labelledby="picurl-label"><g:fieldValue bean="${bookInstance}" field="picurl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.price}">
				<li class="fieldcontain">
					<span id="price-label" class="property-label"><g:message code="book.price.label" default="Price" /></span>
					
						<span class="property-value" aria-labelledby="price-label"><g:fieldValue bean="${bookInstance}" field="price"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.publish}">
				<li class="fieldcontain">
					<span id="publish-label" class="property-label"><g:message code="book.publish.label" default="Publish" /></span>
					
						<span class="property-value" aria-labelledby="publish-label"><g:fieldValue bean="${bookInstance}" field="publish"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bookInstance?.publishtime}">
				<li class="fieldcontain">
					<span id="publishtime-label" class="property-label"><g:message code="book.publishtime.label" default="Publishtime" /></span>
					
						<span class="property-value" aria-labelledby="publishtime-label"><g:formatDate date="${bookInstance?.publishtime}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${bookInstance?.id}" />
					<g:link class="edit" action="edit" id="${bookInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
