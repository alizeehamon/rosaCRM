
<div class="modal fade" id="deleteConfirm${param.prospectId}">
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
                <form action="${pageContext.request.contextPath}/prospects/delete" method="post">
                    <input hidden name="prospectId" value="${param.prospectId}">
                    <button type="submit" class="btn btn-white border-danger"><i class="bx bx-trash-alt font-size-18"></i></button>
                </form>
            </div>

        </div>
    </div>
</div>