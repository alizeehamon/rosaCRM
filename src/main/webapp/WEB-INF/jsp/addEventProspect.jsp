<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="addEventProspect${requestScope.prospect.id}">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Plan an event</h4>
            </div>
            <form action="${pageContext.request.contextPath}/event/prospects/add" method="post">
                <!-- Modal body -->
                <div class="text-center modal-body">
                    <div class="row text-start">
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="name" class="form-label">Event name</label>
                                <input required id="name" name="name" class="form-control">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <div class="form-group">
                                    <label for="link" class="form-label">Meeting room link</label>
                                    <input id="link" name="link" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-12 mb-3 d-flex flex-column">
                            <label for="description" class="form-label">Description</label>
                            <textarea name="description" id="description" cols="3" rows="5"></textarea>
                        </div>


                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="address1" class="form-label">Address</label>
                                <input id="address1" name="address1" class="form-control">
                            </div>
                        </div>
                        <div class="col-12 mb-3">
                            <div class="form-group">
                                <label for="address2" class="form-label">Address:Line2</label>
                                <input id="address2" name="address2" class="form-control">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="zipCode" class="form-label">Postal code</label>
                                <input id="zipCode" name="zipCode" class="form-control">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="city" class="form-label">City</label>
                                <input id="city" name="city" class="form-control">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="country" class="form-label">Country</label>
                                <input id="country" name="country" class="form-control">
                            </div>
                        </div>

                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="startTimeInput" class="form-label">Event start time</label>
                                <input id="startTimeInput" min="00:00" type="datetime-local" name="startTime"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="col-6 mb-3">
                            <div class="form-group">
                                <label for="endTimeInput" class="form-label">Event end time</label>
                                <input id="endTimeInput" type="datetime-local" max="23:59" name="endTime"
                                       class="form-control">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal footer - Prospect -->
                <div class="modal-footer">
                    <input hidden name="prospect" value="${prospect.id}">
                    <input hidden id="id" value="${requestScope.prospect.id}">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-outline-danger">Create this event</button>
                </div>
            </form>
        </div>
    </div>
</div>

