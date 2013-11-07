
<%@ page import="mywebsite.Users" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'users.label', default: 'Users')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-users" class="content scaffold-show" role="main">
        <div class="list-title"><span class="titlefont"><g:message code="default.list.label" args="[entityName]" /></span></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list users">
			
				<g:if test="${usersInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="users.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${usersInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usersInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="users.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${usersInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usersInstance?.birthday}">
				<li class="fieldcontain">
					<span id="birthday-label" class="property-label"><g:message code="users.birthday.label" default="Birthday" /></span>
					
						<span class="property-value" aria-labelledby="birthday-label"><g:formatDate date="${usersInstance?.birthday}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${usersInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="users.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${usersInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usersInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="users.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${usersInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usersInstance?.qq}">
				<li class="fieldcontain">
					<span id="qq-label" class="property-label"><g:message code="users.qq.label" default="Qq" /></span>
					
						<span class="property-value" aria-labelledby="qq-label"><g:fieldValue bean="${usersInstance}" field="qq"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usersInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="users.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:fieldValue bean="${usersInstance}" field="question"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usersInstance?.registerreason}">
				<li class="fieldcontain">
					<span id="registerreason-label" class="property-label"><g:message code="users.registerreason.label" default="Registerreason" /></span>
					
						<span class="property-value" aria-labelledby="registerreason-label"><g:fieldValue bean="${usersInstance}" field="registerreason"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${usersInstance?.truename}">
				<li class="fieldcontain">
					<span id="truename-label" class="property-label"><g:message code="users.truename.label" default="Truename" /></span>
					
						<span class="property-value" aria-labelledby="truename-label"><g:fieldValue bean="${usersInstance}" field="truename"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${usersInstance?.id}" />
					<g:link class="edit" action="edit" id="${usersInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
