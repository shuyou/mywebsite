
<%@ page import="mywebsite.Animation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'animation.label', default: 'Animation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-animation" class="content scaffold-list" role="main">
            <div class="list-title"><span class="titlefont"><g:message code="default.list.label" args="[entityName]" /></span></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="content" title="${message(code: 'animation.content.label', default: 'Content')}" />
					
						<g:sortableColumn property="createtime" title="${message(code: 'animation.createtime.label', default: 'Createtime')}" />
					
						<g:sortableColumn property="picurl" title="${message(code: 'animation.picurl.label', default: 'Picurl')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'animation.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="videourl" title="${message(code: 'animation.videourl.label', default: 'Videourl')}" />
					    <th>操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${animationInstanceList}" status="i" var="animationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${animationInstance.id}">${fieldValue(bean: animationInstance, field: "content")}</g:link></td>
					
						<td><g:formatDate date="${animationInstance.createtime}" /></td>
					
						<td>${fieldValue(bean: animationInstance, field: "picurl")}</td>
					
						<td>${fieldValue(bean: animationInstance, field: "title")}</td>
					
						<td>${fieldValue(bean: animationInstance, field: "videourl")}</td>
					     <td>
                             <g:link class="edit" action="edit" id="${animationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                             <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					     </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${animationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
