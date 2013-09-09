
<%@ page import="gov.vt.vslAdmin.CommitteeAssignment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'committeeAssignment.label', default: 'CommitteeAssignment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-committeeAssignment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-committeeAssignment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="committeeAssignment.committee.label" default="Committee" /></th>
					
						<th><g:message code="committeeAssignment.person.label" default="Person" /></th>
					
						<g:sortableColumn property="role" title="${message(code: 'committeeAssignment.role.label', default: 'Role')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'committeeAssignment.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'committeeAssignment.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${committeeAssignmentInstanceList}" status="i" var="committeeAssignmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${committeeAssignmentInstance.id}">${fieldValue(bean: committeeAssignmentInstance, field: "committee")}</g:link></td>
					
						<td>${fieldValue(bean: committeeAssignmentInstance, field: "person")}</td>
					
						<td>${fieldValue(bean: committeeAssignmentInstance, field: "role")}</td>
					
						<td>${fieldValue(bean: committeeAssignmentInstance, field: "dateCreated")}</td>
					
						<td>${fieldValue(bean: committeeAssignmentInstance, field: "lastUpdated")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${committeeAssignmentInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
