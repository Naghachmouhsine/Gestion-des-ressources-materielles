<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page principale responsable de resources</title>
    
    <!-- ======= Bootstrap ====== -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="/static/css/style.css">
    <!-- Inclure le fichier JavaScript -->
    <script src="/static/js/main.js"></script>
</head>

<body>

<!-- =============== Navigation ================ -->
<!-- Inclusion de la barre de navigation : Spring Boot Include JSP file inside another JSP File -->
<jsp:include page="sideBareResponsable.jsp" flush="true"></jsp:include>
<!-- =============== fin Navigation ================ -->

<!-- ========================= Main ==================== -->
        <div class="mainCSS">
            <div class="topbarCSS">
                <div class="toggleCSS">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>

                <div class="searchCSS">
                    <label>
                        <input type="text" placeholder="Search here">
                        <ion-icon name="search-outline"></ion-icon>
                    </label>
                </div>

                <div class="userCSS">
                    <ion-icon name="person-circle-outline" size="large"></ion-icon>
                </div>              
            </div>

<!-- ========================= le contenu ==================== -->
<br />		
     <div class="container">
        <div>
            <p>CIN: ${sessionScope.currentUser.cin}</p>
            <p>Nom: ${sessionScope.currentUser.nom}</p>
            <p>Pr�nom: ${sessionScope.currentUser.prenom}</p>
            <p>Date de naissance: ${sessionScope.currentUser.date_naissance}</p>
            <p>Email: ${sessionScope.currentUser.email}</p>
            <p>R�les: ${sessionScope.currentUser.roles}</p>
        </div>
     </div>
<!-- ========================= Fin Contenu ==================== -->          
        </div>
<!-- ========================= Fin Main ==================== -->
    
</body>
</html>