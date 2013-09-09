
<%@ page import="gov.vt.vslAdmin.OfficeHolder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'officeHolder.label', default: 'OfficeHolder')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-officeHolder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-officeHolder" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list officeHolder">
			
				<g:if test="${officeHolderInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="officeHolder.person.label" default="Person" /></span>
					
						<span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${officeHolderInstance?.person?.id}">${officeHolderInstance?.person?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeHolderInstance?.seat}">
				<li class="fieldcontain">
					<span id="seat-label" class="property-label"><g:message code="officeHolder.seat.label" default="Seat" /></span>
					
						<span class="property-value" aria-labelledby="seat-label"><g:fieldValue bean="${officeHolderInstance}" field="seat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeHolderInstance?.termOfOffice}">
				<li class="fieldcontain">
					<span id="termOfOffice-label" class="property-label"><g:message code="officeHolder.termOfOffice.label" default="Term Of Office" /></span>
					
						<span class="property-value" aria-labelledby="termOfOffice-label"><g:link controller="termOfOffice" action="show" id="${officeHolderInstance?.termOfOffice?.id}">${officeHolderInstance?.termOfOffice?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeHolderInstance?.party}">
				<li class="fieldcontain">
					<span id="party-label" class="property-label"><g:message code="officeHolder.party.label" default="Party" /></span>
					
						<span class="property-value" aria-labelledby="party-label"><g:link controller="party" action="show" id="${officeHolderInstance?.party?.id}">${officeHolderInstance?.party?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeHolderInstance?.district}">
				<li class="fieldcontain">
					<span id="district-label" class="property-label"><g:message code="officeHolder.district.label" default="District" /></span>
					
						<span class="property-value" aria-labelledby="district-label"><g:link controller="district" action="show" id="${officeHolderInstance?.district?.id}">${officeHolderInstance?.district?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeHolderInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="officeHolder.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${officeHolderInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeHolderInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="officeHolder.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:fieldValue bean="${officeHolderInstance}" field="startDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeHolderInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="officeHolder.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:fieldValue bean="${officeHolderInstance}" field="endDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeHolderInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="officeHolder.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:fieldValue bean="${officeHolderInstance}" field="dateCreated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeHolderInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="officeHolder.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${officeHolderInstance}" field="lastUpdated"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${officeHolderInstance?.id}" />
					<g:link class="edit" action="edit" id="${officeHolderInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
