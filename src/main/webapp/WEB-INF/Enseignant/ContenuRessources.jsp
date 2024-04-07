
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
       
       


<!-- ----------------------------------------------------------------------------------------------
<%-- Vérifier si l'utilisateur connecté est un enseignant et si son CIN correspond au CIN du personnel associé à la ressource --%>
  <c:if test="${sessionScope.Enseignant != null && sessionScope.Enseignant.cin == ressource.besoin.personnelAdministration.cin}">
      <tr>
          <td></td>
      </tr>
  </c:if>
 -->

      
