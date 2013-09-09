
<%@ page import="gov.vt.vslAdmin.Office" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'office.label', default: 'Office')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-office" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-office" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="officeCode" title="${message(code: 'office.officeCode.label', default: 'Office Code')}" />
					
						<g:sortableColumn property="office" title="${message(code: 'office.office.label', default: 'Office')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'office.description.label', default: 'Description')}" />
					
						<th><g:message code="office.branch.label" default="Branch" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'office.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'office.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${officeInstanceList}" status="i" var="officeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${officeInstance.id}">${fieldValue(bean: officeInstance, field: "officeCode")}</g:link></td>
					
						<td>${fieldValue(bean: officeInstance, field: "office")}</td>
					
						<td>${fieldValue(bean: officeInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: officeInstance, field: "branch")}</td>
					
						<td>${fieldValue(bean: officeInstance, field: "dateCreated")}</td>
					
						<td>${fieldValue(bean: officeInstance, field: "lastUpdated")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${officeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
