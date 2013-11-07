<%@ page import="mywebsite.Book" %>
<meta name="layout" content="admin">


<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'author', 'error')} ">
	<label for="author">
		<g:message code="book.author.label" default="Author" />
		
	</label>
	<g:textField name="author" value="${bookInstance?.author}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'bookname', 'error')} ">
	<label for="bookname">
		<g:message code="book.bookname.label" default="Bookname" />
		
	</label>
	<g:textField name="bookname" value="${bookInstance?.bookname}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'picurl', 'error')} ">
	<label for="picurl">
		<g:message code="book.picurl.label" default="Picurl" />
		
	</label>
	<g:textField name="picurl" value="${bookInstance?.picurl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'price', 'error')} ">
	<label for="price">
		<g:message code="book.price.label" default="Price" />
		
	</label>
	<g:textField name="price" value="${bookInstance?.price}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'publish', 'error')} ">
	<label for="publish">
		<g:message code="book.publish.label" default="Publish" />
		
	</label>
	<g:textField name="publish" value="${bookInstance?.publish}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: bookInstance, field: 'publishtime', 'error')} required">
	<label for="publishtime">
		<g:message code="book.publishtime.label" default="Publishtime" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="publishtime" precision="day"  value="${bookInstance?.publishtime}"  />
</div>

