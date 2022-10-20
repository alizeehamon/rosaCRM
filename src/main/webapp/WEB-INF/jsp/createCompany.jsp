<!doctype html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <title>ROSACRM | Add a company</title>
</head>
<body>

<div class="container d-flex align-content-center justify-content-center">
<form class="d-flex justify-content-center flex-column w-50" action="${pageContext.request.contextPath}/companies/create" method="post">
    <label for="name">Company name</label>
    <input type="text" id="name" name="name">
    <label for="siret">Siret</label>
    <input type="text" id="siret" name="siret">
    <label for="email">Email</label>
    <input type="email" id="email" name="email">
    <label for="name">CellPhone contact</label>
    <input type="tel" id="phone" name="cellPhone">

    <label for="homePhone">Company phone number</label>
    <input type="tel" id="homePhone" name="homePhone">

    <label for="website">Website Url</label>
    <input type="text" id="website" name="siteUrl">

    <label for="creationDate">Enterprise creation date</label>
    <input type="date" id="creationDate" name="entrepriseCreationDate">

    <label for="sector">Sector</label>
    <select name="sector" id="sector">
        <c:forEach items="${sectorList}" var="sector">
            <option value="${sector.id}">${sector.activitySector}</option>
        </c:forEach>
    </select>

    <label for="address1">Adress</label>
    <input id="address1" type="text" name="address1">

    <label for="adress2">Adress details</label>
    <input id="adress2" type="text" name="adress2">

    <label for="zipcode">Zipcode</label>
    <input id="zipcode" type="text" name="zipcode">

    <label for="city">City</label>
    <input id="city" type="text" name="city">

    <label for="country">Country</label>
    <input id="country" type="text" name="country">
    <input type="submit">
</form>
</div>
</body>
</html>