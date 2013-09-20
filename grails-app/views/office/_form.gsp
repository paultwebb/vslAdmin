<%@ page import="gov.vt.vslAdmin.Office" %>



<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'officeCode', 'error')} required">
	<label for="officeCode">
		<g:message code="office.officeCode.label" default="Office Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="officeCode" maxlength="5" required="" value="${officeInstance?.officeCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'office', 'error')} required">
	<label for="office">
		<g:message code="office.office.label" default="Office" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="office" maxlength="25" required="" value="${officeInstance?.office}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="office.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="100" value="${officeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="office.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="branch" name="branch.id" from="${gov.vt.vslAdmin.Branch.list()}" optionKey="id" required="" value="${officeInstance?.branch?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'districts', 'error')} ">
	<label for="districts">
		<g:message code="office.districts.label" default="Districts" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${officeInstance?.districts?}" var="d">
    <li><g:link controller="district" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="district" action="create" params="['office.id': officeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'district.label', default: 'District')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'sessions', 'error')} ">
	<label for="sessions">
		<g:message code="office.sessions.label" default="Sessions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${officeInstance?.sessions?}" var="s">
    <li><g:link controller="session" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="session" action="create" params="['office.id': officeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'session.label', default: 'Session')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'termsOfOffice', 'error')} ">
	<label for="termsOfOffice">
		<g:message code="office.termsOfOffice.label" default="Terms Of Office" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${officeInstance?.termsOfOffice?}" var="t">
    <li><g:link controller="termOfOffice" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="termOfOffice" action="create" params="['office.id': officeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'termOfOffice.label', default: 'TermOfOffice')])}</g:link>
</li>
</ul>

</div>

