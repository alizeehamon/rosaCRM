
<div class="modal fade" id="confirmToClient">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Transform prospect to client</h4>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                Are you sure ?
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <form action="${pageContext.request.contextPath}/prospects/prospect-to-client/${requestScope.prospect.id}" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-white border-secondary">Confirm</button>
                </form>
            </div>

        </div>
    </div>
</div>