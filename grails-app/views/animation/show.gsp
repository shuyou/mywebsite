
<%@ page import="mywebsite.Animation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="admin">
		<g:set var="entityName" value="${message(code: 'animation.label', default: 'Animation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-animation" class="content scaffold-show" role="main">
            <div class="list-title"><span class="titlefont"><g:message code="default.list.label" args="[entityName]" /></span></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list animation">
			
				<g:if test="${animationInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="animation.content.label" default="Content" /></span>
					
						<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${animationInstance}" field="content"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${animationInstance?.createtime}">
				<li class="fieldcontain">
					<span id="createtime-label" class="property-label"><g:message code="animation.createtime.label" default="Createtime" /></span>
					
						<span class="property-value" aria-labelledby="createtime-label"><g:formatDate date="${animationInstance?.createtime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${animationInstance?.picurl}">
				<li class="fieldcontain">
					<span id="picurl-label" class="property-label"><g:message code="animation.picurl.label" default="Picurl" /></span>
					
						<span class="property-value" aria-labelledby="picurl-label"><g:fieldValue bean="${animationInstance}" field="picurl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${animationInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="animation.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${animationInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${animationInstance?.videourl}">
				<li class="fieldcontain">
					<span id="videourl-label" class="property-label"><g:message code="animation.videourl.label" default="Videourl" /></span>
					
						<span class="property-value" aria-labelledby="videourl-label"><g:fieldValue bean="${animationInstance}" field="videourl"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${animationInstance?.id}" />
					<g:link class="edit" action="edit" id="${animationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
