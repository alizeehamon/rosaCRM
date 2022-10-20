<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="header.jsp">
    <c:param name="title" value="clients"></c:param>
</c:import>

<div class="container mt-2 bg-light p-2 rounded">
    <div class="row align-items-center">
        <div class="col-md-6">
            <div class="mb-3">
                <h5 class="card-title">Companies list </h5>
            </div>
        </div>
        <div class="col-md-6">
            <div class="d-flex flex-wrap align-items-center justify-content-end gap-2 mb-3">
                <div>
                    <form class="d-flex" action="${pageContext.request.contextPath}/companies/all">
                        <input class="form-control me-2 w-30" type="search" placeholder="search a company"
                               name="companyName"
                               aria-label="Search" value="${companyName}">
                        <button class="btn btn-outline-success m-1" type="submit">Search</button>
                        <button class="btn btn-outline-danger m-1" type="button" onclick="clearSearch()">Clear</button>
                    </form>
                </div>
                <div>
                    <a href="${pageContext.request.contextPath}/companies/add" data-bs-toggle="modal"
                       data-bs-target=".add-new" class="btn btn-primary"><i class="bx bx-plus me-1"></i> Add New</a>
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
                            <th scope="col">SIRET</th>
                            <th scope="col">Website</th>
                            <th scope="col">Sector</th>
                            <th scope="col" style="width: 200px;">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${companies}" var="company">
                            <tr>
                                <td><img src="${company.logo}" alt="logo" class="avatar-sm rounded-circle me-2"/> <a
                                        href="${pageContext.request.contextPath}/companies/see/${company.id}"
                                        class="text-body">${company.name}</a></td>
                                <td><span
                                        class="badge badge-soft-success mb-0">${company.address1} - ${company.zipCode} ${company.city}</span>
                                </td>
                                <td><a href="mailto:${company.email}"><i class="bi bi-envelope"></i></a></td>
                                <td><a href="tel:${company.homePhone}"><i class="bi bi-telephone-forward"></i></a> ou <a
                                        href="tel:${company.cellPhone}"><i
                                        class="bi bi-phone"></i></a></td>
                                <td>${company.siret}</td>
                                <td><a href="${company.siteUrl}"><i class="bi bi-globe"></i></a></td>
                                <td>${company.sector.activitySector}</td>
                                <td>
                                    <ul class="list-inline mb-0">
                                        <li class="list-inline-item">
                                            <a href="${pageContext.request.contextPath}/companies/edit/${company.id}"
                                               data-bs-toggle="tooltip" data-bs-placement="top" title="Edit"
                                               class="px-2 text-primary"><i class="bx bx-pencil font-size-18"></i></a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="${pageContext.request.contextPath}/companies/delete/${company.id}"
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
</div>

<c:import url="footer.jsp"></c:import>