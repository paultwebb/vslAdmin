
<%@ page import="gov.vt.vslAdmin.TermOfOffice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'termOfOffice.label', default: 'TermOfOffice')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-termOfOffice" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-termOfOffice" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list termOfOffice">
			
				<g:if test="${termOfOfficeInstance?.termOfOfficeCode}">
				<li class="fieldcontain">
					<span id="termOfOfficeCode-label" class="property-label"><g:message code="termOfOffice.termOfOfficeCode.label" default="Term Of Office Code" /></span>
					
						<span class="property-value" aria-labelledby="termOfOfficeCode-label"><g:fieldValue bean="${termOfOfficeInstance}" field="termOfOfficeCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${termOfOfficeInstance?.termOfOffice}">
				<li class="fieldcontain">
					<span id="termOfOffice-label" class="property-label"><g:message code="termOfOffice.termOfOffice.label" default="Term Of Office" /></span>
					
						<span class="property-value" aria-labelledby="termOfOffice-label"><g:fieldValue bean="${termOfOfficeInstance}" field="termOfOffice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${termOfOfficeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="termOfOffice.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${termOfOfficeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${termOfOfficeInstance?.office}">
				<li class="fieldcontain">
					<span id="office-label" class="property-label"><g:message code="termOfOffice.office.label" default="Office" /></span>
					
						<span class="property-value" aria-labelledby="office-label"><g:link controller="office" action="show" id="${termOfOfficeInstance?.office?.id}">${termOfOfficeInstance?.office?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${termOfOfficeInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="termOfOffice.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:fieldValue bean="${termOfOfficeInstance}" field="startDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${termOfOfficeInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="termOfOffice.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:fieldValue bean="${termOfOfficeInstance}" field="endDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${termOfOfficeInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="termOfOffice.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:fieldValue bean="${termOfOfficeInstance}" field="dateCreated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${termOfOfficeInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="termOfOffice.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${termOfOfficeInstance}" field="lastUpdated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${termOfOfficeInstance?.officeHolders}">
				<li class="fieldcontain">
					<span id="officeHolders-label" class="property-label"><g:message code="termOfOffice.officeHolders.label" default="Office Holders" /></span>
					
						<g:each in="${termOfOfficeInstance.officeHolders}" var="o">
						<span class="property-value" aria-labelledby="officeHolders-label"><g:link controller="officeHolder" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${termOfOfficeInstance?.sessions}">
				<li class="fieldcontain">
					<span id="sessions-label" class="property-label"><g:message code="termOfOffice.sessions.label" default="Sessions" /></span>
					
						<g:each in="${termOfOfficeInstance.sessions}" var="s">
						<span class="property-value" aria-labelledby="sessions-label"><g:link controller="session" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${termOfOfficeInstance?.id}" />
					<g:link class="edit" action="edit" id="${termOfOfficeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
