<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="../../resources/static/css/header.css" rel="stylesheet"/>
    <link href="../../resources/static/css/dashboard.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <title>Dashboard</title>
</head>
<body>

<c:import url="header.jsp">
    <c:param name="title" value="Dashboard"></c:param>
</c:import>

<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <!-- Header-->
    <header class="py-5">
        <div class="container px-5">
            <div class="row gx-5 align-items-center justify-content-center">
                <div class="col-lg-8 col-xl-7 col-xxl-6">
                    <div class="my-5 text-center text-xl-start">
                        <h1 class="display-5 fw-bolder text-white mb-2">Welcome to your CRM dashboard!</h1>
                        <p class="lead fw-normal text-white-50 mb-4">ROSA is your favourite tool to deal with your
                            customers' relationship, use it to manage every aspect of your business without having to
                            worry about schedule, follow-ups and contract activities!</p>
                        <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                            <a class="btn btn-light border-1 rounded-3 text-dark btn-lg px-4 me-sm-3" href="#features">Get Started</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5"
                                                                                   src="https://images.pexels.com/photos/3184292/pexels-photo-3184292.jpeg"
                                                                                   alt="img-dashboard"/></div>
            </div>
        </div>
    </header>
    <!-- Features section-->
    <section class="py-5" id="features">
        <div class="container px-5 my-5">
            <div class="row gx-5">
                <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">A better way to start building our
                    business relationship.</h2></div>
                <div class="col-lg-8">
                    <div class="row gx-5 row-cols-1 row-cols-md-2">
                        <div class="col mb-5 h-100">
                            <div class="feature bg-gradient text-white rounded-3 mb-3 text-center"
                                 style="width:2rem;background-color: #CE2626"><i
                                    class="bi bi-chat-dots"></i></div>
                            <h2 class="h5"><span style="color:#CE2626">R</span> for Relation</h2>
                            <p class="mb-0">Send emails, call your business partners and never forget to chat with any
                                of them. Be in control of your business!</p>
                        </div>
                        <div class="col mb-5 h-100">
                            <div class="feature bg-gradient text-white rounded-3 mb-3 text-center"
                                 style="width:2rem;background-color: #CE2626"><i
                                    class="bi bi-folder-check"></i></div>
                            <h2 class="h5"><span style="color:#CE2626">O</span> for Optimization</h2>
                            <p class="mb-0">One tool to do it all! Have your customer portfolio, manage their
                                follow-ups, all in a few clicks.</p>
                        </div>
                        <div class="col mb-5 mb-md-0 h-100">
                            <div class="feature bg-gradient text-white rounded-3 mb-3 text-center"
                                 style="width:2rem; background-color: #CE2626;">
                                <i
                                        class="bi bi-calendar2-check"></i></div>
                            <h2 class="h5"><span style="color:#CE2626">S</span> for Schedule</h2>
                            <p class="mb-0">Manage your events with your clients or future ones, never forget an
                                appointment.</p>
                        </div>
                        <div class="col h-100">
                            <div class="feature bg-gradient text-white rounded-3 mb-3 text-center"
                                 style="width:2rem;background-color: #CE2626"><i
                                    class="bi bi-graph-up-arrow"></i></div>
                            <h2 class="h5"><span style="color:#CE2626">A</span> for Augmentation</h2>
                            <p class="mb-0">Increase your customer portfolio, gain new prospects and make your business
                                and your incomes grow!</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonial section-->
    <div class="py-5 testimonial" style="background-color: #A11F21; color: white;">
        <div class="container px-5 my-5">
            <div class="row gx-5 justify-content-center">
                <div class="col-lg-10 col-xl-7">
                    <div class="text-center">
                        <div class="fs-4 mb-4 fst-italic">"Working with this CRM allows me to have a more peaceful work
                            schedule. Bye bye to notebooks and pieces of paper scattered everywhere in my office. Now, I
                            just have to connect to my dashboard and I have everything under control without having to
                            stress about my business schedule."
                        </div>
                        <div class="d-flex align-items-center justify-content-center">
                            <img class="rounded-circle me-3" src="https://cdn-icons-png.flaticon.com/512/219/219969.png"
                                 style="width:1rem;" alt="img-ceo"/>
                            <div class="fw-bold">
                                Cecilia Rosa
                                <span class="fw-bold text-primary mx-1">/</span>
                                CEO, Rosa-CRM
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <sec:authorize access="!isAuthenticated()">
        <section class="py-5">
            <div class="container px-5 my-5">
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6">
                        <div class="text-center">
                            <button type="button" class="btn" style="background-color: #CE2626; width: 30vw;"><a
                                    class="text-white text-decoration-none"
                                    href="${pageContext.request.contextPath}/register" style="font-size: 2vw;">REGISTER
                                NOW
                            </a></button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </sec:authorize>
    <sec:authorize access="isAuthenticated()">
        <!-- Graph and stats section-->
        <section class="py-5">
            <div class="container px-5 my-5">
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6">
                        <div class="text-center">
                            <h2 class="fw-bolder">From your business</h2>
                            <p class="lead fw-normal text-muted mb-5">Follow here your business evolution: number of
                                clients, prospects, how many follow-ups you have to make... Come into your business
                                peacefully and instantly!</p>
                        </div>
                    </div>
                </div>
                <div class="row gx-5">
                    <div class="col-lg-4 mb-5">
                        <div id="donutchart1"
                             style="width:25vw; height:30vh"></div>
                    </div>
                    <div class="col-lg-4 mb-5">
                        <div id="donutchart2"
                             style="width:25vw; height:30vh"></div>
                    </div>
                    <div class="col-lg-4 mb-5">
                        <div id="donutchart3"
                             style="width:25vw; height:30vh"></div>
                    </div>
                </div>
                <!-- Call to action links to other pages-->
                <aside class="bg-gradient rounded-3 p-4 p-sm-5 mt-5 d-none d-sm-block"
                       style="background-color: #e0e0e0;">
                    <div class="d-flex flex-column flex-lg-row align-items-center">
                        <h2>Start working now...</h2>
                        <a
                                href="${pageContext.request.contextPath}/companies/all"
                                class="text-white btn-danger bg-danger rounded p-4 text-decoration-none text-center"
                                style=" margin: 1rem; min-width: 140px; min-height: 96px; box-sizing: border-box"
                        >My companies</a>
                        <a
                                class="text-white btn-danger bg-danger rounded p-4 text-decoration-none text-center"
                                href="${pageContext.request.contextPath}/clients/all"
                                style=" margin: 1rem; min-width: 140px ;min-height: 96px;box-sizing: border-box"
                        >My clients</a>
                        <a
                                class="text-white btn-danger bg-danger rounded p-4 text-decoration-none text-center"
                                href="${pageContext.request.contextPath}/prospects/all"
                                style=" margin: 1rem; min-width: 140px; min-height: 96px; box-sizing: border-box"
                        >My prospects</a>
                        <a
                                class="text-white btn-danger bg-danger rounded p-4 text-decoration-none text-center"
                                href="${pageContext.request.contextPath}/calendar"
                                style=" margin: 1rem; min-width: 140px;min-height: 96px;box-sizing: border-box"
                        >My Calendar</a>
                    </div>
                </aside>
            </div>
        </section>
    </sec:authorize>
</main>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

    // Load the Visualization API and the piechart package.
    google.charts.load('current', {'packages': ['corechart']});

    // Set a callback to run when the Google Visualization API is loaded.
    google.charts.setOnLoadCallback(drawChart);
    google.charts.setOnLoadCallback(drawChart2);
    google.charts.setOnLoadCallback(drawChart3);

    // Callback that creates and populates a data table,
    // instantiates the pie chart, passes in the data and
    // draws it.
    let prospects = ${prospectNumber};
    let clients = ${clientNumber};
    let companies = ${companyNumber};

    let prospectsToStart = ${prospectNotStarted};
    let prospectsInProgress = ${prospectInProgress};
    let prospectsToContact = ${prospectToContact};

    let clientsNotes = ${clientNotes};
    let prospectsNotes = ${prospectNotes};

    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ['Type of partners', '%'],
            ['Clients', clients],
            ['Prospects', prospects],
            ['Companies', companies]
        ]);

        var options = {
            title: 'My business portfolio',
            pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart1'));
        chart.draw(data, options);
    }

    function drawChart2() {
        var data = google.visualization.arrayToDataTable([
            ['Prospection Status', '%'],
            ['Not started', prospectsToStart],
            ['In progress', prospectsInProgress],
            ['To contact', prospectsToContact],
        ]);

        var options = {
            title: 'State of my prospection',
            pieHole: 0.4,
        };

        var chart2 = new google.visualization.PieChart(document.getElementById('donutchart2'));
        chart2.draw(data, options);
    }

    function drawChart3() {
        var data = google.visualization.arrayToDataTable([
            ['Number of notes shared with my portfolio', '%'],
            ['Notes to Prospects', prospectsNotes],
            ['Notes to Clients', clientsNotes],
        ]);

        var options = {
            title: 'Notes I have shared with my partners',
            pieHole: 0.4,
        };

        var chart3 = new google.visualization.PieChart(document.getElementById('donutchart3'));
        chart3.draw(data, options);
    }
</script>
</body>
</html>


<c:import url="footer.jsp"/>