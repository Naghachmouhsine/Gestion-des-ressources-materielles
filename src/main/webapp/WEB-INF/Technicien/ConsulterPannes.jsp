<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- --------------------- Liste des Pannes des Ressources ----------------- -->
<br/> 
<div class="container">
    <div class="row">
        <div class="col-md-12" >
            <h3 class="mb-4"><i class="fas fa-exclamation-triangle mr-2 text-danger"></i> <span class="text-danger">Liste des Pannes des Ressources :</span></h3>
            <table class="table table-striped table-bordered" >
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Num Inv</th>
                        <th scope="col">Type Ressource</th>
                        <th scope="col">Date Panne</th>
                        <th scope="col">Etat</th>
                        <th scope="col">Technicien</th>
                        <th scope="col">Fréquence</th>
                        <th scope="col">Ordre</th>
                        <th scope="col">Constat</th>
                        <th style="width:8%">Réparer</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Vérifier si la liste des pannes est vide -->
                    <c:if test="${empty myListPannes}">
                        <tr>
                            <td colspan="6" class="text-center"><b style="color:#008080;">Aucune Panne Disponible</b></td>
                        </tr>
                    </c:if>
                    <!-- Si la liste des pannes n'est pas vide, afficher les pannes -->
                    <c:forEach items="${myListPannes}" var="panne">
                        <tr>
                            <td>${panne.id_pan}</td>
                            <td>${panne.ressource.numero_inventaire}</td>
                            <td>${panne.ressource.besoin.type}</td>
                            <td>${panne.date_panne}</td>
                            <td>${panne.etat_panne}</td>
                            <td>${panne.technicien.nom} ${panne.technicien.prenom}</td>
                            <td>${panne.frequence}</td>
                            <td>${panne.ordre}</td>
                            <td>${panne.constat}</td>
							<td>
							    <!-- Bouton pour réparer une panne -->
							    <div class="reparerPanneBtn" style="color: #008080; cursor: pointer; margin-left: 20px; font-size: 22px;" title="Réparer Panne">
							       <b> <i class="fas fa-tools"></i> </b>
							    </div>
							</td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        // Lorsque vous cliquez sur le bouton "Réparer Panne"
        $('.reparerPanneBtn').click(function() {
            // Afficher un message de confirmation
            if (confirm('Voulez-vous vraiment réparer cette panne ?')) {
            	// Récupérer l'ID de la panne de la ligne sélectionnée
                var id_panne = $(this).closest('tr').find('td:first').text();
                // Pré-remplir le champ "ID Panne" dans la fenêtre modale avec la valeur récupérée
                $('#reparerPanneModal').find('input[name="id_pan"]').val(id_panne);
                // Afficher la fenêtre modale
                $('#reparerPanneModal').modal('show'); // existe dans le fichier : ReparerPanne.jsp
            }
        });
    });
</script>

<!----------------------------------------  -->  
 <%@ include file="ReparerPanne.jsp" %>  
<!----------------------------------------  -->
