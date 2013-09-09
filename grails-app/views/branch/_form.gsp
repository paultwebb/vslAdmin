<%@ page import="gov.vt.vslAdmin.Branch" %>



<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'branchCode', 'error')} required">
	<label for="branchCode">
		<g:message code="branch.branchCode.label" default="Branch Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="branchCode" maxlength="5" required="" value="${branchInstance?.branchCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'branch', 'error')} required">
	<label for="branch">
		<g:message code="branch.branch.label" default="Branch" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="branch" maxlength="25" required="" value="${branchInstance?.branch}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="branch.description.label" default="Description" />
		
	</label>
	<g:textField name="description" maxlength="100" value="${branchInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: branchInstance, field: 'offices', 'error')} ">
	<label for="offices">
		<g:message code="branch.offices.label" default="Offices" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${branchInstance?.offices?}" var="o">
    <li><g:link controller="office" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="office" action="create" params="['branch.id': branchInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'office.label', default: 'Office')])}</g:link>
</li>
</ul>

</div>

