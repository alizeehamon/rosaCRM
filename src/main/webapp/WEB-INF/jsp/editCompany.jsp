<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="editCompany${requestScope.company.id}">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Edit Company info</h4>
            </div>
            <form action="${pageContext.request.contextPath}/companies/edit/${requestScope.company.id}" method="post">
                <!-- Modal body -->
                <div class="text-center modal-body">
                    <div class="row text-start">
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="name" class="form-label">Company name</label>
                                <input id="name" name="name" class="form-control" value="${requestScope.company.name}">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="siret" class="form-label">SIRET</label>
                                <input id="siret" name="siret" class="form-control"
                                       value="${requestScope.company.siret}">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="logo" class="form-label">Company logo url</label>
                                <input id="logo" name="logo" class="form-control"
                                       value="${requestScope.company.logo}">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="email" class="form-label">Company email contact</label>
                                <input id="email" name="email" class="form-control"
                                       value="${requestScope.company.email}">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="entrepriseCreationDate" class="form-label">Company creation date</label>
                                <input id="entrepriseCreationDate" type="date" name="entrepriseCreationDate" class="form-control"
                                       value="${requestScope.company.entrepriseCreationDate}">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="cellPhone" class="form-label">Cell phone</label>
                                <input id="cellPhone" name="cellPhone" class="form-control"
                                       value="${requestScope.company.cellPhone}">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="homePhone" class="form-label">Home phone</label>
                                <input id="homePhone" name="homePhone" class="form-control"
                                       value="${requestScope.company.homePhone}">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="address1" class="form-label">Address</label>
                                <input id="address1" name="address1" class="form-control"
                                       value="${requestScope.company.address1}">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="address2" class="form-label">Address:Line2</label>
                                <input id="address2" name="address2" class="form-control"
                                       value="${requestScope.company.address2}">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="zipCode" class="form-label">Postal code</label>
                                <input id="zipCode" name="zipCode" class="form-control"
                                       value="${requestScope.company.zipCode}">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="city" class="form-label">City</label>
                                <input id="city" name="city" class="form-control" value="${requestScope.company.city}">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="country" class="form-label">Country</label>
                                <input id="country" name="country" class="form-control"
                                       value="${requestScope.company.country}">
                            </div>
                        </div>
                    </div>
                    <div class="col-12 mb-3">
                        <div class="form-group">
                            <label for="sector" class="form-label">Activity Sector</label>
                            <select id="sector" name="sector">
                                <c:forEach items="${sectorList}" var="sector">
                                    <c:if test="${sector.id == company.sector.id }">
                                        <option selected="selected"
                                                value="${sector.id}">${sector.activitySector}</option>
                                    </c:if>
                                    <option value="${sector.id}">${sector.activitySector}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <input hidden name="id" value="${requestScope.company.id}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-outline-danger">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>