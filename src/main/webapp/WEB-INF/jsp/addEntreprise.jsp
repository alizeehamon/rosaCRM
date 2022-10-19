<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/companyCreation" method="post">
    <label for="name">name</label>
    <input type="text" id="name" name="name">
    <label for="siret">siret</label>
    <input type="text" id="siret" name="siret">
    <label for="email">email</label>
    <input type="email" id="email" name="email">
    <label for="name">cellPhone contact</label>
    <input type="tel" id="phone" name="cellPhone">

    <label for="homePhone">Enterprise phone number</label>
    <input type="tel" id="homePhone" name="homePhone">

    <label for="website">Website Url</label>
    <input type="url" id="website" name="siteUrl">

    <label for="creationDate">Enterprise creation date</label>
    <input type="date" id="creationDate" name="entrepriseCreationDate">

    <input type="submit">
</form>

</body>
</html>