<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page principale d'eniengant</title>
    
    <!-- ======= Bootstrap ====== -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
   <!-- Add Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- Inclure le fichier JavaScript -->
    <script src="/static/js/main.js"></script>
</head>

<body>

<!-- =============== Navigation ================ -->
<!-- Inclusion de la barre de navigation : Spring Boot Include JSP file inside another JSP File -->
<jsp:include page="SidebarEnseignant.jsp" flush="true"></jsp:include>
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
<div class='container'>
    <table class='table table-striped table-bordered'>
          <thead >
            <th>Num Inventaire</th>
            <th>Etat Reception</th>
            <th>Etat Affectation</th>
            <th>Personnel</th>
            <th>Role</th>
            <th style="width:13%">Action</th>
          </thead>
         
         <tbody> 
            <c:forEach items="${myListRessources}" var="ressource">
	           <tr>
	       	     <td>${ressource.numero_inventaire}</td>
	             <td>${ressource.etat_recep}</td> 
	             <td>${ressource.etat_affect}</td>   
	             <td>${ressource.besoin.personnelAdministration.nom} ${ressource.besoin.personnelAdministration.prenom}</td>  
	             <td>${ressource.besoin.personnelAdministration.roles}</td> 
	             <td> 
                   <a style="color: red; cursor: pointer; margin-left: 40px; font-size: 22px;"
                      onclick="return confirm('Voulez-vous vraiment signaler une panne pour cette ressource ?')"
                      title="Signaler Panne"> <i class="fas fa-exclamation-triangle"></i>
                   </a>
                </td>
	            </tr>  
             </c:forEach>
          </tbody>
        </table> 
            
              <div class="form-group row">
                  <div class="col-sm-5 offset-sm-10" >
                    <div onClick="Retour();">
                      <button style="width:30%; font-size:110%; background-color:#B0C4DE;" class="btn btn-info">Retour</button>
                    </div>                          
                  </div>
              </div>
                        
      </div>

<!-- ========================= Fin Contenu ==================== -->          
        </div>
<!-- ========================= Fin Main ==================== -->
    
</body>
</html>


<%-- <p>CIN: ${sessionScope.currentUser.cin}</p> --%>

