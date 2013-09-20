
<%@ page import="gov.vt.vslAdmin.Office" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'office.label', default: 'Office')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-office" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-office" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list office">
			
				<g:if test="${officeInstance?.officeCode}">
				<li class="fieldcontain">
					<span id="officeCode-label" class="property-label"><g:message code="office.officeCode.label" default="Office Code" /></span>
					
						<span class="property-value" aria-labelledby="officeCode-label"><g:fieldValue bean="${officeInstance}" field="officeCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.office}">
				<li class="fieldcontain">
					<span id="office-label" class="property-label"><g:message code="office.office.label" default="Office" /></span>
					
						<span class="property-value" aria-labelledby="office-label"><g:fieldValue bean="${officeInstance}" field="office"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="office.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${officeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.branch}">
				<li class="fieldcontain">
					<span id="branch-label" class="property-label"><g:message code="office.branch.label" default="Branch" /></span>
					
						<span class="property-value" aria-labelledby="branch-label"><g:link controller="branch" action="show" id="${officeInstance?.branch?.id}">${officeInstance?.branch?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="office.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:fieldValue bean="${officeInstance}" field="dateCreated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.districts}">
				<li class="fieldcontain">
					<span id="districts-label" class="property-label"><g:message code="office.districts.label" default="Districts" /></span>
					
						<g:each in="${officeInstance.districts}" var="d">
						<span class="property-value" aria-labelledby="districts-label"><g:link controller="district" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="office.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${officeInstance}" field="lastUpdated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.sessions}">
				<li class="fieldcontain">
					<span id="sessions-label" class="property-label"><g:message code="office.sessions.label" default="Sessions" /></span>
					
						<g:each in="${officeInstance.sessions}" var="s">
						<span class="property-value" aria-labelledby="sessions-label"><g:link controller="session" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${officeInstance?.termsOfOffice}">
				<li class="fieldcontain">
					<span id="termsOfOffice-label" class="property-label"><g:message code="office.termsOfOffice.label" default="Terms Of Office" /></span>
					
						<g:each in="${officeInstance.termsOfOffice}" var="t">
						<span class="property-value" aria-labelledby="termsOfOffice-label"><g:link controller="termOfOffice" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${officeInstance?.id}" />
					<g:link class="edit" action="edit" id="${officeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
