<%@ page import="gov.vt.vslAdmin.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="person.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${personInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'homeTown', 'error')} ">
	<label for="homeTown">
		<g:message code="person.homeTown.label" default="Home Town" />
		
	</label>
	<g:textField name="homeTown" maxlength="40" value="${personInstance?.homeTown}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'currentParty', 'error')} ">
	<label for="currentParty">
		<g:message code="person.currentParty.label" default="Current Party" />
		
	</label>
	<g:select id="currentParty" name="currentParty.id" from="${gov.vt.vslAdmin.Party.list()}" optionKey="id" value="${personInstance?.currentParty?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'personId', 'error')} required">
	<label for="personId">
		<g:message code="person.personId.label" default="Person Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="personId" type="number" value="${personInstance.personId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="person.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" maxlength="30" required="" value="${personInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="person.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" maxlength="30" required="" value="${personInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'middleName', 'error')} ">
	<label for="middleName">
		<g:message code="person.middleName.label" default="Middle Name" />
		
	</label>
	<g:textField name="middleName" maxlength="30" value="${personInstance?.middleName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'preferredName', 'error')} ">
	<label for="preferredName">
		<g:message code="person.preferredName.label" default="Preferred Name" />
		
	</label>
	<g:textField name="preferredName" maxlength="50" value="${personInstance?.preferredName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birthTown', 'error')} ">
	<label for="birthTown">
		<g:message code="person.birthTown.label" default="Birth Town" />
		
	</label>
	<g:textField name="birthTown" maxlength="30" value="${personInstance?.birthTown}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birthState', 'error')} ">
	<label for="birthState">
		<g:message code="person.birthState.label" default="Birth State" />
		
	</label>
	<g:textField name="birthState" maxlength="2" value="${personInstance?.birthState}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birthCountry', 'error')} ">
	<label for="birthCountry">
		<g:message code="person.birthCountry.label" default="Birth Country" />
		
	</label>
	<g:textField name="birthCountry" maxlength="30" value="${personInstance?.birthCountry}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birthMonth', 'error')} ">
	<label for="birthMonth">
		<g:message code="person.birthMonth.label" default="Birth Month" />
		
	</label>
	<g:field name="birthMonth" type="number" value="${personInstance.birthMonth}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birthDay', 'error')} ">
	<label for="birthDay">
		<g:message code="person.birthDay.label" default="Birth Day" />
		
	</label>
	<g:field name="birthDay" type="number" value="${personInstance.birthDay}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birthYear', 'error')} ">
	<label for="birthYear">
		<g:message code="person.birthYear.label" default="Birth Year" />
		
	</label>
	<g:field name="birthYear" type="number" value="${personInstance.birthYear}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'phoneOffice', 'error')} ">
	<label for="phoneOffice">
		<g:message code="person.phoneOffice.label" default="Phone Office" />
		
	</label>
	<g:textField name="phoneOffice" maxlength="15" value="${personInstance?.phoneOffice}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'phoneCell', 'error')} ">
	<label for="phoneCell">
		<g:message code="person.phoneCell.label" default="Phone Cell" />
		
	</label>
	<g:textField name="phoneCell" maxlength="15" value="${personInstance?.phoneCell}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'phoneHome', 'error')} ">
	<label for="phoneHome">
		<g:message code="person.phoneHome.label" default="Phone Home" />
		
	</label>
	<g:textField name="phoneHome" maxlength="15" value="${personInstance?.phoneHome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address1', 'error')} ">
	<label for="address1">
		<g:message code="person.address1.label" default="Address1" />
		
	</label>
	<g:textField name="address1" maxlength="50" value="${personInstance?.address1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'address2', 'error')} ">
	<label for="address2">
		<g:message code="person.address2.label" default="Address2" />
		
	</label>
	<g:textField name="address2" maxlength="50" value="${personInstance?.address2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="person.city.label" default="City" />
		
	</label>
	<g:textField name="city" maxlength="30" value="${personInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'state', 'error')} ">
	<label for="state">
		<g:message code="person.state.label" default="State" />
		
	</label>
	<g:textField name="state" maxlength="2" value="${personInstance?.state}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'zip', 'error')} ">
	<label for="zip">
		<g:message code="person.zip.label" default="Zip" />
		
	</label>
	<g:textField name="zip" maxlength="10" value="${personInstance?.zip}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'committeeAssignments', 'error')} ">
	<label for="committeeAssignments">
		<g:message code="person.committeeAssignments.label" default="Committee Assignments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.committeeAssignments?}" var="c">
    <li><g:link controller="committeeAssignment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="committeeAssignment" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'committeeAssignment.label', default: 'CommitteeAssignment')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'officeHoldings', 'error')} ">
	<label for="officeHoldings">
		<g:message code="person.officeHoldings.label" default="Office Holdings" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${personInstance?.officeHoldings?}" var="o">
    <li><g:link controller="officeHolder" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="officeHolder" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'officeHolder.label', default: 'OfficeHolder')])}</g:link>
</li>
</ul>

</div>

