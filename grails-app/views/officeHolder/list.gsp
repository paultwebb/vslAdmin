
<%@ page import="gov.vt.vslAdmin.OfficeHolder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'officeHolder.label', default: 'OfficeHolder')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-officeHolder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-officeHolder" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="officeHolder.person.label" default="Person" /></th>
					
						<g:sortableColumn property="seat" title="${message(code: 'officeHolder.seat.label', default: 'Seat')}" />
					
						<th><g:message code="officeHolder.termOfOffice.label" default="Term Of Office" /></th>
					
						<th><g:message code="officeHolder.party.label" default="Party" /></th>
					
						<th><g:message code="officeHolder.district.label" default="District" /></th>
					
						<g:sortableColumn property="notes" title="${message(code: 'officeHolder.notes.label', default: 'Notes')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${officeHolderInstanceList}" status="i" var="officeHolderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${officeHolderInstance.id}">${fieldValue(bean: officeHolderInstance, field: "person")}</g:link></td>
					
						<td>${fieldValue(bean: officeHolderInstance, field: "seat")}</td>
					
						<td>${fieldValue(bean: officeHolderInstance, field: "termOfOffice")}</td>
					
						<td>${fieldValue(bean: officeHolderInstance, field: "party")}</td>
					
						<td>${fieldValue(bean: officeHolderInstance, field: "district")}</td>
					
						<td>${fieldValue(bean: officeHolderInstance, field: "notes")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${officeHolderInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
