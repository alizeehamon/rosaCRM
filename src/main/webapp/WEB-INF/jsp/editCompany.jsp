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
    <title>ROSACRM | Edit a company</title>
</head>
<body>
<c:import url="header.jsp">
    <c:param name="title" value="Clients"></c:param>
</c:import>
<div class="container d-flex align-content-center justify-content-center">
    <form class="d-flex justify-content-center flex-column w-50" action="${pageContext.request.contextPath}/companies/edit/${company.id}" method="post">
        <label for="name">Company name</label>
        <input type="text" id="name" name="name" value="${company.name}">
        <label for="siret">Siret</label>
        <input type="text" id="siret" name="siret" value="${company.siret}">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" value="${company.email}">
        <label for="phone">CellPhone contact</label>
        <input type="tel" id="phone" name="cellPhone" value="${company.cellPhone}">

        <label for="homePhone">Company phone number</label>
        <input type="tel" id="homePhone" name="homePhone" value="${company.homePhone}">

        <label for="website">Website Url</label>
        <input type="text" id="website" name="siteUrl" value="${company.siteUrl}">

        <label for="creationDate">Enterprise creation date</label>
        <input type="date" id="creationDate" name="entrepriseCreationDate" value="${company.entrepriseCreationDate}">

        <label for="sector">Sector</label>
        <select name="sector" id="sector" >
            <c:forEach items="${sectorList}" var="sector">
                <option value="${sector.id}">${sector.activitySector}</option>
            </c:forEach>
        </select>

        <label for="address1">Address</label>
        <input id="address1" type="text" name="address1" value="${company.address1}">

        <label for="address2">Address details</label>
        <input id="address2" type="text" name="address2" value="${company.address2}">

        <label for="zipcode">Zipcode</label>
        <input id="zipcode" type="text" name="zipcode" value="${company.zipCode}">

        <label for="city">City</label>
        <input id="city" type="text" name="city" value="${company.city}">

        <label for="country">Country</label>
        <input id="country" type="text" name="country" value="${company.country}">

        <input type="submit">
    </form>
</div>
</body>
</html>