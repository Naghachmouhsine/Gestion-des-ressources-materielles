<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="myAppSpringBoot.Models.BesoinModel" %>
<%@ page import="java.util.List" %>
<%@ page import="myAppSpringBoot.Models.PersonnelAdministrationModel" %>
<%@ page import="myAppSpringBoot.Models.DepartementModel" %>
<%@ page import="myAppSpringBoot.Models.ImprimanteModel" %>
<%@ page import="myAppSpringBoot.Models.OrdinateurModel" %>
<%@ page import="myAppSpringBoot.Models.RessourceModel" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Liste des ressources</title>
<style>

    #besoinsTable {
         width: 90%;
         border-collapse: collapse;
         margin-left: 23px;
    }

    #besoinsTable th,
    #besoinsTable td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    #besoinsTable th {
        background-color: #f2f2f2;
        color: #333;
    }

    #besoinsTable tr:nth-child(even) {
         background-color: #f9f9f9;
    }

    #besoinsTable tr:hover {
         background-color: #f2f2f2;
    }
    
    .action-icons i {
        margin-right: 15px;
        cursor: pointer;
    }
    .report-icon {
    font-size: 24px; /* Taille de l'icône */
    color: #FF5733; /* Couleur de l'icône */
    margin-right: 10px; /* Marge à droite pour l'espacement */
    padding-left:13px;
}

.modal {
  display: none; /* Par défaut, la modal est cachée */
  position: fixed; /* Positionnement fixe */
  z-index: 9999; /* Empilement au-dessus des autres éléments */
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto; /* Ajouter un défilement si nécessaire */
  background-color: rgba(0,0,0,0.5); /* Fond semi-transparent */
}

/* Contenu de la modal */
.modal-content {
  background-color: #fefefe; /* Fond blanc */
  margin: 15% auto; /* Centrer verticalement */
  padding: 20px;
  border: 1px solid #888;
  width: 80%; /* Largeur de la modal */
  max-width: 600px; /* Largeur maximale de la modal */
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Ombre */
}

/* Style du bouton de fermeture */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

/* Style du bouton de confirmation */
#confirmButton {
  background-color: #007bff;
  color: white;
  border: none;
  border-radius: 3px;
  padding: 10px 20px;
  cursor: pointer;
}

#confirmButton:hover {
  background-color: #0056b3;
}

/* Style de l'élément de sélection de date */
#datePicker {
  width: 100%;
  padding: 10px;
  margin-top: 10px;
  box-sizing: border-box;
}
</style>
</head>
<body>

<% 
List<RessourceModel> listRessources = (List<RessourceModel>) session.getAttribute("ressources");
PersonnelAdministrationModel chef = (PersonnelAdministrationModel) session.getAttribute("ChefDepartement");
%>

<table id="besoinsTable" class="display">
<thead>
    <tr>
        <th>Numéro inventaire</th>
        <th>Type</th>
        <th>Caractéristiques</th>
        <th>Etat réception</th>
        <th>Etat affectation</th>
    </tr>
</thead>
<tbody>
    <% 
    if (listRessources != null && chef != null) {
        for (RessourceModel ressource : listRessources) {
        	if(ressource.getBesoin().getPersonnelAdministration().getCin().equals(chef.getCin())){    
    %>
    <tr>
        <td><%= ressource.getNumero_inventaire() %></td>
        <td><%= ressource.getBesoin().getType() %></td>
        <td>
            <% 
            if (ressource.getBesoin().getType().equals("ordinateur")) {
                OrdinateurModel ordinateur = (OrdinateurModel) ressource.getBesoin();
            %>
            CPU: <%= ordinateur.getCpu() %>, Disque dur: <%= ordinateur.getDisque_dur() %>, Écran: <%= ordinateur.getEcran() %>, RAM: <%= ordinateur.getRam() %>
            <% 
            } else if (ressource.getBesoin().getType().equals("imprimante")) {
                ImprimanteModel imprimante = (ImprimanteModel) ressource.getBesoin();
            %>
            Résolution: <%= imprimante.getResolution() %>, Vitesse: <%= imprimante.getVitesse() %>
            <% 
            }
            %>
        </td>
        <td><%= ressource.getEtat_recep() %></td>
        <td><%= ressource.getEtat_affect() %></td>
        
        <td class="action-icons"> 
            <input type="hidden" name="ressourceId" id="ressourceId" value="<%= ressource.getIdRes() %>">
            <i class="fas fa-wrench report-icon" title="Signaler Panne" ></i> 
        </td>
    </tr>
    <% 
            }
        }
        }
    %>
</tbody>
</table>
         
<div id="modal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2>Sélectionner la date de panne</h2>
    <input type="date" id="datePicker">
    <br>
    <button id="confirmButton">Confirmer</button>
  </div>
</div>

<script>
$(document).ready(function(){
	  var modal = $("#modal");
	  var closeBtn = $(".close");

	  $(".report-icon").click(function() {
	    var ressourceId = $(this).siblings('#ressourceId').val();
	    modal.css("display", "block");
	    $("#confirmButton").attr("data-ressource-id", ressourceId);
	  });

	  closeBtn.click(function() {
	    modal.css("display", "none");
	  });

	  $("#confirmButton").click(function() {
	    var selectedDate = $("#datePicker").val();
	    var ressourceId = $(this).attr("data-ressource-id");

	    $.ajax({
	      type: "POST",
	      url: "/signalerPanneChef",
	      data: { ressourceId: ressourceId, selectedDate: selectedDate },
	      success: function(response) {
	    	    modal.css("display", "none");
	    	    Swal.fire({
	    	        icon: 'success',
	    	        title: 'Succès !',
	    	        text: 'Panne déclarée avec succès !',
	    	        timer: 1000, 
	    	        timerProgressBar: true
	    	    });
	      },
	      error: function(xhr, status, error) {
	          Swal.fire({
	              icon: 'error',
	              title: 'Erreur !',
	              text: 'Erreur lors de l\'envoi des données : ' + error
	          });
	      }
	    });
	  });
	});

</script>  
</body>
</html>