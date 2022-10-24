<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="deleteAccount">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Delete my account</h4>
            </div>
            <form action="${pageContext.request.contextPath}/users/delete" method="post">
                <!-- Modal body -->
                <div class="text-center modal-body">
                    <div class="row text-start">
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label class="form-label">Are you sure ?</label>
                            </div>
                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">

                        <input hidden name="id" value="${requestScope.user.id}">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-white border-danger">Yes</button>

                    </div>
            </form>
        </div>
    </div>
</div>