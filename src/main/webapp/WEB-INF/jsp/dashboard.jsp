<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#features">Get Started</a>
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
                    Graph 1
                </div>
                <div class="col-lg-4 mb-5">
                    Graph 2
                </div>
                <div class="col-lg-4 mb-5">
                    Graph 3
                </div>
            </div>
            <!-- Call to action links to other pages-->
            <aside class="d-flex justify-content-around bg-gradient rounded-3 p-4 p-sm-5 mt-5"
                   style="background-color: #e0e0e0;">
                <h2>Start working now...</h2>
                <button type="button" class="bg-danger rounded p-3" style="border: none; height: 10vh;"><a
                        class="text-white text-decoration-none"
                        href="${pageContext.request.contextPath}/companies/all">My
                    companies</a></button>
                <button type="button" class="bg-danger rounded p-3" style="border: none"><a
                        class="text-white text-decoration-none"
                        href="${pageContext.request.contextPath}/clients/all">My
                    clients</a></button>
                <button type="button" class="bg-danger rounded p-3" style="border: none"><a
                        class="text-white text-decoration-none"
                        href="${pageContext.request.contextPath}/prospects/all">My
                    prospects</a></button>
                <button type="button" class="bg-danger rounded p-3" style="border: none"><a
                        class="text-white text-decoration-none"
                        href="${pageContext.request.contextPath}/calendar">My
                    schedule</a></button>
            </aside>
        </div>
    </section>
</main>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>


<c:import url="footer.jsp"/>