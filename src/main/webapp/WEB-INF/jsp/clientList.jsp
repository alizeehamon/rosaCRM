<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
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
    <title>Companies</title>
</head>

<jsp:include page="header.jsp"></jsp:include>

<body class="bg-light">
<div class="container mt-2 bg-light p-2 rounded">
    <div class="row align-items-center">
        <div class="col-md-6">
            <div class="mb-3">
                <h5 class="card-title">Clients list </h5>
            </div>
        </div>
        <div class="col-md-6">
            <div class="d-flex flex-wrap align-items-center justify-content-end gap-2 mb-3">
                <div>
                    <form class="d-flex" action="${pageContext.request.contextPath}/clients/all">
                        <input class="form-control me-2 w-30" type="search" placeholder="search a client"
                               name="clientName"
                               aria-label="Search" value="${clientName}">
                        <button class="btn btn-outline-success m-1" type="submit">Search</button>
                        <button class="btn btn-outline-danger m-1" type="button" onclick="clearSearch()">Clear</button>
                    </form>
                </div>
                <div>
                    <a href="${pageContext.request.contextPath}/clients/add" data-bs-toggle="modal"
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
                            <th scope="col">Company - Fonction</th>
                            <th scope="col">Contract date</th>
                            <th scope="col">Last exchange</th>
                            <th scope="col" style="width: 200px;">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${clients}" var="client">
                            <tr>
                                <td><img src="${client.picture}" alt="logo" class="avatar-sm rounded-circle me-2"/> <a
                                        href="${pageContext.request.contextPath}/clients/see/${client.id}"
                                        class="text-body">${client.firstName} ${client.lastName}</a></td>
                                <td><span
                                        class="badge badge-soft-success mb-0">${client.address1} - ${client.zipCode} ${client.city}</span>
                                </td>
                                <td><a href="mailto:${client.email}"><i class="bi bi-envelope"></i></a></td>
                                <td><a href="tel:${client.homePhone}"><i class="bi bi-telephone-forward"></i></a> ou <a
                                        href="tel:${client.cellPhone}"><i
                                        class="bi bi-phone"></i></a></td>
                                <td>${client.company.name} - ${client.roleEntreprise}</td>
                                <td>${client.creationDate}</td>
                                <td>TO DO// Date de la derniere note...</td>
                                <td>
                                    <ul class="list-inline mb-0">
                                        <li class="list-inline-item">
                                            <a href="${pageContext.request.contextPath}/clients/edit/${client.id}"
                                               data-bs-toggle="tooltip" data-bs-placement="top" title="Edit"
                                               class="px-2 text-primary"><i class="bx bx-pencil font-size-18"></i></a>
                                        </li>
                                        <li class="list-inline-item">
                                            <a href="${pageContext.request.contextPath}/clients/delete/${client.id}"
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
<script type="text/javascript">
    function clearSearch() {
        window.location = "${pageContext.request.contextPath}/clients/all";
    }
</script>
</body>
</html>
</body>
</html>