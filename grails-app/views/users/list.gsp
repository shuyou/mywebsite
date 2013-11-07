
<%@ page import="mywebsite.Users" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'users.label', default: 'Users')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>

    <div id="list-users" class="content scaffold-list" role="main">
        <div class="list-title"><span class="titlefont"><g:message code="default.list.label" args="[entityName]" /></span></div>
            <g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'users.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'users.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="birthday" title="${message(code: 'users.birthday.label', default: 'Birthday')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'users.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'users.phone.label', default: 'Phone')}" />
					
						<g:sortableColumn property="qq" title="${message(code: 'users.qq.label', default: 'Qq')}" />
					    <th>操作</th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${usersInstanceList}" status="i" var="usersInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${usersInstance.id}">${fieldValue(bean: usersInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: usersInstance, field: "password")}</td>
					
						<td><g:formatDate date="${usersInstance.birthday}" /></td>
					
						<td>${fieldValue(bean: usersInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: usersInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: usersInstance, field: "qq")}</td>
					    <td>
                            <g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
                            <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
					    </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usersInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
