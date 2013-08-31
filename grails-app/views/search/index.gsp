<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf8">
<meta name="layout" content="main">
<title>vsl Search</title>
</head>
<body id="body">
 <h1>Vermont State Legislature Search Page</h1>
 <g:form
   name="searchForm"
   url="[controller:'search',action:'findRep']">
   <div>Seat/Plate:</div>
   <g:textField name="seat" value='${params.seat}'></g:textField>
   <input type="image"
     src="${createLinkTo(dir:'images', file: 'favicon.ico')}"
     name="searchButton" id="searchButton" border="0">
    </input>
 </g:form>
  <g:form
   name="searchPersonForm"
   url="[controller:'search',action:'findPerson']">
   <div>Last Name:</div>
   <g:textField name="lastName" value='${params.lastName}'></g:textField>
   <input type="image"
     src="${createLinkTo(dir:'images', file: 'favicon.ico')}"
     name="searchButton" id="searchButton" border="0">
    </input>
 </g:form>
 <div style='color:red'>
  ${request.notfound}
 </div>
 <g:link controller='admin' >Admin</g:link>
</body>
</html>