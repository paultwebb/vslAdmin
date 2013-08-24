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
   <g:textField name="seat"></g:textField>
   <input type="image"
     src="${createLinkTo(dir:'images', file: 'login-button.gif')}"
     name="searchButton" id="searchButton" border="0">
    </input>
 </g:form>
</body>
</html>