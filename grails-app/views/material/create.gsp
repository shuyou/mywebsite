<%@ page import="mywebsite.Material" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'material.label', default: 'Material')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="create-material" class="content scaffold-create" role="main">
            <div class="list-title"><span class="titlefont"><g:message code="default.list.label" args="[entityName]" /></span></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${materialInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${materialInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>