<%@ page import="gov.vt.vslAdmin.TermOfOffice" %>



<div class="fieldcontain ${hasErrors(bean: termOfOfficeInstance, field: 'termOfOfficeCode', 'error')} required">
	<label for="termOfOfficeCode">
		<g:message code="termOfOffice.termOfOfficeCode.label" default="Term Of Office Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="termOfOfficeCode" maxlength="10" required="" value="${termOfOfficeInstance?.termOfOfficeCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: termOfOfficeInstance, field: 'termOfOffice', 'error')} required">
	<label for="termOfOffice">
		<g:message code="termOfOffice.termOfOffice.label" default="Term Of Office" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="termOfOffice" maxlength="50" required="" value="${termOfOfficeInstance?.termOfOffice}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: termOfOfficeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="termOfOffice.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="100" value="${termOfOfficeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: termOfOfficeInstance, field: 'office', 'error')} required">
	<label for="office">
		<g:message code="termOfOffice.office.label" default="Office" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="office" name="office.id" from="${gov.vt.vslAdmin.Office.list()}" optionKey="id" required="" value="${termOfOfficeInstance?.office?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: termOfOfficeInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="termOfOffice.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: termOfOfficeInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="termOfOffice.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: termOfOfficeInstance, field: 'officeHolders', 'error')} ">
	<label for="officeHolders">
		<g:message code="termOfOffice.officeHolders.label" default="Office Holders" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${termOfOfficeInstance?.officeHolders?}" var="o">
    <li><g:link controller="officeHolder" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="officeHolder" action="create" params="['termOfOffice.id': termOfOfficeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'officeHolder.label', default: 'OfficeHolder')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: termOfOfficeInstance, field: 'sessions', 'error')} ">
	<label for="sessions">
		<g:message code="termOfOffice.sessions.label" default="Sessions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${termOfOfficeInstance?.sessions?}" var="s">
    <li><g:link controller="session" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="session" action="create" params="['termOfOffice.id': termOfOfficeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'session.label', default: 'Session')])}</g:link>
</li>
</ul>

</div>

