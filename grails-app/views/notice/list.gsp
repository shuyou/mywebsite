
<%@ page import="mywebsite.Notice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'notice.label', default: 'Notice')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-notice" class="content scaffold-list" role="main">
            <div class="list-title"><span class="titlefont"><g:message code="default.list.label" args="[entityName]" /></span></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="content" title="${message(code: 'notice.content.label', default: 'Content')}" />
					
						<g:sortableColumn property="createtime" title="${message(code: 'notice.createtime.label', default: 'Createtime')}" />
					
						<g:sortableColumn property="title" title="${message(code: 'notice.title.label', default: 'Title')}" />
					     <th>操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${noticeInstanceList}" status="i" var="noticeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${noticeInstance.id}">${fieldValue(bean: noticeInstance, field: "content")}</g:link></td>
					
						<td><g:formatDate date="${noticeInstance.createtime}" /></td>
					
						<td>${fieldValue(bean: noticeInstance, field: "title")}</td>
					     <td>
                             <g:link class="edit" action="edit" id="${noticeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                             <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                         </fieldset>
					     </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${noticeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
