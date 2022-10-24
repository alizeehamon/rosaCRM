<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="deleteAdmin">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Delete a user account</h4>
            </div>
            <form action="${pageContext.request.contextPath}/admin/delete" method="post">
                <!-- Modal body -->
                <div class="text-center modal-body">
                    <div class="row text-start">
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="user" class="form-label">Users</label>
                                <select id="user" class="form-select" aria-label="Choose a user to delete"
                                        name="userId">
                                    <c:forEach items="${requestScope.users}" var="user">
                                        <option value="${user.id}">${user.firstName} ${user.lastName}</option>
                                    </c:forEach>
                                </select>
                                <label class="form-label mt-2">Are you sure ?</label>
                            </div>
                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">

                        <input hidden name="id" value="${requestScope.user.id}">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-white border-danger">Yes</button>

                    </div>
                </div>
            </form>
        </div>
    </div>
</div>