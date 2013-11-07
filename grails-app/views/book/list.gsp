
<%@ page import="mywebsite.Book" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-book" class="content scaffold-list" role="main">
            <div class="list-title"><span class="titlefont"><g:message code="default.list.label" args="[entityName]" /></span></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="author" title="${message(code: 'book.author.label', default: 'Author')}" />
					
						<g:sortableColumn property="bookname" title="${message(code: 'book.bookname.label', default: 'Bookname')}" />
					
						<g:sortableColumn property="picurl" title="${message(code: 'book.picurl.label', default: 'Picurl')}" />
					
						<g:sortableColumn property="price" title="${message(code: 'book.price.label', default: 'Price')}" />
					
						<g:sortableColumn property="publish" title="${message(code: 'book.publish.label', default: 'Publish')}" />
					
						<g:sortableColumn property="publishtime" title="${message(code: 'book.publishtime.label', default: 'Publishtime')}" />
					    <th>操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${bookInstanceList}" status="i" var="bookInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${bookInstance.id}">${fieldValue(bean: bookInstance, field: "author")}</g:link></td>
					
						<td>${fieldValue(bean: bookInstance, field: "bookname")}</td>
					
						<td>${fieldValue(bean: bookInstance, field: "picurl")}</td>
					
						<td>${fieldValue(bean: bookInstance, field: "price")}</td>
					
						<td>${fieldValue(bean: bookInstance, field: "publish")}</td>
					
						<td><g:formatDate date="${bookInstance.publishtime}" /></td>
					    <td>
                            <g:link class="edit" action="edit" id="${bookInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />					    </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${bookInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
