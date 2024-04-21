function getRessources() {
    return new Promise(function(resolve, reject) {
        $.ajax({
            url: "/getAllNumInventaire",
            type: 'GET',
            success: function(data) {
				
                resolve(data); // Renvoyer les données lorsque la requête réussit
            },
            error: function(xhr, status, error) {
                console.error(error);
                reject(error); // Rejeter avec l'erreur lorsque la requête échoue
            }
        });
    });
}
function verfie(input,idRes){ //verfication  si numInventaire unique
	var divVide=$("#vide"+idRes)
		const values = $('.numInv').map(function() {
    return $(this).val();
}).get();
	const index = values.indexOf(input.value);
    values.splice(index, 1);//supprimer la valeur en cours de saisir
    console.log(values)
	getRessources().then(function(data) {
		if(data.includes(input.value) | values.includes(input.value)){
			divVide.text(input.value+" deja exite")
			divVide.show()
			$("#submit").prop("disabled",true)
		}
		else{
			divVide.hide();
			$("#submit").prop("disabled",false)			
		}

	   	console.log(data)
	}).catch(function(error) {
	    console.error(error); // Gérer les erreurs ici
	});	
}
function submitModif(){
	const numInv = $('.numInv');
	const idRes = $('.idRes');
	const data = [];
	if (numInv.length === idRes.length) {
	    numInv.each(function(index) {
	        const num = $(this).val();
	        const id = idRes.eq(index).val();        
	        envoiAuserveur(id,num);
	    });
	} else {
	    console.error("Le nombre d'éléments dans les deux classes est différent.");
	}	
}
function envoiAuserveur(idRes,numero_inventaire){
	$.ajax({
	            url: "/saveNumAventaire",
	            type: 'POST',
	            data : {numero_inventaire : numero_inventaire,idRes:idRes},
	            success: function(data) {				
			    Swal.fire({
			      icon: 'success',
			      title: 'Succès !',
			      text: 'Votre modification a été effectuée avec succès.',
			      confirmButtonText: 'Fermer'
			    });
			    },
	            error: function(xhr, status, error) {
	                console.error(error);
	                 
			    Swal.fire({
			      icon: 'error',
			      title: 'Erreur !',
			      text: 'Une erreur est survenue lors de la modification.',
			      confirmButtonText: 'Fermer'

	            })
	            }
	        });
}