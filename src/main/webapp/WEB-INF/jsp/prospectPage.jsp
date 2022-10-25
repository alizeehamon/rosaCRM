<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="header.jsp">
    <c:param name="title" value="Prospect Details"></c:param>
</c:import>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="../../resources/static/css/profile.css" rel="stylesheet"/>
<section id="content" class="container">
    <!-- Begin .page-heading -->
    <div class="page-heading">
        <div class="media clearfix">
            <div class="media-left pr30">
                <a href="#">
                    <img class="media-object mw150" src="${prospect.picture}" alt="icon-partner">
                </a>
            </div>
            <div class="media-body va-m">
                <h2 class="media-heading">${prospect.firstName} ${prospect.lastName}
                    <small> - Details</small>
                </h2>
                <p class="lead">${prospect.firstName} was added to your list of prospects
                    on: ${prospect.creationDate}</p>
                <div class="media-links">
                    <ul class="list-inline list-unstyled d-flex justify-content-center">
                        <li class="m-1">
                            <a href="tel:${prospect.cellPhone}" title="cellphone link">
                                <span class="fa fa-mobile fs35 text-system"></span>
                            </a>
                        </li>
                        <li class="m-1">
                            <a href="tel:${prospect.homePhone}" title="homephone link">
                                <span class="fa fa-phone-square fs35 text-system"></span>
                            </a>
                        </li>
                        <li class="m-1">
                            <a href="mailto:${prospect.email}" title="email link">
                                <span class="fa fa-envelope-square fs35 text-muted"></span>
                            </a>
                        </li>
                        <li class="m-1">
                            <a target="_blank" href="https://www.google.com/maps/search/${prospect.address1}+${prospect.address2}+${prospect.city}+${prospect.zipCode}" title="address link">
                                <span class="fa fa-globe fs35 text-muted"></span>
                            </a>
                        </li>
                    </ul>
                    <ul class="list-inline list-unstyled d-flex justify-content-center">
                        <li class="m-1">
                            <button type="button" class="btn btn-primary border-0 px-2 text-white"
                                    data-bs-toggle="modal"
                                    data-bs-target="#editProspect${prospect.id}">Edit profile
                            </button>
                        </li>
                        <li class="m-1">
                            <button type="button" class=" btn btn-danger border-0 px-2 text-white"
                                    data-bs-toggle="modal"
                                    data-bs-target="#deleteConfirm${prospect.id}">Delete Prospect
                            </button>
                        </li>
                        <c:if test="${prospect.prospectionStatus eq 'Not started'}">
                            <li class="m-1">
                                <button type="button" class="btn btn-outline-success" data-bs-toggle="modal"
                                        data-bs-target="#startProspection">Start prospection
                                </button>
                            </li>
                        </c:if>
                        <c:if test="${prospect.prospectionStatus ne notStarted}">
                            <li class="m-1">
                                <form action="${pageContext.request.contextPath}/prospects/edit-status-to-contact"
                                      method="post">
                                    <input hidden name="id" value="${prospect.id}">
                                    <input hidden name="prospectionStatus" value="To contact">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <button type="submit" class="btn btn-success">To contact</button>
                                </form>
                            </li>
                            <li class="m-1">
                                <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                        data-bs-target="#confirmToClient">Become
                                    a client
                                </button>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--Prospect infos -->
    <div class="row">
        <div class="col-md-4">
            <div class="panel">
                <div class="panel-heading">
              <span class="panel-icon">
                <i class="fa fa-info-circle"></i>
              </span>
                    <span class="panel-title"> Contact infos</span>
                </div>
                <div class="panel-body pn">
                    <p>Name : ${prospect.firstName} ${prospect.lastName}</p>
                    <p>Address : ${prospect.address1} ${prospect.address2} - ${prospect.zipCode} ${prospect.city}</p>
                    <p>Cellphone : ${prospect.cellPhone}</p>
                    <p>Home phone : ${prospect.homePhone}</p>
                    <p>Email : ${prospect.email}</p>
                </div>
            </div>
            <div class="panel">
                <div class="panel-heading">
              <span class="panel-icon">
                <i class="fa fa-briefcase"></i>
              </span>
                    <span class="panel-title"> My work</span>
                </div>
                <div class="panel-body pb5">
                    <p>My company : ${prospect.company.name}</p>
                    <p>My function : ${prospect.roleEntreprise}</p>
                </div>
            </div>
            <div class="panel">
                <div class="panel-heading">
              <span class="panel-icon">
                <i class="fa fa-pencil"></i>
              </span>
                    <span class="panel-title">History of our exchanges</span>
                </div>
                <div class="panel-body pb5">

                    <h6>Prospect creation date</h6>
                    <p class="text-muted"> ${prospect.creationDate}
                    </p>

                    <hr class="short br-lighter">

                    <h6>Prospection status / starting date </h6>

                    <p class="text-muted"> ${prospect.prospectionStatus} - ${prospect.startDate}
                    </p>

                    <hr class="short br-lighter">

                    <h6>Last contact with ${prospect.firstName}</h6>
                    <c:if test="${prospect.prospectionStatus eq notStarted}">None yet</c:if>
                    <p class="text-muted pb10"> ${prospect.notesById[0].noteCreationDate}
                    </p>

                    <hr class="short br-lighter">

                    <button type="button" class="btn btn-primary"><a class="text-white"
                                                                     href="${pageContext.request.contextPath}/">Set a reminder for this prospect</a></button>

                    <hr class="short br-lighter">

                    <h6>Last/Next event with ${prospect.firstName}</h6>

                    <p class="text-muted pb10"> //TO DO - Date last event programmed
                    </p>

                    <button type="button" class=" btn btn-danger border-0 px-2 text-white"
                            data-bs-toggle="modal"
                            data-bs-target="#addEventProspect${prospect.id}">Create an event
                    </button>

                </div>
            </div>
        </div>
        <div class="col-md-8">

            <div class="tab-block">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#tab1" data-toggle="tab">Notes</a>
                    </li>
                    <li>
                        <a href="#tab2" data-toggle="tab">TAB</a>
                    </li>
                    <li>
                        <a href="#tab3" data-toggle="tab">TAB</a>
                    </li>
                </ul>
                <div class="tab-content p30" style="height: 730px;">
                    <div id="tab1" class="tab-pane active">
                        <c:if test="${prospect.prospectionStatus eq notStarted}">
                            <p>The prospection has not started yet....</p>
                        </c:if>
                        <c:if test="${prospect.prospectionStatus ne notStarted}">
                            <div class="container d-flex flex-column mt-5 border-left border-right ">
                                <form method="post" action="${pageContext.request.contextPath}/notes/prospects/add">
                                    <div class="d-flex justify-content-center pt-3 pb-2">
                                        <input type="text" name="message" placeholder="+ Write your message"
                                               class="form-control addtxt">
                                        <input type="hidden" name="prospect" value="${prospect.id}"/>
                                    </div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Add
                                            a note
                                        </button>
                                    </div>
                                </form>

                                <!-- Prospect notes display -->
                                <c:forEach items="${notes}" var="note">
                                    <div class="note-container border border-1 container my-3 bg-light shadow">
                                        <div class="row note-container-row d-flex flex-column flex-md-row">
                                            <div class="col-12 col-md-8 p-1 p-lg-2 border border-right">
                                                <h6 class="card-title border-bottom mb-3">Note message :</h6>
                                                <form class="note-content d-flex flex-column"
                                                      action="${pageContext.request.contextPath}/notes/prospects/edit/"
                                                      method="post">
                                                    <div class="form-group">
                                                        <input hidden class="form-control" name="id" type="text"
                                                               value="${note.id}"/>
                                                        <textarea class="form-control bg-light text-areaControl"
                                                                  readonly="readonly" name="message"
                                                                  rows="3">${note.message}</textarea>
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                               value="${_csrf.token}"/>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary align-self-end mt-1"><i
                                                            class="bx bx-pencil font-size-18"></i></button>
                                                </form>
                                            </div>
                                            <div class="col-12 col-md-4 p-md-1 p-1 p-lg-2  bg-light d-flex flex-column justify-content-between align-items-end">
                                                <div class="d-flex flex-column flex-lg-row align-self-end">
                                                    <form action="${pageContext.request.contextPath}/notes/prospects/delete/${note.id}"
                                                          method="post">
                                                        <button class="btn btn-danger"><i
                                                                class="bx bx-trash-alt font-size-18"></i></button>
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                               value="${_csrf.token}"/>
                                                    </form>
                                                </div>
                                                <div class="note-content d-flex flex-column justify-content-end align-self-end">
                                                    <div class="d-inline-flex justify-content-end">
                                                        <div class="d-flex">
                                                            <span class="text3">Date <span
                                                                    class="thumbup"><i
                                                                    class="fa fa-clock-o"></i></span>
                                                            </span>
                                                        </div>

                                                        <span class="text4">${note.noteCreationDate}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:if>

                    </div>
                </div>
                <div id="tab2" class="tab-pane"></div>
                <div id="tab3" class="tab-pane"></div>
                <div id="tab4" class="tab-pane"></div>
            </div>
        </div>
    </div>
</section>
<c:set var="prospectStatusListclean" value="${prospectStatusListclean}" scope="request"/>
<c:set var="prospect" value="${prospect}" scope="request"/>
<c:import url="confirmToClient.jsp"/>

<c:import url="startProspection.jsp"/>
<c:import url="addEventProspect.jsp"/>
<c:import url="editProspect.jsp"/>
<c:import url="deleteProspect.jsp"/>
<script type="text/javascript" src="../../resources/static/js/textareaToggleProspects.js"></script>
<c:import url="footer.jsp"/>