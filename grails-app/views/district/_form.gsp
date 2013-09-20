<%@ page import="gov.vt.vslAdmin.District" %>



<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'office', 'error')} required">
	<label for="office">
		<g:message code="district.office.label" default="Office" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="office" name="office.id" from="${gov.vt.vslAdmin.Office.list()}" optionKey="id" required="" value="${districtInstance?.office?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'districtCode', 'error')} required">
	<label for="districtCode">
		<g:message code="district.districtCode.label" default="District Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="districtCode" type="number" value="${districtInstance.districtCode}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'district', 'error')} required">
	<label for="district">
		<g:message code="district.district.label" default="District" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="district" maxlength="50" required="" value="${districtInstance?.district}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'members', 'error')} ">
	<label for="members">
		<g:message code="district.members.label" default="Members" />
		
	</label>
	<g:field name="members" type="number" value="${districtInstance.members}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'townList', 'error')} ">
	<label for="townList">
		<g:message code="district.townList.label" default="Town List" />
		
	</label>
	<g:textField name="townList" maxlength="250" value="${districtInstance?.townList}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'districtImage', 'error')} ">
	<label for="districtImage">
		<g:message code="district.districtImage.label" default="District Image" />
		
	</label>
	<g:textField name="districtImage" maxlength="100" value="${districtInstance?.districtImage}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'officeHolders', 'error')} ">
	<label for="officeHolders">
		<g:message code="district.officeHolders.label" default="Office Holders" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${districtInstance?.officeHolders?}" var="o">
    <li><g:link controller="officeHolder" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="officeHolder" action="create" params="['district.id': districtInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'officeHolder.label', default: 'OfficeHolder')])}</g:link>
</li>
</ul>

</div>

