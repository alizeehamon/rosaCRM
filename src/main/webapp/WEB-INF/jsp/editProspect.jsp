<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="editProspect${requestScope.prospect.id}">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Edit prospect</h4>
            </div>
            <form action="${pageContext.request.contextPath}/prospects/edit" method="post">
                <!-- Modal body -->
                <div class="text-center modal-body">
                    <div class="row text-start">
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="firstName" class="form-label">First name</label>
                                <input id="firstName" name="firstName" class="form-control" value="${requestScope.prospect.firstName}">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <div class="form-group">
                                    <label for="lastName" class="form-label">Last name</label>
                                    <input id="lastName" name="lastName" class="form-control" value="${requestScope.prospect.lastName}">
                                </div>
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="picture" class="form-label">Picture url</label>
                                <input id="picture" name="picture" class="form-control" value="${requestScope.prospect.picture}">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="email" class="form-label">Last name</label>
                                <input id="email" name="email" class="form-control" value="${requestScope.prospect.email}">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="cellPhone" class="form-label">Cell phone</label>
                                <input id="cellPhone" name="cellPhone" class="form-control" value="${requestScope.prospect.cellPhone}">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="homePhone" class="form-label">Home phone</label>
                                <input id="homePhone" name="homePhone" class="form-control" value="${requestScope.prospect.homePhone}">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="roleEntreprise" class="form-label">Role in company</label>
                                <input id="roleEntreprise" name="roleEntreprise" class="form-control" value="${requestScope.prospect.roleEntreprise}">
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
                                <input id="address1" name="address1" class="form-control" value="${requestScope.prospect.address1}">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="address2" class="form-label">Address:Line2</label>
                                <input id="address2" name="address2" class="form-control" value="${requestScope.prospect.address2}">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="zipCode" class="form-label">Postal code</label>
                                <input id="zipCode" name="zipCode" class="form-control" value="${requestScope.prospect.zipCode}">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="city" class="form-label">Last name</label>
                                <input id="city" name="city" class="form-control" value="${requestScope.prospect.city}">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="country" class="form-label">Country</label>
                                <input id="country" name="country" class="form-control" value="${requestScope.prospect.country}">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="relanceDuration" class="form-label">Relance duration</label>
                                <input id="relanceDuration" name="relanceDuration" class="form-control" value="${requestScope.prospect.relanceDuration}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">

                    <input hidden name="id" value="${requestScope.prospect.id}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-white border-danger">Save</button>

                </div>
            </form>
        </div>
    </div>
</div>