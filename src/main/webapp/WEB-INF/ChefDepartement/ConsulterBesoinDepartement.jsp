<%@ include file="AjouterBesoinDepartement.jsp" %>

<div class="container">
    <div class="mb-3">
        <button id="envoyerBesoinButton" type="button" class="btn btn-secondary mb-3" style="background:#008080; width: 200px; height: 45px; font-size: 18px;"><b>Ajouter un besoin</b></button>
    </div>
    
    <!-- Tableau pour afficher les besoins -->
    <table class="table table-striped table-bordered">
        <thead>
            <th>Type</th>
            <th>Caractéristiques</th>
        </thead>
        <tbody> 
            <!-- Boucle pour afficher les besoins -->
            <c:forEach items="${listBesoins}" var="besoin">
                <c:if test="${sessionScope.Enseignant != null && sessionScope.Enseignant.cin == besoin.personnelAdministration.cin && besoin.appelOffre == null}">
                    <tr>
                        <td>${besoin.type}</td> 
                        <td>
                            <c:choose>
                                <c:when test="${besoin.type eq 'ordinateur'}">
                                    CPU: ${besoin.cpu} GHz, Disque Dur: ${besoin.disque_dur} Go, Ecran: ${besoin.ecran} pouces, RAM: ${besoin.ram} Go
                                </c:when>
                                <c:when test="${besoin.type == 'imprimante'}">
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
