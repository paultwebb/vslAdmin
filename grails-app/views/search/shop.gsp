<!--%@ page contentType="text/xml; charset=UTF-8 %>
-->
<html>
 <body>
   <% 3.times { %>
	   <p>I'm printed 3 times</p>
	   <% } %>

<% out << "print me!" %>

<%= "print me too" %>	 

<%-- Output the name --%>  
<p>${counties}</p>


<g:set var="county" value="${counties.county[0]}" />
County=${county }
<br>
User=${session.user.login}
<br>
<g:set scope="session" var="xuser" value="bogus" />
xuser=${session.xuser}
<br>

<g:if test="${county == 'Rutland'}">
   Bingo!
</g:if>
<g:else>
   ${county}?
</g:else>
<p>

${counties.county[0]?.toUpperCase() }
${counties?.county[50]?.toUpperCase() }

<p>
There are ${counties.size()} counties </p>
 There are ${towns.size()} towns </p>
 
<table border='1'>
<g:each in='${counties}' var='county'>
  <tr>
    <td>${county.gnisId}</td>
    <td>${county.county}</td>
  </tr>
</g:each>
</table>

<table border='1'>
<g:each in='${towns}' var='town'>
  <tr>
    <td>${town.town}</td>
    <td>${town.entityType}</td>
  </tr>
</g:each>
</table>

 </body>
</html>
