<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>gestion des ressources livres</title>
    
    <!-- ======= Bootstrap ====== -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <link rel="stylesheet" href="/static/css/style.css">
  <link rel="stylesheet" href="/static/css/styleRespo.css">
    <!-- Inclure le fichier JavaScript -->
    <script src="/static/js/main.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="/static/js/gestionAppelOffre.js"></script>
     <script src="/static/js/gestionProsition.js"></script>
    
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
			<div class="card" style="background-color: #fff;">
      <div class="card-header">
        <div class="card-body">
          <table class="table mt-3">
            <thead>
              <tr>
                <th scope="col">type</th>
                <th scope="col">marque</th>
                <th scope="col">prix</th>
                <th scope="col">caracterstiques</th>
              </tr>
            </thead>
            <tbody>
             <c:forEach items="${listRessource}" var="a">
             
                  <tr>
                  		<td>${a.besoin.type}</td>
                  		<td>${a.marque}</td>
                  		<td>${a.prix}</td>    
			                    <td>	                   				                  	              
					                <c:choose>
			                            <c:when test="${a.besoin.type eq 'ordinateur'}">			                              
			                                CPU: ${a.besoin.cpu} GHz, Disque Dur: ${a.besoin.disque_dur} Go, Ecran: ${a.besoin.ecran} pouces, RAM: ${a.besoin.ram} Go
			                            </c:when>
			                            <c:when test="${a.besoin.type == 'imprimante'}">			                                <%-- b est une imprimante --%>
			                                Résolution: ${a.besoin.resolution} dpi, Vitesse: ${a.besoin.vitesse} ppm
			                            </c:when>
		                            </c:choose>
		                         </td>   	
                  </tr>
             </c:forEach>
             
             
              <!-- End of React loop -->
            </tbody>
          </table>
           
        </div>
      </div>
    </div>
		<!-- ========================= Fin Contenu ==================== -->          
        </div>
        
<!-- ========================= Fin Main ==================== -->
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <!-- ======= Bootstrap JS ====== -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>   
    
</body>
</html>