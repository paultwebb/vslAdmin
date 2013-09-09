
<%@ page import="gov.vt.vslAdmin.TermOfOffice" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'termOfOffice.label', default: 'TermOfOffice')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-termOfOffice" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-termOfOffice" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="termOfOfficeCode" title="${message(code: 'termOfOffice.termOfOfficeCode.label', default: 'Term Of Office Code')}" />
					
						<g:sortableColumn property="termOfOffice" title="${message(code: 'termOfOffice.termOfOffice.label', default: 'Term Of Office')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'termOfOffice.description.label', default: 'Description')}" />
					
						<th><g:message code="termOfOffice.office.label" default="Office" /></th>
					
						<g:sortableColumn property="startDate" title="${message(code: 'termOfOffice.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="endDate" title="${message(code: 'termOfOffice.endDate.label', default: 'End Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${termOfOfficeInstanceList}" status="i" var="termOfOfficeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${termOfOfficeInstance.id}">${fieldValue(bean: termOfOfficeInstance, field: "termOfOfficeCode")}</g:link></td>
					
						<td>${fieldValue(bean: termOfOfficeInstance, field: "termOfOffice")}</td>
					
						<td>${fieldValue(bean: termOfOfficeInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: termOfOfficeInstance, field: "office")}</td>
					
						<td>${fieldValue(bean: termOfOfficeInstance, field: "startDate")}</td>
					
						<td>${fieldValue(bean: termOfOfficeInstance, field: "endDate")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${termOfOfficeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
