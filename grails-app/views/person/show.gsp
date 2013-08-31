
<%@ page import="gov.vt.vslAdmin.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-person" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list person">
			
				<g:if test="${personInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="person.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${personInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.homeTown}">
				<li class="fieldcontain">
					<span id="homeTown-label" class="property-label"><g:message code="person.homeTown.label" default="Home Town" /></span>
					
						<span class="property-value" aria-labelledby="homeTown-label"><g:fieldValue bean="${personInstance}" field="homeTown"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.personId}">
				<li class="fieldcontain">
					<span id="personId-label" class="property-label"><g:message code="person.personId.label" default="Person Id" /></span>
					
						<span class="property-value" aria-labelledby="personId-label"><g:fieldValue bean="${personInstance}" field="personId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="person.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${personInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="person.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${personInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.middleName}">
				<li class="fieldcontain">
					<span id="middleName-label" class="property-label"><g:message code="person.middleName.label" default="Middle Name" /></span>
					
						<span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${personInstance}" field="middleName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.preferredName}">
				<li class="fieldcontain">
					<span id="preferredName-label" class="property-label"><g:message code="person.preferredName.label" default="Preferred Name" /></span>
					
						<span class="property-value" aria-labelledby="preferredName-label"><g:fieldValue bean="${personInstance}" field="preferredName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.birthTown}">
				<li class="fieldcontain">
					<span id="birthTown-label" class="property-label"><g:message code="person.birthTown.label" default="Birth Town" /></span>
					
						<span class="property-value" aria-labelledby="birthTown-label"><g:fieldValue bean="${personInstance}" field="birthTown"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.birthState}">
				<li class="fieldcontain">
					<span id="birthState-label" class="property-label"><g:message code="person.birthState.label" default="Birth State" /></span>
					
						<span class="property-value" aria-labelledby="birthState-label"><g:fieldValue bean="${personInstance}" field="birthState"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.birthCountry}">
				<li class="fieldcontain">
					<span id="birthCountry-label" class="property-label"><g:message code="person.birthCountry.label" default="Birth Country" /></span>
					
						<span class="property-value" aria-labelledby="birthCountry-label"><g:fieldValue bean="${personInstance}" field="birthCountry"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.birthMonth}">
				<li class="fieldcontain">
					<span id="birthMonth-label" class="property-label"><g:message code="person.birthMonth.label" default="Birth Month" /></span>
					
						<span class="property-value" aria-labelledby="birthMonth-label"><g:fieldValue bean="${personInstance}" field="birthMonth"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.birthDay}">
				<li class="fieldcontain">
					<span id="birthDay-label" class="property-label"><g:message code="person.birthDay.label" default="Birth Day" /></span>
					
						<span class="property-value" aria-labelledby="birthDay-label"><g:fieldValue bean="${personInstance}" field="birthDay"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.birthYear}">
				<li class="fieldcontain">
					<span id="birthYear-label" class="property-label"><g:message code="person.birthYear.label" default="Birth Year" /></span>
					
						<span class="property-value" aria-labelledby="birthYear-label"><g:fieldValue bean="${personInstance}" field="birthYear"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.phoneOffice}">
				<li class="fieldcontain">
					<span id="phoneOffice-label" class="property-label"><g:message code="person.phoneOffice.label" default="Phone Office" /></span>
					
						<span class="property-value" aria-labelledby="phoneOffice-label"><g:fieldValue bean="${personInstance}" field="phoneOffice"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.phoneCell}">
				<li class="fieldcontain">
					<span id="phoneCell-label" class="property-label"><g:message code="person.phoneCell.label" default="Phone Cell" /></span>
					
						<span class="property-value" aria-labelledby="phoneCell-label"><g:fieldValue bean="${personInstance}" field="phoneCell"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.phoneHome}">
				<li class="fieldcontain">
					<span id="phoneHome-label" class="property-label"><g:message code="person.phoneHome.label" default="Phone Home" /></span>
					
						<span class="property-value" aria-labelledby="phoneHome-label"><g:fieldValue bean="${personInstance}" field="phoneHome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.address1}">
				<li class="fieldcontain">
					<span id="address1-label" class="property-label"><g:message code="person.address1.label" default="Address1" /></span>
					
						<span class="property-value" aria-labelledby="address1-label"><g:fieldValue bean="${personInstance}" field="address1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.address2}">
				<li class="fieldcontain">
					<span id="address2-label" class="property-label"><g:message code="person.address2.label" default="Address2" /></span>
					
						<span class="property-value" aria-labelledby="address2-label"><g:fieldValue bean="${personInstance}" field="address2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="person.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${personInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="person.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${personInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.zip}">
				<li class="fieldcontain">
					<span id="zip-label" class="property-label"><g:message code="person.zip.label" default="Zip" /></span>
					
						<span class="property-value" aria-labelledby="zip-label"><g:fieldValue bean="${personInstance}" field="zip"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="person.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:fieldValue bean="${personInstance}" field="dateCreated"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="person.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${personInstance}" field="lastUpdated"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${personInstance?.id}" />
					<g:link class="edit" action="edit" id="${personInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
