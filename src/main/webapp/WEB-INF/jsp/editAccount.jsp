<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="../../resources/static/css/login.css">
    <title>Edit my account</title>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="login-clean">
    <form:form action="${pageContext.request.contextPath}/account" method="post" modelAttribute="user">
        <h2 class="sr-only">Manage my Account</h2>
        <div class="illustration"><i class="icon ion-ios-navigate"></i></div>


        <div class="form-group">
            <label class="form-label" for="lastName">Last name</label>
            <form:input type="lastname" class="form-control" id="lastName" placeholder="Enter your lastname"
                        path="lastName" required="true"/>
                <%--        <form:errors path="lastName" cssClass="alert alert-danger"></form:errors>--%>
        </div>

        <div class="form-group">
            <label class="form-label" for="firstName">First name</label>
            <form:input type="firstName" class="form-control" id="firstName" placeholder="Enter your firstname"
                        path="firstName" required="true"/>
                <%--        <form:errors path="firstName" cssClass="alert alert-danger"></form:errors>--%>
        </div>

        <div class="mb-3">
            <label class="form-label" for="password">Password</label>
            <form:input type="password" class="form-control" id="password" placeholder="Enter your password"
                        path="password" required="true"/>
            <form:errors path="password" cssClass="alert alert-danger"></form:errors>
        </div>

        <div class="text-center mb-3">
            <form:button type="submit" class="btn btn-primary">Modify</form:button>
        </div>


        <!--<spring:hasBindErrors name="createUser">
        <c:forEach var="error" items="${errors.allErrors}">
            <spring:message code="${error.code}"
                            arguments="${error.arguments}"
                            text="${error.defaultMessage}"/><br/>
        </c:forEach>
    </spring:hasBindErrors>-->


    </form:form>
    <div class="text-center mt-2">
        <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                data-bs-target="#deleteAccount">I want to delete my account
        </button>
    </div>
</div>

<c:import url="deleteUserAccount.jsp"/>
<c:import url="footer.jsp"/>
</body>
</html>