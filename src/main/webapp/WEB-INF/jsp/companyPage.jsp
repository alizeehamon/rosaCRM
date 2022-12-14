<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                            <a target="_blank" href="https://www.google.com/maps/search/${company.address1}+${company.address2}+${company.city}+${company.zipCode}" title="address link">
                                <span class="fa fa-globe fs35 text-muted"></span>
                            </a>
                        </li>
                    </ul>
                    <ul class="list-inline list-unstyled d-flex justify-content-center">
                        <li class="m-1">
                            <button type="button" class=" btn btn-primary border-0 px-2 text-white" data-bs-toggle="modal"
                                    data-bs-target="#editCompany${company.id}">Edit company infos
                            </button>
                        </li>
                        <li class="m-1">
                            <button type="button" class=" btn btn-danger border-0 px-2 text-white" data-bs-toggle="modal"
                                    data-bs-target="#deleteConfirm${company.id}">Delete company
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
                    <span class="panel-title"> Company infos</span>
                </div>
                <div class="panel-body pn">
                    <p><span class="card-span-title">Name : </span>${company.name}</p>
                    <p><span class="card-span-title">Address : </span>${company.address1} ${company.address2} - ${company.zipCode} ${company.city}</p>
                    <p><span class="card-span-title">Cellphone : </span>${company.cellPhone}</p>
                    <p><span class="card-span-title">Home phone : </span>${company.homePhone}</p>
                    <p><span class="card-span-title">Email : </span>${company.email}</p>
                    <p><span class="card-span-title">Website : </span><a href="${company.siteUrl}">Here !</a></p>
                    <p><span class="card-span-title">Creation Date : </span>${company.entrepriseCreationDate}</p>
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
                    <p><span class="card-span-title">Activity : </span>${company.sector}</p>
                </div>
            </div>
        </div>
        <div class="col-md-8">

            <div class="tab-block">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#tab1" data-toggle="tab">Clients & Prospects</a>
                    </li>
                    <li>
                        <a href="#tab3" data-toggle="tab">TAB</a>
                    </li>
                </ul>
                <div class="tab-content p30" style="height: 730px;">
                    <div id="tab1" class="tab-pane active container">

                        <div>
                            <h5>Clients from ${company.name}</h5>
                            <c:forEach items="${clients}" var="client">
                                <div class="card text-dark bg-light border-grey shadow-sm  mb-3">
                                    <div class="card-header p-3">
                                        <div>
                                            <h5>${client.firstName} ${client.lastName}</h5>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"></h5>
                                        <p class="card-text mb-1"><span class="card-span-title">Role :</span> ${client.roleEntreprise}</p>
                                        <p class="card-text mb-1"><span class="card-span-title">Cellphone :</span> ${client.cellPhone}</p>
                                        <p class="card-text mb-1 link"><span class="card-span-title">Email :</span><a class="link mx-1"
                                                                            href="mailto:${client.email}">${client.email}</a>
                                        </p>
                                        <a class="btn-outline-danger btn card-text" href="/clients/see/${client.id}">Click here for details about this client</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <hr class="hr shadow-sm">
                        <div>
                            <h5>Prospects from ${company.name}</h5>
                            <c:forEach items="${prospects}" var="prospect">
                                <div class="card text-dark bg-light border border-grey shadow-sm mb-3">
                                    <div class="card-header p-3">
                                        <h5>${prospect.firstName} ${prospect.lastName}</h5></div>
                                    <div class="card-body">
                                        <p class="card-text mb-1"><span class="card-span-title">Role :</span> ${prospect.roleEntreprise}</p>
                                        <p class="card-text mb-1"><span class="card-span-title">Cellphone :</span> ${prospect.cellPhone}</p>
                                        <p class="card-text mb-1 link"><span class="card-span-title">Email :</span><a class="link mx-1"
                                                                            href="mailto:${prospect.email}">${prospect.email}</a>
                                        </p>
                                        <a class="btn-outline-danger btn card-text mb-1" href="/prospects/see/${prospect.id}">Click
                                            here for
                                            details about this prospect</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <div id="tab3" class="tab-pane"></div>
                <div id="tab4" class="tab-pane"></div>
            </div>
        </div>

    </div>
    <c:set var="company" value="${company}" scope="request"/>
    <c:import url="editCompany.jsp"/>
    <c:import url="deleteCompany.jsp"/>
</section>
<c:import url="footer.jsp"/>