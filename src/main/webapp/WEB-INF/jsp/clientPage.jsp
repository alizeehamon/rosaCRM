<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="header.jsp">
    <c:param name="title" value="Client Details"></c:param>
</c:import>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="../../resources/static/css/profile.css" rel="stylesheet"/>
<section id="content" class="container">
    <!-- Begin .page-heading -->
    <div class="page-heading">
        <div class="media clearfix">
            <div class="media-left pr30">
                <a href="#">
                    <img class="media-object mw150" src="${client.picture}" alt="icon-partner">
                </a>
            </div>
            <div class="media-body va-m">
                <h2 class="media-heading">${client.firstName} ${client.lastName}
                    <small> - Details</small>
                </h2>
                <p class="lead">${client.firstName} was added to your list of clients on: ${client.creationDate}</p>
                <div class="media-links">
                    <ul class="list-inline list-unstyled d-flex justify-content-center">
                        <li class="m-1">
                            <a href="tel:${client.cellPhone}" title="cellphone link">
                                <span class="fa fa-mobile fs35 text-system"></span>
                            </a>
                        </li>
                        <li class="m-1">
                            <a href="tel:${client.homePhone}" title="homephone link">
                                <span class="fa fa-phone-square fs35 text-system"></span>
                            </a>
                        </li>
                        <li class="m-1">
                            <a href="mailto:${client.email}" title="email link">
                                <span class="fa fa-envelope-square fs35 text-muted"></span>
                            </a>
                        </li>
                        <li class="m-1">
                            <a target="_blank"
                               href="https://www.google.com/maps/search/${client.address1}+${client.address2}+${client.city}+${client.zipCode}"
                               title="address link">
                                <span class="fa fa-globe fs35 text-muted"></span>
                            </a>
                        </li>
                    </ul>
                    <ul class="list-inline list-unstyled d-flex justify-content-center">
                        <li class="m-1">
                            <button type="button" class="btn btn-primary border-0 px-2 text-white"
                                    data-bs-toggle="modal"
                                    data-bs-target="#editClient${client.id}">Edit profile
                            </button>
                        </li>
                        <li class="m-1">
                            <button type="button" class=" btn btn-danger border-0 px-2 text-white"
                                    data-bs-toggle="modal"
                                    data-bs-target="#deleteConfirm${client.id}">Delete client
                            </button>
                        </li>
                        <li class="m-1">
                            <button type="button" class="btn btn-warning" data-bs-toggle="modal"
                                    data-bs-target="#changeCompany">Change
                                company
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

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
                    <p>Name : ${client.firstName} ${client.lastName}</p>
                    <p>Address : ${client.address1} ${client.address2} - ${client.zipCode} ${client.city}</p>
                    <p>Cellphone : ${client.cellPhone}</p>
                    <p>Home phone : ${client.homePhone}</p>
                    <p>Email : ${client.email}</p>
                </div>
            </div>
            <div class="panel">
                <div class="panel-heading">
              <span class="panel-icon">
                <i class="fa fa-briefcase"></i>
              </span>
                    <span class="panel-title"> Work place</span>
                </div>
                <div class="panel-body pb5">
                    <p>Company : ${client.company.name}</p>
                    <p>Function : ${client.roleEntreprise}</p>
                </div>
            </div>
            <div class="panel">
                <div class="panel-heading">
              <span class="panel-icon">
                <i class="fa fa-pencil"></i>
              </span>
                    <span class="panel-title">History with my client</span>
                </div>
                <div class="panel-body pb5 d-flex flex-column align-items-left">

                    <h6>Client creation date</h6>
                    <p class="text-muted"> ${client.creationDate}
                    </p>

                    <hr class="short br-lighter">

                    <h6>Last time I contacted ${client.firstName}</h6>
                    <p class="text-muted pb10"> ${client.notesById[0].noteCreationDate}
                    </p>

                    <hr class="short br-lighter">

                    <button type="button" class=" btn btn-danger border-0 px-2 text-white"
                            data-bs-toggle="modal"
                            data-bs-target="#setReminder${client.id}">Set a reminder
                    </button>

                    <hr class="short br-lighter">

                    <h6>Last/Next event with ${client.firstName}</h6>

                    <c:if test="${empty client.eventsById}">
                        <p>You have no event with ${client.firstName} ${client.lastName}</p>
                    </c:if>
                    <c:if test="${not empty client.eventsById[0]}">
                        <ul>
                            <li>
                                <p class="text-muted pb10"><span
                                        class="text-dark">Nom de l'évènement : </span><br>${client.eventsById[0].name}
                                </p>
                            </li>
                            <li>
                                <p class="text-muted pb10"><span
                                        class="text-dark">Date de fin : </span><br>${client.eventsById[0].endTime}</p>
                            </li>
                            <c:if test="${not empty client.eventsById[0].link }">
                                <li>
                                    <p class="text-muted pb10"><span class="text-dark">Where : </span><br>Remote</p>
                                </li>
                            </c:if>
                            <c:if test="${empty client.eventsById[0].link}">
                                <li>
                                    <p class="text-muted pb10"><span
                                            class="text-dark">Where : </span><br>${client.eventsById[0].address1} ${client.eventsById[0].address2} ${client.eventsById[0].city} ${client.eventsById[0].zipCode}
                                    </p>
                                </li>
                            </c:if>
                        </ul>
                    </c:if>


                    <button type="button" class=" btn btn-danger border-0 px-2 text-white"
                            data-bs-toggle="modal"
                            data-bs-target="#addEventClient${client.id}">Create an event
                    </button>

                </div>
            </div>
        </div>
        <div class="col-md-8">

            <div class="tab-block">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#tab1" type="button" role="tab" aria-controls="home" aria-selected="true">Notes</button>
                    </li>
                    <c:if test="${!prospectionNotes.isEmpty()}" >
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#tab2" type="button" role="tab" aria-controls="profile" aria-selected="false">Prospection History</button>
                        </li>
                    </c:if>
                </ul>
                <div id="myTabContent" class="tab-content p30" style="height: 730px;">
                    <div id="tab1" class="tab-pane fade show active" role="tabpanel">
                        <div class="container justify-content-center mt-5 border-left border-right">
                            <form method="post" action="${pageContext.request.contextPath}/notes/add">
                                <div class="d-flex justify-content-center pt-3 pb-2">
                                    <input type="text" name="message" placeholder="+ Write your message"
                                           class="form-control addtxt">
                                    <input type="hidden" name="client" value="${client.id}"/>
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
                                <div class="note-container container my-3 bg-light shadow p-0">
                                    <div class="row note-container-row bg-light border border-left-0 d-flex flex-column flex-md-row">
                                        <div class="col-12 col-md-8 p-1 p-lg-2 border border-right-1 border-left-0 border-bottom-0 border-top-0">
                                            <h6 class="card-title border-bottom mb-3">Note message :</h6>
                                            <form class="note-content d-flex flex-column"
                                                  action="${pageContext.request.contextPath}/notes/clients/edit/"
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
                                        <div class="col-12 col-md-4 p-md-1 p-1 p-lg-2 bg-light d-flex flex-column justify-content-between align-items-end border-0 border-left-1 border-bottom-1">
                                            <div class="d-flex flex-column flex-md-row align-self-end">
                                                <form action="${pageContext.request.contextPath}/notes/clients/delete/${note.id}"
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
                    </div>
                    <div id="tab2" class="tab-pane fade" role="tabpanel">
                        <div class="container justify-content-center mt-5 border-left border-right">
                            <!-- Prospection notes display -->
                            <c:forEach items="${prospectionNotes}" var="prospectionNote">
                                <div class="note-container container my-3 bg-light shadow p-0">
                                    <div class="row note-container-row bg-light border border-left-0 d-flex flex-column flex-md-row">
                                        <div class="col-12 col-md-8 p-1 p-lg-2 border border-right-1 border-left-0 border-bottom-0 border-top-0">
                                            <h6 class="card-title border-bottom mb-3">Note message :</h6>
                                            <div class="form-group">
                                                <input hidden class="form-control" name="id" type="text"
                                                       value="${prospectionNote.id}"/>
                                                <textarea disabled class="form-control bg-light text-areaControl"
                                                          readonly="readonly" name="message"
                                                          rows="3">${prospectionNote.message}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-4 p-md-1 p-1 p-lg-2 bg-light d-flex flex-column justify-content-between align-items-end border-0 border-left-1 border-bottom-1">

                                            <div class="note-content d-flex flex-column justify-content-end align-self-end">
                                                <div class="d-inline-flex justify-content-end">
                                                    <div class="d-flex">
                                                            <span class="text3">Date <span
                                                                    class="thumbup"><i
                                                                    class="fa fa-clock-o"></i></span>
                                                            </span>
                                                    </div>

                                                    <span class="text4">${prospectionNote.noteCreationDate}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<c:set var="client" value="${client}" scope="request"/>
<c:import url="setReminderClient.jsp"/>
<c:import url="editClient.jsp"/>
<c:import url="addEventClient.jsp"/>
<c:import url="deleteClient.jsp"/>
<c:import url="changeCompany.jsp"/>
<script type="text/javascript" src="../../resources/static/js/textAreaToggleClient.js"></script>
<c:import url="footer.jsp"/>