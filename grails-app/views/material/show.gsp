
<%@ page import="mywebsite.Material" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'material.label', default: 'Material')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>

		<div id="show-material" class="content scaffold-show" role="main">
            <div class="list-title"><span class="titlefont"><g:message code="default.list.label" args="[entityName]" /></span></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list material">
			
				<g:if test="${materialInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="material.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${materialInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialInstance?.createtime}">
				<li class="fieldcontain">
					<span id="createtime-label" class="property-label"><g:message code="material.createtime.label" default="Createtime" /></span>
					
						<span class="property-value" aria-labelledby="createtime-label"><g:formatDate date="${materialInstance?.createtime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialInstance?.picurl}">
				<li class="fieldcontain">
					<span id="picurl-label" class="property-label"><g:message code="material.picurl.label" default="Picurl" /></span>
					
						<span class="property-value" aria-labelledby="picurl-label"><g:fieldValue bean="${materialInstance}" field="picurl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materialInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="material.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${materialInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${materialInstance?.id}" />
					<g:link class="edit" action="edit" id="${materialInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
