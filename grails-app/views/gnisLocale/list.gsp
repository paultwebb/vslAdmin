<%@ page import="gov.vt.vslAdmin.GnisLocale" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gnisLocale.label', default: 'Locale')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
  		<r:require module="filterpane" />	
  		<filterpane:includes />
	</head>
	<body>
		<a href="#list-gnisLocale" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-gnisLocale" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="featureName" title="${message(code: 'gnisLocale.featureName.label', default: 'Feature Name')}" />
					
						<g:sortableColumn property="county" title="${message(code: 'gnisLocale.county.label', default: 'County')}" />
					
						<g:sortableColumn property="gnisClass" title="${message(code: 'gnisLocale.gnisClass.label', default: 'Gnis Class')}" />
					
						<g:sortableColumn property="longitude" title="${message(code: 'gnisLocale.longitude.label', default: 'Longitude')}" />
					
						<g:sortableColumn property="latitude" title="${message(code: 'gnisLocale.latitude.label', default: 'Latitude')}" />
					
						<g:sortableColumn property="elevation" title="${message(code: 'gnisLocale.elevation.label', default: 'Elevation')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${gnisLocaleInstanceList}" status="i" var="gnisLocaleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${gnisLocaleInstance.id}">${fieldValue(bean: gnisLocaleInstance, field: "featureName")}</g:link></td>
					
						<td>${fieldValue(bean: gnisLocaleInstance, field: "county")}</td>
					
						<td>${fieldValue(bean: gnisLocaleInstance, field: "gnisClass")}</td>
					
						<td>${fieldValue(bean: gnisLocaleInstance, field: "longitude")}</td>
					
						<td>${fieldValue(bean: gnisLocaleInstance, field: "latitude")}</td>
					
						<td>${fieldValue(bean: gnisLocaleInstance, field: "elevation")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${gnisLocaleInstanceCount == null ? GnisLocale.count(): gnisLocaleInstanceCount}" params="${filterParams}" />
				<filterpane:filterButton text="Search Parameters" />
			</div>
		<filterpane:filterPane domain="gov.vt.vslAdmin.GnisLocale" />
		</div>
	</body>
</html>
