
<%@ page import="gov.vt.vslAdmin.District" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'district.label', default: 'District')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-district" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-district" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list district">
			
				<g:if test="${districtInstance?.office}">
				<li class="fieldcontain">
					<span id="office-label" class="property-label"><g:message code="district.office.label" default="Office" /></span>
					
						<span class="property-value" aria-labelledby="office-label"><g:link controller="office" action="show" id="${districtInstance?.office?.id}">${districtInstance?.office?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${districtInstance?.districtCode}">
				<li class="fieldcontain">
					<span id="districtCode-label" class="property-label"><g:message code="district.districtCode.label" default="District Code" /></span>
					
						<span class="property-value" aria-labelledby="districtCode-label"><g:fieldValue bean="${districtInstance}" field="districtCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${districtInstance?.district}">
				<li class="fieldcontain">
					<span id="district-label" class="property-label"><g:message code="district.district.label" default="District" /></span>
					
						<span class="property-value" aria-labelledby="district-label"><g:fieldValue bean="${districtInstance}" field="district"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${districtInstance?.members}">
				<li class="fieldcontain">
					<span id="members-label" class="property-label"><g:message code="district.members.label" default="Members" /></span>
					
						<span class="property-value" aria-labelledby="members-label"><g:fieldValue bean="${districtInstance}" field="members"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${districtInstance?.townList}">
				<li class="fieldcontain">
					<span id="townList-label" class="property-label"><g:message code="district.townList.label" default="Town List" /></span>
					
						<span class="property-value" aria-labelledby="townList-label"><g:fieldValue bean="${districtInstance}" field="townList"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${districtInstance?.districtImage}">
				<li class="fieldcontain">
					<span id="districtImage-label" class="property-label"><g:message code="district.districtImage.label" default="District Image" /></span>
					
						<span class="property-value" aria-labelledby="districtImage-label"><g:fieldValue bean="${districtInstance}" field="districtImage"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${districtInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="district.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:fieldValue bean="${districtInstance}" field="dateCreated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${districtInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="district.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${districtInstance}" field="lastUpdated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${districtInstance?.officeHolders}">
				<li class="fieldcontain">
					<span id="officeHolders-label" class="property-label"><g:message code="district.officeHolders.label" default="Office Holders" /></span>
					
						<g:each in="${districtInstance.officeHolders}" var="o">
						<span class="property-value" aria-labelledby="officeHolders-label"><g:link controller="officeHolder" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${districtInstance?.id}" />
					<g:link class="edit" action="edit" id="${districtInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
