
<%@ include file="AjouterBesoinDepartement.jsp" %>

<div class='container'>
   
   <!-- Bouton pour envoyer un besoin -->
  <!-- <button id="envoyerBesoinButton" class="btn btn-primary mb-3" >Envoyer un besoin</button> -->
  <button id="envoyerBesoinButton" type="button" class="btn btn-secondary mb-3" style="background:#008080; width: 600px; height: 45px; font-size: 18px;"><b>Ajouter un besoin département</b></button>
  
<%--   <p>CIN: ${sessionScope.Enseignant.cin}</p>  --%>
   
<table class='table table-striped table-bordered'>
    <thead>
        <th>Type</th>
        <th>Caractéristiques</th>
    </thead>
    <tbody> 
        <c:forEach items="${listBesoins}" var="besoin">
            <%-- Vérifier si l'utilisateur connecté est un enseignant et si son CIN correspond au CIN du personnel associé au besoin --%>
            <c:if test="${sessionScope.Enseignant != null && sessionScope.Enseignant.cin == besoin.personnelAdministration.cin}">
                <tr>
                    <td>${besoin.type}</td> 
                    <td>
                        <%-- Vérifier le type du besoin et afficher les caractéristiques appropriées --%>
                        <c:choose>
                            <c:when test="${besoin.type eq 'ordinateur'}">
                                <%-- Besoin est un ordinateur --%>
                                CPU: ${besoin.cpu} GHz, Disque Dur: ${besoin.disque_dur} Go, Ecran: ${besoin.ecran} pouces, RAM: ${besoin.ram} Go
                            </c:when>
                            <c:when test="${besoin.type == 'imprimante'}">
                                <%-- Besoin est une imprimante --%>
                                Résolution: ${besoin.resolution} dpi, Vitesse: ${besoin.vitesse} ppm
                            </c:when>
                        </c:choose>
                    </td>
                    
                </tr>  
            </c:if>
        </c:forEach>
    </tbody>
</table>
                               
       </div>
       
<script>
    document.getElementById("envoyerBesoinButton").addEventListener("click", function() {
        $('#envoyerBesoinModal').modal('show');
    });
</script>

       