
<div class="modal fade" id="deleteConfirm${requestScope.client.id}">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Confirm delete</h4>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                Are you sure ?
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <form action="${pageContext.request.contextPath}/client/delete/${requestScope.client.id}" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-outline-danger"><i class="bx bx-trash-alt font-size-18"></i></button>
                </form>
            </div>

        </div>
    </div>
</div>