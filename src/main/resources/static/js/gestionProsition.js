$(document).ready(function() {
	var divVide=$("#vide")
	divVide.hide();
  // Écouteur d'événement pour la sélection de l'appel d'offre
  $('#selectAppelOffre').change(function() {
    var selectedAppelOffre = $(this).val();
    console.log(selectedAppelOffre)
    // Appel à une fonction pour récupérer les propositions en fonction de l'appel d'offre sélectionné
    getPropositions(selectedAppelOffre);
  });

  // Fonction pour récupérer les propositions en fonction de l'appel d'offre sélectionné
  function getPropositions(selectedAppelOffre) {
    // Faire une requête AJAX pour récupérer les données depuis le serveur
    var urlData
    if(selectedAppelOffre=="all")
		urlData="/getAllPropositionJSP"
	else
	  urlData="/getAllProposition"  
    $.ajax({
      url:urlData, // Remplacez 'votre-url-de-l-api' par l'URL de votre API pour récupérer les données des propositions
      type: 'GET',
      data: { appelOffreId: selectedAppelOffre },
      success: function(data) {
        // Mettre à jour le tableau des propositions avec les nouvelles données
        console.log(data);
       updateTable(data);
      },
      error: function(xhr, status, error) {
        console.error(error);
      }
    });
  }
  function updateTable(data) {
    var tableBody = $('#body');
	var divVide = $('#vide'); // Sélectionnez la div vide
	var btnValide=$('#btnValide');
	console.log(btnValide);
	var tab=$("#tab")
	if(data.length === 0) {
	    tab.hide(); // Cachez le tableau s'il n'y a pas de données
	    divVide.show(); // Affichez la div vide
	    btnValide.hide();
	    
	} else {
		tab.show()
		divVide.hide()
	    tableBody.empty(); // Videz le contenu du tableau
	    $.each(data, function(index, proposition) {
	        var row = $('<tr>');
	        row.append($("<td>").text(proposition.appelOffre.nom));
	        row.append($('<td>').text(proposition.fournisseur.nom_societe));
	        row.append($('<td>').text(proposition.date_livraison));
	        row.append($('<td>').text(proposition.total));
			row.append(
					$('<td>').append(
					    $('<a>').attr({
					        'href': '#',
					        'data-bs-toggle': 'modal',
					        'data-bs-target': '#' + proposition.id_prop,
					        'style': 'color: #000; cursor: pointer;'
					    }).text('Plus de détails')
								)
					)
			var radioAccepter
			var radioRefuser
		   if(proposition.etat=="accepter"){
			 radioAccepter = $('<input>').attr({
                'type': 'radio',
                'name': 'choix_' + proposition.id_prop,
                'id': 'accepter_' + proposition.id_prop,
                'value': 'accepter',
                'class' : 'form-check-input',
                'checked' : "checked"
                
            });
             radioRefuser = $('<input>').attr({
                'type': 'radio',
                'name': 'choix_' + proposition.id_prop,
                'id': 'refuser_' + proposition.id_prop,
                'value': 'refuser',
                'class' : 'form-check-input'    
            });
		   }else{
		   	radioAccepter = $('<input>').attr({
                'type': 'radio',
                'name': 'choix_' + proposition.id_prop,
                'id': 'accepter_' + proposition.id_prop,
                'value': 'accepter',
                'class' : 'form-check-input'
               
                
            });
             radioRefuser = $('<input>').attr({
                'type': 'radio',
                'name': 'choix_' + proposition.id_prop,
                'id': 'refuser_' + proposition.id_prop,
                'value': 'refuser',
                'class' : 'form-check-input',
                 'checked' : "checked"
            });
		   }
			  
		   

            var labelAccepter = $('<label>').attr({'for' : 'accepter_' + proposition.id_prop,
            									    'class' : "form-check-label"     									 
            									 	}).text('Accepter');


            var labelRefuser = $('<label>').attr({'for' : 'refuser_' + proposition.id_prop,
            									  'class' : "form-check-label"     									 
            									 }).text('Refuser');
            									 
       //<input id="${pr.id_prop}" value="${pr.id_prop}" hidden="hidden">
	   //<input id="${pr.id_prop}_four" value="${pr.fournisseur.id_four}" hidden="hidden">     									 
            var inputIdProposition=$("<input>").attr({
				'hidden' : "hidden",
				'value' : proposition.id_prop,
				'id' :  proposition.id_prop				
			});
		var inputIdFournisseur=$("<input>").attr({
				'hidden' : "hidden",
				'value' : proposition.fournisseur.id_four,
				'id' :  proposition.id_prop+"_four"			
			});
			var divRadiosAccepte=$("<div>").attr({'class' : "form-check form-check-inline"}).append(radioAccepter).append(labelAccepter)
			.append(inputIdProposition).append(inputIdFournisseur);
			var divRadiosRefuser=$("<div>").attr({'class' : "form-check form-check-inline"}).append(radioRefuser).append(labelRefuser)


            row.append($('<td>').append(divRadiosAccepte));
            row.append($('<td>').append(divRadiosRefuser));
		
	        tableBody.append(row);
	    });
	    btnValide.show();
	}
  }
});


function accepterRefuserProposition(){
	 $.ajax({
      url:"/getAllPropositionJSP", // Remplacez 'votre-url-de-l-api' par l'URL de votre API pour récupérer les données des propositions
      type: 'GET',
      success: function(data) {
		  envoiAuServeur(data);
      },
      error: function(xhr, status, error) {
        console.error(error);
      }
    });
   
}
function envoiAuServeur(data){
	 $.each(data,function(index,pr){
		      if($("#"+pr.id_prop+"_four").val()!=undefined){
				$.ajax({
				      url:"/reponseProposition", // Remplacez 'votre-url-de-l-api' par l'URL de votre API pour récupérer les données des propositions
				      type: 'POST',
				      //idPro,@RequestParam int idFour,@RequestParam boolean etat
				      data: {idPro : $("#"+pr.id_prop).val(),				      		 
				      		idFour : $("#"+pr.id_prop+"_four").val(),
				      		etat : $("#accepter_"+pr.id_prop).is(":checked"),
				      		num : "aucun"+pr.id_prop	      		
				      		 },
				      success: function(data) {
				        // Mettre à jour le tableau des propositions avec les nouvelles données
				        
				      },
				      error: function(xhr, status, error) {
				        console.error(error);
				      }
				    });   				  
			  }
			});
}





