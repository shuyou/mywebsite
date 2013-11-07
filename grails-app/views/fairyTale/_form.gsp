<%@ page import="mywebsite.FairyTale" %>
<meta name="layout" content="admin">


<div class="fieldcontain ${hasErrors(bean: fairyTaleInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="fairyTale.content.label" default="Content" />
		
	</label>
	<g:textField name="content" value="${fairyTaleInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fairyTaleInstance, field: 'createtime', 'error')} required">
	<label for="createtime">
		<g:message code="fairyTale.createtime.label" default="Createtime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createtime" precision="day"  value="${fairyTaleInstance?.createtime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: fairyTaleInstance, field: 'picurl', 'error')} ">
	<label for="picurl">
		<g:message code="fairyTale.picurl.label" default="Picurl" />
		
	</label>
	<g:textField name="picurl" value="${fairyTaleInstance?.picurl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fairyTaleInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="fairyTale.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${fairyTaleInstance?.title}"/>
</div>

