
<%@ page import="mywebsite.Dynamic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'dynamic.label', default: 'Dynamic')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-dynamic" class="content scaffold-list" role="main">
            <div class="list-title"><span class="titlefont"><g:message code="default.list.label" args="[entityName]" /></span></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="content" title="${message(code: 'dynamic.content.label', default: 'Content')}" />
					
						<g:sortableColumn property="createtime" title="${message(code: 'dynamic.createtime.label', default: 'Createtime')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'dynamic.title.label', default: 'Title')}" />
					     <th>操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${dynamicInstanceList}" status="i" var="dynamicInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dynamicInstance.id}">${fieldValue(bean: dynamicInstance, field: "content")}</g:link></td>
					
						<td><g:formatDate date="${dynamicInstance.createtime}" /></td>
					
						<td>${fieldValue(bean: dynamicInstance, field: "title")}</td>
					     <td>
                             <g:link class="edit" action="edit" id="${dynamicInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                             <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					     </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${dynamicInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
