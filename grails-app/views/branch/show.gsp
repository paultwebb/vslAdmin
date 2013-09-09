
<%@ page import="gov.vt.vslAdmin.Branch" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'branch.label', default: 'Branch')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-branch" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-branch" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list branch">
			
				<g:if test="${branchInstance?.branchCode}">
				<li class="fieldcontain">
					<span id="branchCode-label" class="property-label"><g:message code="branch.branchCode.label" default="Branch Code" /></span>
					
						<span class="property-value" aria-labelledby="branchCode-label"><g:fieldValue bean="${branchInstance}" field="branchCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.branch}">
				<li class="fieldcontain">
					<span id="branch-label" class="property-label"><g:message code="branch.branch.label" default="Branch" /></span>
					
						<span class="property-value" aria-labelledby="branch-label"><g:fieldValue bean="${branchInstance}" field="branch"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="branch.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${branchInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="branch.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:fieldValue bean="${branchInstance}" field="dateCreated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="branch.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${branchInstance}" field="lastUpdated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${branchInstance?.offices}">
				<li class="fieldcontain">
					<span id="offices-label" class="property-label"><g:message code="branch.offices.label" default="Offices" /></span>
					
						<g:each in="${branchInstance.offices}" var="o">
						<span class="property-value" aria-labelledby="offices-label"><g:link controller="office" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${branchInstance?.id}" />
					<g:link class="edit" action="edit" id="${branchInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
