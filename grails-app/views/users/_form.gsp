<%@ page import="mywebsite.Users" %>
<meta name="layout" content="admin">


<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'username', 'error')} ">
	<label for="username">
		<g:message code="users.username.label" default="Username" />
		
	</label>
	<g:textField name="username" value="${usersInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="users.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${usersInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'birthday', 'error')} required">
	<label for="birthday">
		<g:message code="users.birthday.label" default="Birthday" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthday" precision="day"  value="${usersInstance?.birthday}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="users.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${usersInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="users.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" value="${usersInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'qq', 'error')} ">
	<label for="qq">
		<g:message code="users.qq.label" default="Qq" />
		
	</label>
	<g:textField name="qq" value="${usersInstance?.qq}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="users.question.label" default="Question" />
		
	</label>
	<g:textField name="question" value="${usersInstance?.question}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'registerreason', 'error')} ">
	<label for="registerreason">
		<g:message code="users.registerreason.label" default="Registerreason" />
		
	</label>
	<g:textField name="registerreason" value="${usersInstance?.registerreason}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usersInstance, field: 'truename', 'error')} ">
	<label for="truename">
		<g:message code="users.truename.label" default="Truename" />
		
	</label>
	<g:textField name="truename" value="${usersInstance?.truename}"/>
</div>

