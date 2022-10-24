<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="offcanvas offcanvas-end" id="addCompany">
    <div class="offcanvas-header">
        <h1 class="offcanvas-title">New Company</h1>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
    </div>
    <div class="offcanvas-body">
        <form class="text-center" action="${pageContext.request.contextPath}/companies/add" method="post">
            <div class="row text-start">
                <div class="col-6 mb-3">
                    <div class="form-group">
                        <label for="name" class="form-label">Company name</label>
                        <input id="name" name="name" class="form-control">
                    </div>
                </div>
                <div class="col-6 mb-3">
                    <div class="form-group">
                        <div class="form-group">
                            <label for="email" class="form-label">Email</label>
                            <input id="email" name="email" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <div class="form-group">
                        <label for="logo" class="form-label">Logo url</label>
                        <input id="logo" name="logo" class="form-control">
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <div class="form-group">
                        <label for="siret" class="form-label">SIRET</label>
                        <input id="siret" name="siret" class="form-control">
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <div class="form-group">
                        <label for="cellPhone" class="form-label">Cell phone</label>
                        <input id="cellPhone" type="tel" name="cellPhone" class="form-control">
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <div class="form-group">
                        <label for="homePhone" class="form-label">Home phone</label>
                        <input id="homePhone" name="homePhone" type="tel" class="form-control">
                    </div>
                </div>
                <div class="col-6 mb-3">
                    <div class="form-group">
                        <label for="siteUrl" class="form-label">Website Url</label>
                        <input id="siteUrl" name="siteUrl" class="form-control">
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <div class="form-group">
                        <label for="entrepriseCreationDate" class="form-label">Company creation date</label>
                        <input id="entrepriseCreationDate" type="date" name="entrepriseCreationDate" class="form-control">
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
                        <label for="city" class="form-label">City</label>
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
                        <label for="sector" class="form-label">Activity Sector</label>
                        <input class="form-control" id="sector" name="sector" type="text" list="sectorList" />
                        <datalist id="sectorList">
                            <c:forEach items="${sectorList}" var="sector">
                                <option value="${sector.id}">${sector.activitySector}</option>
                            </c:forEach>
                        </datalist>
                    </div>
                </div>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="submit" class="btn btn-secondary" value="Save">
        </form>
    </div>
</div>

