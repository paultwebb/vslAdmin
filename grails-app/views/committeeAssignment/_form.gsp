<%@ page import="gov.vt.vslAdmin.CommitteeAssignment" %>



<div class="fieldcontain ${hasErrors(bean: committeeAssignmentInstance, field: 'committee', 'error')} required">
	<label for="committee">
		<g:message code="committeeAssignment.committee.label" default="Committee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="committee" name="committee.id" from="${gov.vt.vslAdmin.Committee.list()}" optionKey="id" required="" value="${committeeAssignmentInstance?.committee?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: committeeAssignmentInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="committeeAssignment.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${gov.vt.vslAdmin.Person.list()}" optionKey="id" required="" value="${committeeAssignmentInstance?.person?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: committeeAssignmentInstance, field: 'role', 'error')} ">
	<label for="role">
		<g:message code="committeeAssignment.role.label" default="Role" />
		
	</label>
	<g:textField name="role" maxlength="20" value="${committeeAssignmentInstance?.role}"/>
</div>

