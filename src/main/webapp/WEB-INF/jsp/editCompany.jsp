<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="container d-flex align-content-center justify-content-center">
    <form class="d-flex justify-content-center flex-column w-50"
          action="${pageContext.request.contextPath}/companies/edit/${company.id}" method="post">
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
        <select name="sector" id="sector">
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

        <label for="logo">Logo</label>
        <input id="logo" type="text" name="logo" value="${company.logo}">


        <label for="country">Country</label>
        <input id="country" type="text" name="country" value="${company.country}">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit">
    </form>
</div>
</body>
</html>