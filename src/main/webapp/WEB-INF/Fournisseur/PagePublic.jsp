<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page publique</title>
    
    <!-- ======= Bootstrap ====== -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/css/style.css">
    <link rel="stylesheet" href="/static/css/CardAppelOffre.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    
    <!-- Inclure le fichier JavaScript -->
    <script src="/static/js/main.js"></script>
</head>

<body>
   <!-- ========================= Navbar ==================== -->
  <nav class="navbar navbar-expand-lg navbar-dark mb-4" style="background-color: rgb(25, 75, 132) !important;">
    <div class="container-fluid">
        <a class="navbar-brand" href="">Fst Apples D'offres</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <c:if test="${not empty sessionScope['Fournisseur']}">
                    <li class="nav-item">
                        <a class="nav-link" href="">
                            <i class="fas fa-user mx-2"></i>   ${sessionScope['Fournisseur'].nomSociete}
                        </a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="#">
                            | <i class="fas fa-bell mx-2"> </i>  Notifications
                        </a>
                    </li>
                   
                </c:if>
            </ul>
        </div>
    </div>
</nav>
  
    <!-- ========================= Fin Navbar ==================== -->
    <!-- ========================= Main ==================== -->
    <div class="container">
        <div style="background-color: #fff;">
            <div class="row row_cards">
                <c:forEach items="${listAppelsOffres}" var="appelOffre" varStatus="loop">
                    <div class="col-md-4 mb-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <h5 class="card-title">${appelOffre.nom}</h5>
                                <p class="card-text">Date de d�but: ${appelOffre.date_debut}</p>
                                <p class="card-text">Date de fin: ${appelOffre.date_fin}</p>
                            </div>
                            <div class="card-footer ">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#${appelOffre.id_app_off}">
                                    Plus de d�tails
                                </button>
                                <a href="/proposition/${appelOffre.id_app_off}" class="btn btn-primary" >Ajouter</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <!-- ========================= Fin Main ==================== -->
    
    <!-- Modal -->
    <c:forEach items="${listAppelsOffres}" var="appelOffre">
        <div class="modal fade" id="${appelOffre.id_app_off}" tabindex="-1" aria-labelledby="consulerAppelOffreLabel" aria-hidden="false">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title text-center" id="consulerAppelOffreLabel">${appelOffre.nom} </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Type</th>
                                    <th scope="col">Caracteristiques</th>
                                </tr>
                            </thead>
                            <tbody>		    
                                <c:forEach items="${appelOffre.listBesoins}" var="b">         
                                    <tr>
                                        <td>${b.type}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${b.type eq 'ordinateur'}">
                                                    CPU: ${b.cpu} GHz, Disque Dur: ${b.disque_dur} Go, Ecran: ${b.ecran} pouces, RAM: ${b.ram} Go
                                                </c:when>
                                                <c:when test="${b.type == 'imprimante'}">
                                                    Resolution: ${b.resolution} dpi, Vitesse: ${b.vitesse} ppm
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>	
                                </c:forEach> 
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
    
    <!-- ======= Bootstrap JS ====== -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
