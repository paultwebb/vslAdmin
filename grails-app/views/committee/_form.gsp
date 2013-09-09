<%@ page import="gov.vt.vslAdmin.Committee" %>



<div class="fieldcontain ${hasErrors(bean: committeeInstance, field: 'committeeCode', 'error')} required">
	<label for="committeeCode">
		<g:message code="committee.committeeCode.label" default="Committee Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="committeeCode" maxlength="10" required="" value="${committeeInstance?.committeeCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: committeeInstance, field: 'committee', 'error')} required">
	<label for="committee">
		<g:message code="committee.committee.label" default="Committee" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="committee" maxlength="60" required="" value="${committeeInstance?.committee}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: committeeInstance, field: 'scope', 'error')} ">
	<label for="scope">
		<g:message code="committee.scope.label" default="Scope" />
		
	</label>
	<g:textField name="scope" maxlength="20" value="${committeeInstance?.scope}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: committeeInstance, field: 'room', 'error')} ">
	<label for="room">
		<g:message code="committee.room.label" default="Room" />
		
	</label>
	<g:textField name="room" maxlength="20" value="${committeeInstance?.room}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: committeeInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="committee.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="100" value="${committeeInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: committeeInstance, field: 'committeeAssignments', 'error')} ">
	<label for="committeeAssignments">
		<g:message code="committee.committeeAssignments.label" default="Committee Assignments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${committeeInstance?.committeeAssignments?}" var="c">
    <li><g:link controller="committeeAssignment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="committeeAssignment" action="create" params="['committee.id': committeeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'committeeAssignment.label', default: 'CommitteeAssignment')])}</g:link>
</li>
</ul>

</div>

