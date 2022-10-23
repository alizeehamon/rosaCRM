<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="changeCompany">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Change company</h4>
            </div>
            <form action="${pageContext.request.contextPath}/clients/change" method="post">
                <!-- Modal body -->
                <div class="text-center modal-body">
                    <div class="row text-start">
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="company" class="form-label">Client's new work place</label>
                                <select id="company" class="form-select" aria-label="Choose company" name="companyId">
                                    <c:forEach items="${companies}" var="company">
                                        <option value="${company.id}">${company.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group mt-1">
                                <label for="company" class="form-label">Client's new function</label>
                                <input name="roleEntreprise" id="roleEntreprise" class="form-control" type="text">
                                <input hidden name="clientId" value="${client.id}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">

                    <input hidden name="id" value="${requestScope.client.id}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-white border-danger">Change</button>

                </div>
            </form>
        </div>
    </div>
</div>