<%@ page import="gov.vt.vslAdmin.OfficeHolder" %>



<div class="fieldcontain ${hasErrors(bean: officeHolderInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="officeHolder.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${gov.vt.vslAdmin.Person.list()}" optionKey="id" required="" value="${officeHolderInstance?.person?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeHolderInstance, field: 'seat', 'error')} ">
	<label for="seat">
		<g:message code="officeHolder.seat.label" default="Seat" />
		
	</label>
	<g:field name="seat" type="number" value="${officeHolderInstance.seat}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeHolderInstance, field: 'termOfOffice', 'error')} required">
	<label for="termOfOffice">
		<g:message code="officeHolder.termOfOffice.label" default="Term Of Office" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="termOfOffice" name="termOfOffice.id" from="${gov.vt.vslAdmin.TermOfOffice.list()}" optionKey="id" required="" value="${officeHolderInstance?.termOfOffice?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeHolderInstance, field: 'party', 'error')} ">
	<label for="party">
		<g:message code="officeHolder.party.label" default="Party" />
		
	</label>
	<g:select id="party" name="party.id" from="${gov.vt.vslAdmin.Party.list()}" optionKey="id" value="${officeHolderInstance?.party?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeHolderInstance, field: 'district', 'error')} ">
	<label for="district">
		<g:message code="officeHolder.district.label" default="District" />
		
	</label>
	<g:select id="district" name="district.id" from="${gov.vt.vslAdmin.District.list()}" optionKey="id" value="${officeHolderInstance?.district?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeHolderInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="officeHolder.notes.label" default="Notes" />
		
	</label>
	<g:textField name="notes" maxlength="100" value="${officeHolderInstance?.notes}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeHolderInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="officeHolder.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: officeHolderInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="officeHolder.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	
</div>

