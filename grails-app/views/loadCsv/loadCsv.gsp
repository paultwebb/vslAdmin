<h1>Load Data from CSV files</h1>
<g:link controller='loadCsv' action='loadGnisLocale'>Load GNIS Locales</g:link><BR>
<g:link controller='loadCsv' action='loadCounty'>Load Counties</g:link><BR>
<g:link controller='loadCsv' action='loadTown'>Load Towns</g:link>

<g:if test='${results}'>
hello
 <table border='1'>
 <g:each in='${results}' var='result'> 
   <tr>
     <td>$result.id</td>
     <td>$result.county</td>
   </tr>
 </g:each>
 </table>
</g:if>