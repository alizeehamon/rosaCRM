<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="editClient${requestScope.client.id}">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Edit client</h4>
            </div>
            <form action="${pageContext.request.contextPath}/clients/edit" method="post">
                <!-- Modal body -->
                <div class="text-center modal-body">
                    <div class="row text-start">
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="firstName" class="form-label">First name</label>
                                <input id="firstName" name="firstName" class="form-control" value="${requestScope.client.firstName}">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <div class="form-group">
                                    <label for="lastName" class="form-label">Last name</label>
                                    <input id="lastName" name="lastName" class="form-control" value="${requestScope.client.lastName}">
                                </div>
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="picture" class="form-label">Picture url</label>
                                <input id="picture" name="picture" class="form-control" value="${requestScope.client.picture}">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="email" class="form-label">Email</label>
                                <input id="email" required name="email" class="form-control" value="${requestScope.client.email}">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="cellPhone" class="form-label">Cell phone</label>
                                <input id="cellPhone" required name="cellPhone" class="form-control" value="${requestScope.client.cellPhone}">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="homePhone" class="form-label">Home phone</label>
                                <input id="homePhone" name="homePhone" class="form-control" value="${requestScope.client.homePhone}">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="roleEntreprise" class="form-label">Role in company</label>
                                <input id="roleEntreprise" name="roleEntreprise" class="form-control" value="${requestScope.client.roleEntreprise}">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="company" class="form-label">Company</label>
                                <select id="company" class="form-select" aria-label="Choose company" name="company">
                                    <c:forEach items="${requestScope.companies}" var="company">
                                        <option value="${company.id}">${company.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="address1" class="form-label">Address</label>
                                <input id="address1" name="address1" class="form-control" value="${requestScope.client.address1}">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="address2" class="form-label">Address:Line2</label>
                                <input id="address2" name="address2" class="form-control" value="${requestScope.client.address2}">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="zipCode" class="form-label">Postal code</label>
                                <input id="zipCode" name="zipCode" class="form-control" value="${requestScope.client.zipCode}">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="city" class="form-label">City</label>
                                <input id="city" name="city" class="form-control" value="${requestScope.client.city}">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="contactDuration" class="form-label">Contact duration</label>
                                <input id="contactDuration" name="contactDuration" class="form-control" value="${requestScope.client.contactDuration}">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="country" class="form-label">Country</label>
                                <input id="country" name="country" class="form-control" value="${requestScope.client.country}">
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">

                    <input hidden name="id" value="${requestScope.client.id}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-outline-danger">Save</button>

                </div>
            </form>
        </div>
    </div>
</div>