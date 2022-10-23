<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="modal fade" id="startProspection">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Start the prospection</h4>
            </div>
            <form action="${pageContext.request.contextPath}/notes/start" method="post">
                <!-- Modal body -->
                <div class="text-center modal-body">
                    <div class="row text-start">
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="message" class="form-label">First note content</label>
                                <textarea id="message" name="message" class="form-control" rows="3"></textarea>
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