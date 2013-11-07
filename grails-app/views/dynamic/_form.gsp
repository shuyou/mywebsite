<%@ page import="mywebsite.Dynamic" %>
<meta name="layout" content="admin">


<div class="fieldcontain ${hasErrors(bean: dynamicInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="dynamic.content.label" default="Content" />
		
	</label>
	<g:textField name="content" value="${dynamicInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: dynamicInstance, field: 'createtime', 'error')} required">
	<label for="createtime">
		<g:message code="dynamic.createtime.label" default="Createtime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createtime" precision="day"  value="${dynamicInstance?.createtime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: dynamicInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="dynamic.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${dynamicInstance?.title}"/>
</div>

