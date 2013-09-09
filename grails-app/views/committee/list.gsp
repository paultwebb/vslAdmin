
<%@ page import="gov.vt.vslAdmin.Committee" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'committee.label', default: 'Committee')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-committee" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-committee" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="committeeCode" title="${message(code: 'committee.committeeCode.label', default: 'Committee Code')}" />
					
						<g:sortableColumn property="committee" title="${message(code: 'committee.committee.label', default: 'Committee')}" />
					
						<g:sortableColumn property="scope" title="${message(code: 'committee.scope.label', default: 'Scope')}" />
					
						<g:sortableColumn property="room" title="${message(code: 'committee.room.label', default: 'Room')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'committee.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'committee.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${committeeInstanceList}" status="i" var="committeeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${committeeInstance.id}">${fieldValue(bean: committeeInstance, field: "committeeCode")}</g:link></td>
					
						<td>${fieldValue(bean: committeeInstance, field: "committee")}</td>
					
						<td>${fieldValue(bean: committeeInstance, field: "scope")}</td>
					
						<td>${fieldValue(bean: committeeInstance, field: "room")}</td>
					
						<td>${fieldValue(bean: committeeInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: committeeInstance, field: "dateCreated")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${committeeInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
