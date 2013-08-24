<%@ page import="gov.vt.vslAdmin.GnisLocale" %>



<div class="fieldcontain ${hasErrors(bean: gnisLocaleInstance, field: 'featureName', 'error')} required">
	<label for="featureName">
		<g:message code="gnisLocale.featureName.label" default="Feature Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="featureName" required="" value="${gnisLocaleInstance?.featureName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gnisLocaleInstance, field: 'county', 'error')} required">
	<label for="county">
		<g:message code="gnisLocale.county.label" default="County" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="county" required="" value="${gnisLocaleInstance?.county}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gnisLocaleInstance, field: 'gnisClass', 'error')} required">
	<label for="gnisClass">
		<g:message code="gnisLocale.gnisClass.label" default="Gnis Class" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="gnisClass" required="" value="${gnisLocaleInstance?.gnisClass}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gnisLocaleInstance, field: 'longitude', 'error')} required">
	<label for="longitude">
		<g:message code="gnisLocale.longitude.label" default="Longitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="longitude" required="" value="${gnisLocaleInstance?.longitude}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gnisLocaleInstance, field: 'latitude', 'error')} required">
	<label for="latitude">
		<g:message code="gnisLocale.latitude.label" default="Latitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="latitude" required="" value="${gnisLocaleInstance?.latitude}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gnisLocaleInstance, field: 'elevation', 'error')} ">
	<label for="elevation">
		<g:message code="gnisLocale.elevation.label" default="Elevation" />
		
	</label>
	<g:field name="elevation" type="number" value="${gnisLocaleInstance.elevation}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gnisLocaleInstance, field: 'gnisId', 'error')} required">
	<label for="gnisId">
		<g:message code="gnisLocale.gnisId.label" default="Gnis Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="gnisId" type="number" value="${gnisLocaleInstance.gnisId}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: gnisLocaleInstance, field: 'map', 'error')} ">
	<label for="map">
		<g:message code="gnisLocale.map.label" default="Map" />
		
	</label>
	<g:textField name="map" value="${gnisLocaleInstance?.map}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: gnisLocaleInstance, field: 'state', 'error')} ">
	<label for="state">
		<g:message code="gnisLocale.state.label" default="State" />
		
	</label>
	<g:textField name="state" value="${gnisLocaleInstance?.state}"/>
</div>

