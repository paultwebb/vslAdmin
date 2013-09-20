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
						<g:sortableColumn property="seat" title="${message(code: 'officeHolder.seat.label', default: 'Seat')}" />					
						<g:sortableColumn property="person" title="${message(code: 'officeHolder.person.label', default: 'Person')}" />					
						<g:sortableColumn property="termOfOffice" title="${message(code: 'officeHolder.termOfOffice.label', default: 'Term of Office')}" />
						<g:sortableColumn property="party" title="${message(code: 'officeHolder.party.label', default: 'Party')}" />					
						<g:sortableColumn property="district" title="${message(code: 'officeHolder.district.label', default: 'District')}" />				
					</tr>
				</thead>
				<tbody>
				<g:each in="${officeHolders}" status="i" var="officeHolder">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">					
						<td><g:link controller="officeHolder" action="show" id="${officeHolder.id}">${officeHolder.termOfOffice.termOfOfficeCode} - ${officeHolder.seat}</g:link></td>					
						<td><g:link controller="person" action="show" id="${officeHolder.person.id}">${officeHolder.person}</g:link></td>									
						<td><g:link controller="termOfOffice" action="show" id="${officeHolder.termOfOffice.id}">${officeHolder.termOfOffice}</g:link></td>									
						<td>${officeHolder.party}</td>					
						<td><g:link controller="district" action="show" id="${officeHolder.district.id}">${officeHolder.district}</g:link></td>									
					</tr>
				</g:each>
				</tbody>
				
			</table>
		</div>
	</body>
</html>		
