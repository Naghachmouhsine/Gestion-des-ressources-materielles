document.addEventListener("DOMContentLoaded", function() {
    // add hovered class to selected list item
    let list = document.querySelectorAll(".navigationCSS li");

    function activeLink() {
        list.forEach((item) => {
            item.classList.remove("hovered");
        });
        this.classList.add("hovered");
    }

    list.forEach((item) => item.addEventListener("mouseover", activeLink));

    // Menu Toggle
    let navigation = document.querySelector(".navigationCSS"); // existe dans le fichier "SidebarEnseignant.jsp"
    let main = document.querySelector(".mainCSS"); // existe dans le fichier "InterfacePrincipaleEnseignant.jsp"
    let toggle = document.querySelector(".toggleCSS"); // existe dans le fichier "InterfacePrincipaleEnseignant.jsp"

    toggle.onclick = function () {
        navigation.classList.toggle("active");
        main.classList.toggle("active");
    };
//------------------------------------------------------------------------------------------
    let ressourcesButton = document.getElementById("ressourcesButton");
    let besoinsButton = document.getElementById("besoinsButton");
    let profilButton = document.getElementById("profilButton");
    
    let ressourcesContent = document.getElementById("ressourcesContent");
    let besoinsContent = document.getElementById("besoinsContent");
    let profilContent = document.getElementById("profilContent");
    
	ressourcesButton.addEventListener("click", function() {
		    // Afficher le contenu ressources
	        ressourcesContent.style.display = "block";
	        
	        // Masquer le contenu des besoins et du profil si nécessaire
	        besoinsContent.style.display = "none";
	        profilContent.style.display = "none";
	});
	
	besoinsButton.addEventListener("click", function() {
		   // Afficher le contenu des besoins
	        besoinsContent.style.display = "block";
	        
	        // Masquer le contenu des ressources et du profil si nécessaire
	        ressourcesContent.style.display = "none";
	        profilContent.style.display = "none";
	});
	
	profilButton.addEventListener("click", function() {
		// Afficher le contenu du profil
        profilContent.style.display = "block";

        // Masquer le contenu des ressources et des besoins si nécessaire
        ressourcesContent.style.display = "none";
        besoinsContent.style.display = "none";
});
});

/*
le problème réside dans le fait que le fichier JavaScript "main.js" ne peut pas accéder aux classes définies dans le fichier "SidebarEnseignant.jsp" lorsqu'il est inclus dans le fichier "InterfacePrincipaleEnseignant.jsp".
la solution ==> document.addEventListener("DOMContentLoaded", function() { ......... });
==> Avec ces changements, le fichier JavaScript devrait maintenant pouvoir accéder aux classes définies dans deux fichiers JSP differents...!
*/









