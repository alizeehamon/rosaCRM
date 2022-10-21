<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="header.jsp">
    <c:param name="title" value="Company Details"></c:param>
</c:import>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="../../resources/static/css/profile.css" rel="stylesheet"/>
<section id="content" class="container">
    <!-- Begin .page-heading -->
    <div class="page-heading">
        <div class="media clearfix">
            <div class="media-left pr30">
                <a href="#">
                    <img class="media-object mw150" src="${company.logo}" alt="icon-partner">
                </a>
            </div>
            <div class="media-body va-m">
                <h2 class="media-heading">${company.name}
                    <small> - Details</small>
                </h2>

                <div class="media-links">
                    <ul class="list-inline list-unstyled d-flex justify-content-center">
                        <li class="m-1">
                            <a href="tel:${company.cellPhone}" title="cellphone link">
                                <span class="fa fa-mobile fs35 text-system"></span>
                            </a>
                        </li>
                        <li class="m-1">
                            <a href="tel:${company.homePhone}" title="homephone link">
                                <span class="fa fa-phone-square fs35 text-system"></span>
                            </a>
                        </li>
                        <li class="m-1">
                            <a href="mailto:${company.email}" title="email link">
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
                                                                             href="${pageContext.request.contextPath}/companies/edit/${company.id}">Edit
                                profile</a></button>
                        </li>
                        <li class="m-1">
                            <button type="button" class="btn btn-danger"><a class="text-white"
                                                                            href="${pageContext.request.contextPath}/companies/delete/${company.id}">Delete
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
                    <p>Name : ${company.name}</p>
                    <p>Address : ${company.address1} ${company.address2} - ${company.zipCode} ${company.city}</p>
                    <p>Cellphone : ${company.cellPhone}</p>
                    <p>Home phone : ${company.homePhone}</p>
                    <p>Email : ${company.email}</p>
                </div>
            </div>
            <!-- Liste des clients/prospects -->
            <div class="panel">
                <div class="panel-heading">
              <span class="panel-icon">
                <i class="fa fa-briefcase"></i>
              </span>
                    <span class="panel-title"> My work</span>
                </div>
                <div class="panel-body pb5">

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


                    <hr class="short br-lighter">

                    <h6>Dates I contacted ${company.name}</h6>
                    <p class="text-muted pb10"> //TO DO - Dates des diverses notes
                    </p>

                    <hr class="short br-lighter">

                    <button type="button" class="btn btn-primary"><a class="text-white"
                                                                     href="${pageContext.request.contextPath}/TODO">Choose
                        your time before calling again</a></button>

                    <hr class="short br-lighter">

                    <h6>Events with ${company.name}</h6>

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

                        <div>
                            <h6>Clients from this company</h6>
                            <c:forEach items="${clients}" var="client">
                                <div class="card text-dark bg-light border border-danger  mb-3">
                                    <div class="card-header">${client.firstName} ${client.lastName}</div>
                                    <div class="card-body">
                                        <h5 class="card-title"></h5>
                                        <p class="card-text">Role : ${client.roleEntreprise}</p>
                                        <p class="card-text">Cellphone : ${client.cellPhone}</p>
                                        <p class="card-text">Email : ${client.email}</p>
                                        <a>TO DO lien vers profil </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <hr>
                        <div>
                            <h6>Prospects from this company</h6>
                            <c:forEach items="${prospects}" var="prospect">
                                <div class="card text-dark bg-light border border-danger mb-3">
                                    <div class="card-header">${prospect.firstName} ${prospect.lastName}</div>
                                    <div class="card-body">
                                        <h5 class="card-title"></h5>
                                        <p class="card-text">Role : ${prospect.roleEntreprise}</p>
                                        <p class="card-text">Cellphone : ${prospect.cellPhone}</p>
                                        <p class="card-text">Email : ${prospect.email}</p>
                                        <a>TO DO lien vers profil </a>
                                    </div>
                                </div>
                            </c:forEach>
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
</section>