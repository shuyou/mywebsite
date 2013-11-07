<%@ page import="mywebsite.Material" %>
<meta name="layout" content="admin">


<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="material.content.label" default="Content" />
		
	</label>
	<g:textField name="content" value="${materialInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'createtime', 'error')} required">
	<label for="createtime">
		<g:message code="material.createtime.label" default="Createtime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createtime" precision="day"  value="${materialInstance?.createtime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'picurl', 'error')} ">
	<label for="picurl">
		<g:message code="material.picurl.label" default="Picurl" />
		
	</label>
	<g:textField name="picurl" value="${materialInstance?.picurl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materialInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="material.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${materialInstance?.title}"/>
</div>

