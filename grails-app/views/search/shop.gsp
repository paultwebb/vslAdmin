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
   ${county}
</g:else>
<p>

${counties.county[0].toUpperCase() }
${counties?.county[50]?.toUpperCase() }

<g:each in="${counties?.county?}">
  <span class="tag">${it.county}</span>
</g:each>
 
 </body>
</html>
