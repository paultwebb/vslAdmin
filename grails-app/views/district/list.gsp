
<%@ page import="gov.vt.vslAdmin.District" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'district.label', default: 'District')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-district" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-district" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="districtCode" title="${message(code: 'district.districtCode.label', default: 'District Code')}" />
					
						<g:sortableColumn property="district" title="${message(code: 'district.district.label', default: 'District')}" />
					
						<g:sortableColumn property="members" title="${message(code: 'district.members.label', default: 'Members')}" />
					
						<g:sortableColumn property="townList" title="${message(code: 'district.townList.label', default: 'Town List')}" />
					
						<g:sortableColumn property="districtImage" title="${message(code: 'district.districtImage.label', default: 'District Image')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'district.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${districtInstanceList}" status="i" var="districtInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${districtInstance.id}">${fieldValue(bean: districtInstance, field: "districtCode")}</g:link></td>
					
						<td>${fieldValue(bean: districtInstance, field: "district")}</td>
					
						<td>${fieldValue(bean: districtInstance, field: "members")}</td>
					
						<td>${fieldValue(bean: districtInstance, field: "townList")}</td>
					
						<td>${fieldValue(bean: districtInstance, field: "districtImage")}</td>
					
						<td>${fieldValue(bean: districtInstance, field: "dateCreated")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${districtInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
