<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="myAppSpringBoot.Models.BesoinModel" %>
<%@ page import="java.util.List" %>
<%@ page import="myAppSpringBoot.Models.PersonnelAdministrationModel" %>
<%@ page import="myAppSpringBoot.Models.DepartementModel" %>
<%@ page import="myAppSpringBoot.Models.ImprimanteModel" %>
<%@ page import="myAppSpringBoot.Models.OrdinateurModel" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des besoins</title>

<link rel="stylesheet" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
<style>
    .action-icons i {
        margin-right: 15px;
        cursor: pointer;
    }

    .edit-icon {
        font-size: 30px; /* Taille de l'icône agrandie */
        color: green; /* Couleur verte */
        margin-left: 30px; /* Marge à gauche */
    }
    
    .delete-icon {
        font-size: 30px; /* Taille de l'icône agrandie */
        color: red; /* Couleur verte */
        margin-left: 30px; /* Marge à gauche */
    }
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
        
        #validateForm {
        float: right; /* Alignement à droite */
        margin-top: 20px; /* Marge en haut pour l'espacement */
    }
    
        #validateForm button {
        background-color: #4CAF50; /* Couleur de fond */
        color: white; /* Couleur du texte */
        padding: 10px 20px; /* Espacement intérieur */
        border: none; /* Suppression de la bordure */
        border-radius: 5px; /* Coins arrondis */
        cursor: pointer; /* Curseur pointer */
        transition: background-color 0.3s; /* Transition en douceur */
    }

    #validateForm button:hover {
        background-color: #45a049; /* Couleur de fond au survol */
    }

    #validateForm button i {
        margin-right: 5px; /* Espacement à droite de l'icône */
    }
</style>
</head>
<body>
    <div class="modal" id="myModal">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title">Modifier le besoin</h5>
            <span class="close">&times;</span>
        </div>
        <div class="modal-body">
         <form action="/modifierBesoin" method="post">
               <label for="typeInput">Type :</label>
               <input type="text" id="typeInput" name="typeInput" value="">
               <input type="hidden" id="besoinId" name="besoinId" value="">
            <br><br><br>
            <div id="computerFields">
                <label for="disquedurInput">Disque Dur :</label>
                <input type="text" id="disquedurInput" name="disquedurInput" value="">
                <br><br><br>
                <label for="cpuInput">CPU :</label>
                <input type="text" id="cpuInput" name="cpuInput" value="">
                <br><br><br>
                <label for="ecranInput">Écran :</label>
                <input type="text" id="ecranInput" name="ecranInput" value="">
                <br><br><br>
                <label for="ramInput">RAM :</label>
                <input type="text" id="ramInput" name="ramInput" value="">
            </div>
            <div id="printerFields" style="display:none;">
                <label for="resolutionInput">Résolution :</label>
                <input type="text" id="resolutionInput" name="resolutionInput" value="">
                <br><br><br>
                <label for="vitesseInput">Vitesse :</label>
                <input type="text" id="vitesseInput"  name="vitesseInput" value="">
            </div>
        </div>
        <div class="modal-footer">
        <button type="submit">Enregistrer</button>
         </div>
        </form>
    </div>
</div>
    

    <% 
    List<BesoinModel> listBesoins = (List<BesoinModel>) session.getAttribute("listBesoins");
    PersonnelAdministrationModel chefDepartement = (PersonnelAdministrationModel) session.getAttribute("ChefDepartement");
    %>
    
    <div style="display:none">
    </div>
    <table id="besoinsTable" class="display">
        <thead>
            <tr>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Type</th>
                <th>Caractéristiques</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% if (listBesoins != null && chefDepartement != null) {
                for (BesoinModel besoin : listBesoins) {
                    PersonnelAdministrationModel personnel = besoin.getPersonnelAdministration();
                    DepartementModel departement = personnel.getDepartement();%>             

                 <%  if (besoin.getAppelOffre() == null && (departement != null && departement.getId_depart() == chefDepartement.getDepartement().getId_depart())) {
            %>
                        <tr>
                            <td><%= personnel.getNom() %></td>
                            <td><%= personnel.getPrenom() %></td>
                            <td><%= besoin.getType() %></td>
                            <td>
                            <% 
                                if (besoin.getType().equals("ordinateur")) {
                                    OrdinateurModel ordinateur = (OrdinateurModel) besoin;
                            %>
                                    <!-- Afficher les attributs spécifiques à un ordinateur -->
                                    CPU: <%= ordinateur.getCpu() %>, Disque dur: <%= ordinateur.getDisque_dur() %>, Écran: <%= ordinateur.getEcran() %>, RAM: <%= ordinateur.getRam() %>
                            <% 
                                } else if (besoin.getType().equals("imprimante")) {
                                    ImprimanteModel imprimante = (ImprimanteModel) besoin;
                            %>
                                    <!-- Afficher les attributs spécifiques à une imprimante -->
                                    Résolution: <%= imprimante.getResolution() %>, Vitesse: <%= imprimante.getVitesse() %>
                            <% 
                                }
                             %>
                            </td>
                            <td class="action-icons"> 
                              <form id="actionForm" action="/gererBesoin" method="POST">
                                <input type="hidden" name="besoinId" id="besoinId" value="<%= besoin.getId_bes() %>">
                                <i class="fas fa-edit edit-icon" title="Modifier" onclick="confirmEdit(<%= besoin.getId_bes() %>)"></i> 
                                <i class="fas fa-trash-alt delete-icon" title="Supprimer" onclick="confirmDelete(<%= besoin.getId_bes() %>)"></i> 
                              </form>
                            </td>
                        </tr>
            <%      }
                }
            } %>
        </tbody>
    </table>
           
    <form id="validateForm" action="/validerBesoins" method="POST">
    <button type="submit">
        <i class="fas fa-check-circle"></i> Valider Besoins
    </button>
    </form>

    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    
    <script>
        $(document).ready(function() {
            $('#besoinsTable').DataTable({
                "stripeClasses": ['odd', 'even']
            });
        });
        
        function confirmDelete(id) {
            if (confirm("Êtes-vous sûr de vouloir supprimer le besoin avec l'identifiant ?")) {
                document.getElementById("actionForm").action = "/supprimerBesoin?id=" + id;
                document.getElementById("actionForm").submit();
                
            }
        }
       
        function showModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "block";
        }

        function hideModal() {
            var modal = document.getElementById("myModal");
            modal.style.display = "none";
        }
        
        function confirmEdit(id) {
            showModal();
            $.ajax({
                url: "/backend/besoins/getBesoinDetails?id=" + id,
                type: "GET",
                success: function(response) {
                    if (response) {
                        try {
                            var details = JSON.parse(JSON.stringify(response)); // Convertir la réponse JSON en objet JavaScript
                            var typeInput = document.getElementById("typeInput");
                            typeInput.value = details.type; // Mettre à jour la valeur de l'input avec le type du besoin
                            document.getElementById("besoinId").value=id;
                            
                            if (details.type === "ordinateur") {
                                $("#computerFields").show();
                                $("#printerFields").hide();
                                
                                ddInput=document.getElementById("disquedurInput")
                                ramInput=document.getElementById("ramInput")
                                ecranInput=document.getElementById("ecranInput")
                                cpuInput=document.getElementById("cpuInput")
                                
                                ddInput.value=details.disque_dur
                                ramInput.value=details.ram
                                cpuInput.value=details.cpu
                                ecranInput.value=details.ecran
                            } 
                            
                            else if (details.type === "imprimante") {
                                $("#computerFields").hide();
                                $("#printerFields").show();
                                
                                vitesseInput=document.getElementById("vitesseInput")
                                resolutionInput=document.getElementById("resolutionInput")
                                
                                vitesseInput.value=details.vitesse
                                resolutionInput.value=details.resolution
                            }
                        } catch (error) {
                            alert("Une erreur s'est produite lors de l'analyse de la réponse JSON :" + error);
                        }
                    } else {
                        console.error("La réponse ne contient pas les détails du besoin.");
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Une erreur s'est produite lors de la récupération des détails du besoin :", error);
                }
            });
        }

        document.getElementsByClassName("close")[0].onclick = function() {
            hideModal();
        }

        window.onclick = function(event) {
            var modal = document.getElementById("myModal");
            if (event.target == modal) {
                hideModal();
            }
        }
        
        document.addEventListener("DOMContentLoaded", function () {
            var successMessage = "<c:out value='${successMessage}'/>";
            if (successMessage) {
                Swal.fire({
                    icon: 'success',
                    title: successMessage,
                    showConfirmButton: false,
                    timer: 2000
                    
                });
            }
        });  
        
       


        </script>
</body>
</html>