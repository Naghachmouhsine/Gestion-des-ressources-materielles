function consulterAppelOffreModal(besoins){	 
	console.log(be)   
			    var modalContent = `
			      <div class="modal fade" id="consulerAppelOffre" tabindex="-1" aria-labelledby="consulerAppelOffreLabel" aria-hidden="false">
			        <div class="modal-dialog modal-lg">
			          <div class="modal-content">
			            <div class="modal-header">
			              <h5 class="modal-title text-center" id="consulerAppelOffreLabel">Consulter Appel d'Offre</h5>
			              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			            </div>
			            <div class="modal-body">
			              <table class="table">
			                <thead>
			                  <tr>
			                    <th scope="col">Type</th>
			                    <th scope="col">Caract�ristique</th>
			                   
			                  </tr>
			                </thead>
			                <tbody>`;
			                besoins.forEach(function(objet) {
							carcters=""
							if(besoins.type=="imprimante")
								carcters="resolution : "+besoins.resolution+", vitesse : "+besoins.vitesse;
							else
								carcters="cpu : "+besoins.cpu+", disque_dur : "+besoins.disque_dur+", ecran : "+besoins.ecran+", ram : "+besoins.ram;
							
			                modalContent += `
			                  <tr>
			                    <td>${objet.type}</td>
			                    <td>${carcters}</td>		                   
			                  </tr>
			                `;
			              });
			                modalContent += `
			                    </tbody>
			                  </table>
			                </div>
			                <div class="modal-footer">
			                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
			                </div>
			              </div>
			            </div>
			          </div>
			        `;        
			        document.body.insertAdjacentHTML('beforeend', modalContent);
			        var monModal = new bootstrap.Modal(document.getElementById('consulerAppelOffre'));
			        monModal.show();
			        monModal._element.addEventListener('hidden.bs.modal', function () {
			                  document.getElementById('consulerAppelOffre').remove();
			                });
	}

 $(document).ready(function() {
        // Fonction pour vérifier si la date de fin est supérieure à la date de début
        function checkDates() {
            var dateDebut = new Date($("#dateDebut").val());
            var dateFin = new Date($("#dateFin").val());
            var errorMessage = "La date de laivraison doit être ultérieure à la date de début.";
            if (dateFin <= dateDebut) {
                $("#dateFinError").text(errorMessage).css("color", "red");
                 $("#submit").prop("disabled", true);
            } else {
                $("#dateFinError").empty(); // Effacer le texte d'erreur s'il n'y a pas d'erreur
                 $("#submit").prop("disabled", false);
            }
        }
        // Ajouter un gestionnaire d'événement onchange aux champs de date de début et de fin
        $("#dateDebut, #dateFin").on("change", checkDates);
    });

  