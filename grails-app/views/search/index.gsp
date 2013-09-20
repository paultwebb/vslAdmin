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
   url="[controller:'search',action:'findSeat']">
   <div>Current Office Holder:</div>
   <g:textField name="seat" value='${params.seat}'></g:textField>
   <g:submitButton
     value="Search by Seat"
     name="searchButton"/>
 </g:form>
 
  <g:form
   name="searchPersonForm"
   url="[controller:'search',action:'findPerson']">
   <div>All people by name:</div>
   <g:textField name="name" value='${params.name}'></g:textField>
   <g:submitButton
     value="Search by Name"
     name="searchButton"/>
 </g:form>
 
 <div style='color:red'>
  ${request.notfound}
 </div>
  
</body>
</html>