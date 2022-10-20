<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="header.jsp">
    <c:param name="title" value="Prospects"></c:param>
</c:import>

<div class="container mt-2 bg-light p-2 rounded">
    <div class="row align-items-center">
        <div class="col-md-6">
            <div class="mb-3">
                <h5 class="card-title">Prospects list </h5>
            </div>
        </div>
        <div class="col-md-6">
            <div class="d-flex flex-wrap align-items-center justify-content-end gap-2 mb-3">
                <div>
                    <form class="d-flex" action="${pageContext.request.contextPath}/prospects/all">
                        <input class="form-control me-2 w-30" type="search" placeholder="search a prospect"
                               name="prospectName"
                               aria-label="Search" value="${prospectName}">
                        <button class="btn btn-outline-success m-1" type="submit">Search</button>
                        <button class="btn btn-outline-danger m-1" type="button" onclick="clearSearch()">Clear</button>
                    </form>
                </div>
                <div>
                    <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#addProspect">
                        <i class="bx bx-plus me-1"></i> Add New
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="">
                <div class="table-responsive">
                    <table class="table project-list-table table-nowrap align-middle table-borderless">
                        <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Address</th>
                            <th scope="col">Email</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Company - Fonction</th>
                            <th scope="col">Starting date</th>
                            <th scope="col">Prospection status</th>
                            <th scope="col" style="width: 200px;">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${prospects}" var="prospect">
                            <tr>
                                <td><img src="${prospect.picture}" alt="logo" class="avatar-sm rounded-circle me-2"/> <a
                                        href="${pageContext.request.contextPath}/prospects/see/${prospect.id}"
                                        class="text-body">${prospect.firstName} ${prospect.lastName}</a></td>
                                <td><span
                                        class="badge badge-soft-success mb-0">${prospect.address1} - ${prospect.zipCode} ${prospect.city}</span>
                                </td>
                                <td><a href="mailto:${prospect.email}"><i class="bi bi-envelope"></i></a></td>
                                <td><a href="tel:${prospect.homePhone}"><i class="bi bi-telephone-forward"></i></a> ou
                                    <a
                                            href="tel:${prospect.cellPhone}"><i
                                            class="bi bi-phone"></i></a></td>
                                <td>${prospect.company.name} - ${prospect.roleEntreprise}</td>
                                <td>${prospect.startDate}</td>
                                <td>${prospect.prospectionStatus}</td>
                                <td>
                                    <ul class="list-inline mb-0">
                                        <li class="list-inline-item">
                                            <a href="${pageContext.request.contextPath}/prospects/edit/${prospect.id}"
                                               data-bs-toggle="tooltip" data-bs-placement="top" title="Edit"
                                               class="px-2 text-primary"><i class="bx bx-pencil font-size-18"></i></a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="${pageContext.request.contextPath}/clients/delete/${prospect.id}"
                                               data-bs-toggle="tooltip" data-bs-placement="top" title="Delete"
                                               class="px-2 text-danger"><i class="bx bx-trash-alt font-size-18"></i></a>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<c:set var="companies" value="${companies}" scope="request"/>
<c:import url="addProspectForm.jsp"></c:import>

<c:import url="footer.jsp"></c:import>