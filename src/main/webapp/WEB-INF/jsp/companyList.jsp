<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="../../resources/static/css/header.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="../../resources/static/css/list.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css"
          integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css"
          integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>

    <title>Companies</title>
</head>
<body>
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
                                               class="px-2 text-primary "><i class="bx bx-pencil font-size-18"></i></a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a class="px-2 text-danger delete-modal-toggler" style="cursor: pointer" data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal" value="${company.id}">
                                                <i class="bx bx-trash-alt font-size-18"></i>
                                            </a>
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
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Do you really want to delete this company ?
                </div>
                <div class="modal-footer">
                    <button class="btn btn-white border-danger">
                        <a href="${pageContext.request.contextPath}/companies/delete/"
                           data-bs-toggle="tooltip" data-bs-placement="top" title="Delete"
                           class="px-2 text-danger delete-modal-trigger"><i class="bx bx-trash-alt font-size-18"></i>
                        </a>
                    </button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

</div>

<c:import url="addCompanyForm.jsp"></c:import>
<c:import url="footer.jsp"></c:import>
<script type="text/javascript">
    function clearSearch() {
        window.location = "${pageContext.request.contextPath}/companies/all";
    }
</script>
<script src="../../resources/static/js/deleteCompanyModal.js"></script>
</body>
</html>



