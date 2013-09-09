
<%@ page import="gov.vt.vslAdmin.Committee" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'committee.label', default: 'Committee')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-committee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-committee" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list committee">
			
				<g:if test="${committeeInstance?.committeeCode}">
				<li class="fieldcontain">
					<span id="committeeCode-label" class="property-label"><g:message code="committee.committeeCode.label" default="Committee Code" /></span>
					
						<span class="property-value" aria-labelledby="committeeCode-label"><g:fieldValue bean="${committeeInstance}" field="committeeCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${committeeInstance?.committee}">
				<li class="fieldcontain">
					<span id="committee-label" class="property-label"><g:message code="committee.committee.label" default="Committee" /></span>
					
						<span class="property-value" aria-labelledby="committee-label"><g:fieldValue bean="${committeeInstance}" field="committee"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${committeeInstance?.scope}">
				<li class="fieldcontain">
					<span id="scope-label" class="property-label"><g:message code="committee.scope.label" default="Scope" /></span>
					
						<span class="property-value" aria-labelledby="scope-label"><g:fieldValue bean="${committeeInstance}" field="scope"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${committeeInstance?.room}">
				<li class="fieldcontain">
					<span id="room-label" class="property-label"><g:message code="committee.room.label" default="Room" /></span>
					
						<span class="property-value" aria-labelledby="room-label"><g:fieldValue bean="${committeeInstance}" field="room"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${committeeInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="committee.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${committeeInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${committeeInstance?.committeeAssignments}">
				<li class="fieldcontain">
					<span id="committeeAssignments-label" class="property-label"><g:message code="committee.committeeAssignments.label" default="Committee Assignments" /></span>
					
						<g:each in="${committeeInstance.committeeAssignments}" var="c">
						<span class="property-value" aria-labelledby="committeeAssignments-label"><g:link controller="committeeAssignment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${committeeInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="committee.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:fieldValue bean="${committeeInstance}" field="dateCreated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${committeeInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="committee.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${committeeInstance}" field="lastUpdated"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${committeeInstance?.id}" />
					<g:link class="edit" action="edit" id="${committeeInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
