
<%@ page import="gov.vt.vslAdmin.GnisLocale" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gnisLocale.label', default: 'GnisLocale')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-gnisLocale" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-gnisLocale" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list gnisLocale">
			
				<g:if test="${gnisLocaleInstance?.featureName}">
				<li class="fieldcontain">
					<span id="featureName-label" class="property-label"><g:message code="gnisLocale.featureName.label" default="Feature Name" /></span>
					
						<span class="property-value" aria-labelledby="featureName-label"><g:fieldValue bean="${gnisLocaleInstance}" field="featureName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gnisLocaleInstance?.county}">
				<li class="fieldcontain">
					<span id="county-label" class="property-label"><g:message code="gnisLocale.county.label" default="County" /></span>
					
						<span class="property-value" aria-labelledby="county-label"><g:fieldValue bean="${gnisLocaleInstance}" field="county"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gnisLocaleInstance?.gnisClass}">
				<li class="fieldcontain">
					<span id="gnisClass-label" class="property-label"><g:message code="gnisLocale.gnisClass.label" default="Gnis Class" /></span>
					
						<span class="property-value" aria-labelledby="gnisClass-label"><g:fieldValue bean="${gnisLocaleInstance}" field="gnisClass"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gnisLocaleInstance?.longitude}">
				<li class="fieldcontain">
					<span id="longitude-label" class="property-label"><g:message code="gnisLocale.longitude.label" default="Longitude" /></span>
					
						<span class="property-value" aria-labelledby="longitude-label"><g:fieldValue bean="${gnisLocaleInstance}" field="longitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gnisLocaleInstance?.latitude}">
				<li class="fieldcontain">
					<span id="latitude-label" class="property-label"><g:message code="gnisLocale.latitude.label" default="Latitude" /></span>
					
						<span class="property-value" aria-labelledby="latitude-label"><g:fieldValue bean="${gnisLocaleInstance}" field="latitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gnisLocaleInstance?.elevation}">
				<li class="fieldcontain">
					<span id="elevation-label" class="property-label"><g:message code="gnisLocale.elevation.label" default="Elevation" /></span>
					
						<span class="property-value" aria-labelledby="elevation-label"><g:fieldValue bean="${gnisLocaleInstance}" field="elevation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gnisLocaleInstance?.gnisId}">
				<li class="fieldcontain">
					<span id="gnisId-label" class="property-label"><g:message code="gnisLocale.gnisId.label" default="Gnis Id" /></span>
					
						<span class="property-value" aria-labelledby="gnisId-label"><g:fieldValue bean="${gnisLocaleInstance}" field="gnisId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gnisLocaleInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="gnisLocale.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:fieldValue bean="${gnisLocaleInstance}" field="dateCreated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gnisLocaleInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="gnisLocale.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${gnisLocaleInstance}" field="lastUpdated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gnisLocaleInstance?.map}">
				<li class="fieldcontain">
					<span id="map-label" class="property-label"><g:message code="gnisLocale.map.label" default="Map" /></span>
					
						<span class="property-value" aria-labelledby="map-label"><g:fieldValue bean="${gnisLocaleInstance}" field="map"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gnisLocaleInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="gnisLocale.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${gnisLocaleInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${gnisLocaleInstance?.id}" />
					<g:link class="edit" action="edit" id="${gnisLocaleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
