<%@ page import="mywebsite.Notice" %>
<meta name="layout" content="admin">


<div class="fieldcontain ${hasErrors(bean: noticeInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="notice.content.label" default="Content" />
		
	</label>
	<g:textField name="content" value="${noticeInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: noticeInstance, field: 'createtime', 'error')} required">
	<label for="createtime">
		<g:message code="notice.createtime.label" default="Createtime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createtime" precision="day"  value="${noticeInstance?.createtime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: noticeInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="notice.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${noticeInstance?.title}"/>
</div>

