<h1>Load Data from CSV files</h1>

<g:if test='${params}'>
 <table border='1'>
 <tr>
   <td>${params.table}
   <td>${params.deletes} Deleted
   <td>${params.loads} Loaded
   <td>${params.errors} Errors
 </tr>
 </table>
</g:if>

<g:link controller='loadCsv' action='loadDistrict'>Load Districts</g:link><BR>
<g:link controller='loadCsv' action='loadTermOfOffice'>Load Terms Of Office</g:link><BR>
<g:link controller='loadCsv' action='loadSession'>Load Sessions</g:link><BR>

<g:link controller='loadCsv' action='loadPeople'>Load People</g:link><BR>

<g:link controller='loadCsv' action='loadCommittee'>Load Committees</g:link><BR>
<g:link controller='loadCsv' action='loadCommitteeAssignment'>Load Committee Assignments</g:link><BR>

<g:link controller='loadCsv' action='loadGnisLocale'>Load GNIS Locales</g:link><BR>
<g:link controller='loadCsv' action='loadCounty'>Load Counties</g:link><BR>
<g:link controller='loadCsv' action='loadTown'>Load Towns</g:link>

