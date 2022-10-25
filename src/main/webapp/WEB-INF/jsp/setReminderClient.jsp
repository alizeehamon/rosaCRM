<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="setReminder${client.id}">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Set a reminder</h4>
            </div>
            <form action="${pageContext.request.contextPath}/clients/reminder" method="post">
                <!-- Modal body -->
                <div class="text-center modal-body">
                    <div class="row text-start">
                        <div class="col-12 mb-3">
                            <div class="col-12 mb-3">
                                <div class="form-group">
                                    <label for="contactDuration" class="form-label">Set a number of days before next contact</label>
                                    <input id="contactDuration" required min="1" max="60" name="contactDuration" class="form-control" value="${requestScope.client.contactDuration}">
                                </div>
                            </div>
                            <input hidden name="prospect" value="${client.id}">
                        </div>
                    </div>
                </div>


                <!-- Modal footer -->
                <div class="modal-footer">

                    <input hidden name="id" value="${requestScope.client.id}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-outline-danger">Set !</button>

                </div>
            </form>
        </div>
    </div>
</div>