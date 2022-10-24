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
        <div class="col-lg-8">
            <div id="calendar"></div>
        </div>
    </div>
</div>

<script>
    let events = [];
    <c:forEach items="${eventList}" var="event">
    events.push({
        title: "${event.name}",
        start: "${event.startTime}".replace(" ", "T"),
        end: "${event.endTime}".replace(" ", "T")
    });
    </c:forEach>
    console.log(events);
</script>

<c:import url="footer.jsp"></c:import>