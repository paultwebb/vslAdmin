
<%@ page import="gov.vt.vslAdmin.CommitteeAssignment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'committeeAssignment.label', default: 'CommitteeAssignment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-committeeAssignment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-committeeAssignment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list committeeAssignment">
			
				<g:if test="${committeeAssignmentInstance?.committee}">
				<li class="fieldcontain">
					<span id="committee-label" class="property-label"><g:message code="committeeAssignment.committee.label" default="Committee" /></span>
					
						<span class="property-value" aria-labelledby="committee-label"><g:link controller="committee" action="show" id="${committeeAssignmentInstance?.committee?.id}">${committeeAssignmentInstance?.committee?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${committeeAssignmentInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="committeeAssignment.person.label" default="Person" /></span>
					
						<span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${committeeAssignmentInstance?.person?.id}">${committeeAssignmentInstance?.person?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${committeeAssignmentInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="committeeAssignment.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${committeeAssignmentInstance}" field="role"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${committeeAssignmentInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="committeeAssignment.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:fieldValue bean="${committeeAssignmentInstance}" field="dateCreated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${committeeAssignmentInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="committeeAssignment.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${committeeAssignmentInstance}" field="lastUpdated"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${committeeAssignmentInstance?.id}" />
					<g:link class="edit" action="edit" id="${committeeAssignmentInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
