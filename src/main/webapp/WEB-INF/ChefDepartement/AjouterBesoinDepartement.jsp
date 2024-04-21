<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->

<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- SweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
    .modal {
            display: none;
            position: fixed;
            z-index: 9999;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(0, 0, 0, 0.5);
            width: 80%;
            max-width: 600px;
            padding: 20px;
            border-radius: 5px;
        }

        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .modal-header h5 {
            margin: 0;
            font-size: 18px;
        }

        .modal-header .close {
            cursor: pointer;
            font-size: 24px;
            color: #888;
        }

        .modal-body {
            margin-bottom: 20px;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
        }

        .modal-footer button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .modal-footer button:hover {
            background-color: #0056b3;
}
</style>

 <div class="modal" id="envoyerBesoinModal">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="envoyerBesoinModalLabel">Enregistrer le besoin</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="background: none; border: none; font-size: 30px;">
		 </button>
            <span class="close">&times;</span>
        </div>
        <div class="modal-body">
         <form id="BesoinForm" action="/ajouterBesoinDepar" method="post">
                 <div class="form-group row">
		            <label class="col-sm-3 col-form-label">Type Besoin :</label>
		            <div class="col-sm-9">
		              <select name="typeForm" id="typeForm" class="form-control" required>
		                <option value="" disabled selected>Choisir le type de besoin</option>
		                <option value="ordinateur">Ordinateur</option>
		                <option value="imprimante">Imprimante</option>
		              </select>
		            </div>
		          </div><br>
	            
		            <!-- Champs spécifiques à l'ordinateur -->
					<div class="form-group row" id="ordinateurFields">
					    <label class="col-sm-3 col-form-label">CPU :</label>
					    <div class="col-sm-3">
					        <input type="number" class="form-control" name="cpu" placeholder="CPU" required>
					    </div>
					    <label class="col-sm-3 col-form-label">Disque Dur :</label>
					    <div class="col-sm-3">
					        <input type="number" class="form-control" name="disqueDur" placeholder="Disque Dur" required>
					    </div> <br/> <br/>
					    <label class="col-sm-3 col-form-label">Écran :</label>
					    <div class="col-sm-3">
					        <input type="number" class="form-control" name="ecran" placeholder="Écran" required>
					    </div>
					    <label class="col-sm-3 col-form-label">RAM :</label>
					    <div class="col-sm-3">
					        <input type="number" class="form-control" name="ram" placeholder="RAM" required>
					    </div> <br/> <br>
					</div>
			        
			        <!-- Champs spécifiques à l'imprimante -->
			        <div class="form-group row" id="imprimanteFields" style="display: none;">
					    <label class="col-sm-3 col-form-label">Resolution :</label>
					    <div class="col-sm-3">
					        <input type="number" class="form-control" name="resolution" placeholder="Resolution" required>
					    </div>
					    <label class="col-sm-3 col-form-label">Vitesse :</label>
					    <div class="col-sm-3">
					        <input type="number" class="form-control" name="vitesse" placeholder="Vitesse" required>
					    </div> <br/> <br>
					</div>					
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
				        <!-- <button type="submit" class="btn btn-primary" >Enregistrer</button> -->
				        <button type="button" class="btn btn-primary" id="submitFormBtn">Enregistrer</button>
				      </div>
              </form>
      </div>
    </div>
</div>


<script>
$(document).ready(function() {
    $('#typeForm').change(function() {
        var selectedType = $(this).val();
        if (selectedType === 'ordinateur') {
            $('#ordinateurFields').show();
           // $('#imprimanteFields').hide();
            $('#imprimanteFields').hide().find('input').val('0'); // Masquer les champs d'imprimante et assigner une valeur par défaut
        } else if (selectedType === 'imprimante') {
            $('#imprimanteFields').show();
           // $('#ordinateurFields').hide();
            $('#ordinateurFields').hide().find('input').val('0'); // Masquer les champs d'ordinateur et assigner une valeur par défaut       
        }
    });

    $('#submitFormBtn').click(function() {
        // Vérifier le type de besoin sélectionné
        var selectedType = $('#typeForm').val();
        var formValid = true;

        if (selectedType === 'ordinateur') {
            // Vérifier si tous les champs requis pour l'ordinateur sont remplis
            $('#ordinateurFields :input[required]').each(function() {
                if ($(this).val() === '') {
                    formValid = false;
                    return false; // Sortir de la boucle each si un champ est vide
                }
            });
        } else if (selectedType === 'imprimante') {
            // Vérifier si tous les champs requis pour l'imprimante sont remplis
            $('#imprimanteFields :input[required]').each(function() {
                if ($(this).val() === '') {
                    formValid = false;
                    return false; // Sortir de la boucle each si un champ est vide
                }
            });
        }

        // Vérifier si tous les champs requis du formulaire principal sont remplis
        if (!$('#BesoinForm')[0].checkValidity()) {
            formValid = false;
        }

        // Si le formulaire est valide, procéder à l'envoi des données
        if (formValid) {
            ajaxPost();
        } else {
            // Afficher un message d'erreur avec SweetAlert si des champs sont vides
            Swal.fire({
                icon: 'error',
                title: 'Erreur!',
                text: 'Veuillez remplir tous les champs requis.',
            });
        }
    });

    function ajaxPost() {
        var formData = $("#BesoinForm").serialize();
        $.ajax({
            type: "POST",
            contentType: "application/x-www-form-urlencoded",
            url: "saveBesoinDepar",
            data: formData,
            success: function(response) {
                console.log(response);
               // alert(JSON.stringify(response));
                Swal.fire({
                    icon: 'success',
                    title: 'Succès!',
                    text: 'Besoin enregistré avec succès!',
                }).then((result) => {
                	// Rediriger l'utilisateur vers la page interface-enseignant après la fermeture de l'alerte
                       // window.location.href = 'http://localhost:4040/interface-enseignant';
                    // Recharger la page après la fermeture de l'alerte
                       window.location.reload();
                });
                $('#envoyerBesoinModal').modal('hide');
            },
            error: function(e) {
                console.log("Erreur: ", e);
               // alert("Erreur lors de l'envoi des données au serveur.");
            }
        });
    }

});
</script>

