<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:import url="header.jsp">
    <c:param name="title" value="ROSACRM | Companies"/>
</c:import>
<c:set var="companies" value="${companies}" scope="request"/>
<c:set var="sectorList" value="${sectorList}" scope="request"/>

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
                <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#addCompany">
                    <i class="bx bx-plus me-1"></i> Add New
                </button>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="">
                <div class="table-responsive">
                    <table id="table_id" class="table project-list-table table-nowrap align-middle table-borderless">
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
                        <!%-- conditional error message on delete --%>
                        <c:if test="${errorsql == true}">
                            <div class="alert alert-danger" role="alert">
                                Error, the company that you tried to delete still contains clients or prospects
                            </div>
                        </c:if>

                        <!-- Company for each start-->
                        <c:forEach items="${companies}" var="company">
                            <tr>
                                <td><img src="${company.logo}" alt="logo" class="avatar-sm rounded-circle me-2"/> <a
                                        href="${pageContext.request.contextPath}/companies/see/${company.id}"
                                        class="text-body">${company.name}</a></td>
                                <td>
                                    <a target="_blank" class="badge badge-soft-success mb-0 entity-address">${company.address1} - ${company.zipCode} ${company.city}</a>
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
                                            <button type="button" class="btn-link px-2 btn border-0 text-primary" data-bs-toggle="modal"
                                                    data-bs-target="#editCompany${company.id}">
                                                <i class="bx bx-pencil font-size-18"></i>
                                            </button>
                                        </li>

                                        <li class="list-inline-item">
                                            <button type="button" class="btn-link btn border-0 px-2 text-danger" data-bs-toggle="modal"
                                                    data-bs-target="#deleteConfirm${company.id}">
                                                <i class="bx bx-trash-alt font-size-18"></i>
                                            </button>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                            <c:set var="company" value="${company}" scope="request"/>
                            <c:import url="editCompany.jsp"/>
                            <c:import url="deleteCompany.jsp"/>
                        </c:forEach>
                        <!-- Company for each end-->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
<c:import url="addCompanyForm.jsp"/>
<script type="text/javascript">
    function clearSearch() {
        window.location = "${pageContext.request.contextPath}/companies/all";
    }
</script>
<script src="../../resources/static/js/displayAddressGMap.js"></script>
<c:import url="footer.jsp"/>


