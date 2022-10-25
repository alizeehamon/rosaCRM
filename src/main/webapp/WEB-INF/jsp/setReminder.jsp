<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="setReminder">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Set a reminder</h4>
            </div>
            <form action="${pageContext.request.contextPath}/prospects/reminder" method="post">
                <!-- Modal body -->
                <div class="text-center modal-body">
                    <div class="row text-start">
                        <div class="col-12 mb-3">
                            <div class="col-12 mb-3">
                                <div class="form-group">
                                    <label for="relanceDuration" class="form-label">Set number of days before reminder</label>
                                    <input id="relanceDuration" required min="1" name="relanceDuration" class="form-control" value="${requestScope.prospect.relanceDuration}">
                                </div>
                            </div>
                                <input hidden name="prospect" value="${prospect.id}">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">

                    <input hidden name="id" value="${requestScope.prospect.id}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-outline-danger">Start</button>

                </div>
            </form>
        </div>
    </div>
</div>