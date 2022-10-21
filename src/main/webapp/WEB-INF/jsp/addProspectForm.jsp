<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="offcanvas offcanvas-end" id="addProspect">
    <div class="offcanvas-header">
        <h1 class="offcanvas-title">New Prospect</h1>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
    </div>
    <div class="offcanvas-body">
        <form class="text-center" action="${pageContext.request.contextPath}/prospects/add" method="post">
            <div class="row text-start">
                <div class="col-6 mb-3">
                    <div class="form-group">
                        <label for="firstName" class="form-label">First name</label>
                        <input id="firstName" name="firstName" class="form-control">
                    </div>
                </div>
                <div class="col-6 mb-3">
                    <div class="form-group">
                        <div class="form-group">
                            <label for="lastName" class="form-label">Last name</label>
                            <input id="lastName" name="lastName" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <div class="form-group">
                        <label for="picture" class="form-label">Picture url</label>
                        <input id="picture" name="picture" class="form-control">
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <div class="form-group">
                        <label for="email" class="form-label">Last name</label>
                        <input id="email" name="email" class="form-control">
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <div class="form-group">
                        <label for="cellPhone" class="form-label">Cell phone</label>
                        <input id="cellPhone" name="cellPhone" class="form-control">
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <div class="form-group">
                        <label for="homePhone" class="form-label">Home phone</label>
                        <input id="homePhone" name="homePhone" class="form-control">
                    </div>
                </div>
                <div class="col-6 mb-3">
                    <div class="form-group">
                        <label for="roleEntreprise" class="form-label">Role in company</label>
                        <input id="roleEntreprise" name="roleEntreprise" class="form-control">
                    </div>
                </div>
                <div class="col-6 mb-3">
                    <div class="form-group">
                        <label for="company" class="form-label">Company</label>
                        <select id="company" class="form-select" aria-label="Choose company" name="companyId">
                            <c:forEach items="${requestScope.companies}" var="company">
                                <option value="${company.id}">${company.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <div class="form-group">
                        <label for="prospectionStatus" class="form-label">Prospection status</label>
                        <select id="prospectionStatus" class="form-select" aria-label="Choose company"
                                name="prospectionStatus">
                            <c:forEach items="${requestScope.prospectStatusList}" var="prospectStatus">
                                <option value="${prospectStatus}">${prospectStatus}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <div class="form-group">
                        <label for="address1" class="form-label">Address</label>
                        <input id="address1" name="address1" class="form-control">
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <div class="form-group">
                        <label for="address2" class="form-label">Address:Line2</label>
                        <input id="address2" name="address2" class="form-control">
                    </div>
                </div>
                <div class="col-6 mb-3">
                    <div class="form-group">
                        <label for="zipCode" class="form-label">Postal code</label>
                        <input id="zipCode" name="zipCode" class="form-control">
                    </div>
                </div>
                <div class="col-6 mb-3">
                    <div class="form-group">
                        <label for="city" class="form-label">Last name</label>
                        <input id="city" name="city" class="form-control">
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <div class="form-group">
                        <label for="country" class="form-label">Country</label>
                        <input id="country" name="country" class="form-control">
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <div class="form-group">
                        <label for="relanceDuration" class="form-label">Relance duration</label>
                        <input id="relanceDuration" name="relanceDuration" class="form-control">
                    </div>
                </div>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="submit" class="btn btn-secondary" value="Save">

        </form>
    </div>
</div>

