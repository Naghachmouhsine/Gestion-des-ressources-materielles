
   <div class='container'>
   
   <!-- Bouton pour envoyer un besoin -->
    <button id="envoyerBesoinButton" class="btn btn-primary mb-3">Envoyer un besoin</button>
   
   
      <table class='table table-striped table-bordered'>
          <thead >
            <th>Appel d'offre</th>
            <th>Type</th>
            <th>Personnel</th>
            <th>Role</th>
            <th>Caractéristiques</th>
            <th style="width:8%">Actions</th>
          </thead>
         
         <tbody> 
            <c:forEach items="${myListBesoins}" var="besoin">
	           <tr>
	       	     <td>${besoin.appelOffre.nom}</td>
	             <td>${besoin.type}</td> 
	             <td>${besoin.personnelAdministration.nom} ${besoin.personnelAdministration.prenom}</td>  
	             <td>${besoin.personnelAdministration.roles}</td> 
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
	             <td> </td>
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