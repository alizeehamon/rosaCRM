<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <a href="#" title="address link">
                                <span class="fa fa-globe fs35 text-muted"></span>
                            </a>
                        </li>
                    </ul>
                    <ul class="list-inline list-unstyled d-flex justify-content-center">
                        <li class="m-1">
                            <button type="button" class="btn btn-primary"><a class="text-white"
                                                                             href="${pageContext.request.contextPath}/prospects/edit/${prospect.id}">Edit
                                profile</a></button>
                        </li>
                        <li class="m-1">
                            <button type="button" class="btn btn-danger"><a class="text-white"
                                                                            href="${pageContext.request.contextPath}/prospects/delete/${prospect.id}">Delete
                                profile</a></button>
                        </li>
                        <c:if test="${prospect.prospectionStatus eq notStarted}">
                            <li class="m-1">
                                <button type="button" class="btn btn-success" data-bs-toggle="modal"
                                        data-bs-target="#startProspection">Start prospection
                                </button>
                            </li>
                        </c:if>
                        <c:if test="${prospect.prospectionStatus ne notStarted}">
                            <li class="m-1">
                                <button type="button" class="btn btn-success"><a class="text-white"
                                                                                 href="${pageContext.request.contextPath}/TDO">Become
                                    a client</a></button>
                            </li>
                        </c:if>
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

                    <h6>Dates I contacted ${prospect.firstName}</h6>
                    <p class="text-muted pb10"> //TO DO - Dates des diverses notes
                    </p>

                    <hr class="short br-lighter">

                    <button type="button" class="btn btn-primary"><a class="text-white"
                                                                     href="${pageContext.request.contextPath}/TODO">Choose
                        your time before calling again</a></button>

                    <hr class="short br-lighter">

                    <h6>Events with ${prospect.firstName}</h6>

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
                        <a href="#tab2" data-toggle="tab">TAB</a>
                    </li>
                    <li>
                        <a href="#tab3" data-toggle="tab">TAB</a>
                    </li>
                </ul>
                <div class="tab-content p30" style="height: 730px;">
                    <div id="tab1" class="tab-pane active">

                    </div>
                </div>
                <div id="tab2" class="tab-pane"></div>
                <div id="tab3" class="tab-pane"></div>
                <div id="tab4" class="tab-pane"></div>
            </div>
        </div>
    </div>
    </div>
</section>
<c:import url="startProspection.jsp"/>
<c:import url="footer.jsp"></c:import>