<%@ page import="mywebsite.Animation" %>
<meta name="layout" content="admin">


<div class="fieldcontain ${hasErrors(bean: animationInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="animation.content.label" default="Content" />
		
	</label>
	<g:textField name="content" value="${animationInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: animationInstance, field: 'createtime', 'error')} required">
	<label for="createtime">
		<g:message code="animation.createtime.label" default="Createtime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createtime" precision="day"  value="${animationInstance?.createtime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: animationInstance, field: 'picurl', 'error')} ">
	<label for="picurl">
		<g:message code="animation.picurl.label" default="Picurl" />
		
	</label>
	<g:textField name="picurl" value="${animationInstance?.picurl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: animationInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="animation.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${animationInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: animationInstance, field: 'videourl', 'error')} ">
	<label for="videourl">
		<g:message code="animation.videourl.label" default="Videourl" />
		
	</label>
	<g:textField name="videourl" value="${animationInstance?.videourl}"/>
</div>

