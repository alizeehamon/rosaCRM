<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="header.jsp">
    <c:param name="title" value="Calendar"></c:param>
</c:import>



<div class="container mt-2 bg-light p-2 rounded">
    <div class="row align-items-center">
        <div class="col-md-6">
            <div class="mb-3">
                <h5 class="card-title">Calendar </h5>
            </div>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div id="calendar"></div>
        </div>
    </div>
</div>


<c:import url="footer.jsp"></c:import>