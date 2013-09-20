<!DOCTYPE html>
<html>

	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'officeHolder.label', default: 'Person')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>

<body>
		<a href="#list-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-person" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>				
						<g:sortableColumn property="lastName" title="${message(code: 'person.lastName.label', default: 'Last Name')}" />					
						<g:sortableColumn property="firstName" title="${message(code: 'person.firstName.label', default: 'First Name')}" />					
						<g:sortableColumn property="currentParty" title="${message(code: 'person.currentParty.label', default: 'Current Party')}" />					
						<g:sortableColumn property="officeHoldings" title="${message(code: 'person.officeHoldings.label', default: 'Offices')}" />					

						</tr>
				</thead>
				<tbody>
				<g:each in="${people}" status="i" var="person">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">					
						<td><g:link controller="person" action="show" id="${person.id}">${person.lastName}</g:link></td>	
						<td><g:link controller="person" action="show" id="${person.id}">${person.firstName}</g:link></td>					
						<td><g:link controller="party" action="show" id="${person.currentParty?.id}">${person.currentParty}</g:link></td>					
   						 <td>
       						 <g:each in='${person.officeHoldings}' var='officeHolding'>
         						 ${officeHolding.termOfOffice}
        						  <g:if test ="${officeHolding.seat}">
       							     Seat ${officeHolding.seat}
       							   </g:if>
      						    ${officeHolding.district}
      					  </g:each>
   						 </td>  										
					</tr>
				</g:each>
				</tbody>
				
			</table>
		</div>
	</body>
</html>		
