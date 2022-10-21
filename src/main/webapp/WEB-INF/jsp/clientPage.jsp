<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <a href="#" title="address link">
                                <span class="fa fa-globe fs35 text-muted"></span>
                            </a>
                        </li>
                    </ul>
                    <ul class="list-inline list-unstyled d-flex justify-content-center">
                        <li class="m-1">
                            <button type="button" class="btn btn-primary"><a class="text-white"
                                                                             href="${pageContext.request.contextPath}/clients/edit/${client.id}">Edit
                                profile</a></button>
                        </li>
                        <li class="m-1">
                            <button type="button" class="btn btn-danger"><a class="text-white"
                                                                            href="${pageContext.request.contextPath}/clients/delete/${client.id}">Delete
                                profile</a></button>
                        </li>
                        <li class="m-1">
                            <button type="button" class="btn btn-warning"><a class="text-white"
                                                                             href="${pageContext.request.contextPath}/TODO">Change
                                company</a></button>
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
                    <span class="panel-title"> My work</span>
                </div>
                <div class="panel-body pb5">
                    <p>My company : ${client.company.name}</p>
                    <p>My function : ${client.roleEntreprise}</p>
                </div>
            </div>
            <div class="panel">
                <div class="panel-heading">
              <span class="panel-icon">
                <i class="fa fa-pencil"></i>
              </span>
                    <span class="panel-title">History with my client</span>
                </div>
                <div class="panel-body pb5">

                    <h6>Client creation date</h6>
                    <p class="text-muted"> ${client.creationDate}
                    </p>

                    <hr class="short br-lighter">

                    <h6>Dates I contacted ${client.firstName}</h6>
                    <p class="text-muted pb10"> //TO DO - Dates des diverses notes
                    </p>

                    <hr class="short br-lighter">

                    <button type="button" class="btn btn-primary"><a class="text-white"
                                                                     href="${pageContext.request.contextPath}/TODO">Choose
                        your time before calling again</a></button>

                    <hr class="short br-lighter">

                    <h6>Events with ${client.firstName}</h6>

                    <p class="text-muted pb10"> //TO DO - Dates des events
                    </p>

                    <button type="button" class="btn btn-primary"><a class="text-white"
                                                                     href="${pageContext.request.contextPath}/TODO">Add
                        an event</a></button>

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
                        <a href="#tab2" data-toggle="tab">Prospection History</a>
                    </li>
                    <li>
                        <a href="#tab3" data-toggle="tab">TAB</a>
                    </li>
                </ul>
                <div class="tab-content p30" style="height: 730px;">
                    <div id="tab1" class="tab-pane active">
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
                            <c:forEach items="${notes}" var="note">
                                <div class="note-container">
                                    <div class="d-flex justify-content-center py-2">
                                        <div class="second py-2 px-2"><span class="text1">${note.message}</span>
                                            <div class="d-flex justify-content-end py-1 pt-2">
                                                <div><span class="text3">Date</span><span class="thumbup"><i
                                                        class="fa fa-clock-o"></i></span><span
                                                        class="text4">${note.noteCreationDate}</span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div id="tab2" class="tab-pane active">
            </div>

            <div id="tab3" class="tab-pane"></div>
            <div id="tab4" class="tab-pane"></div>
        </div>
    </div>
    </div>
    </div>
</section>