package myAppSpringBoot.ControllersJSP;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import myAppSpringBoot.Controllers.BesoinController;
import myAppSpringBoot.Controllers.RessourceController;
import myAppSpringBoot.Controllers.UserController;
import myAppSpringBoot.Models.BesoinModel;
import myAppSpringBoot.Models.RessourceModel;
import myAppSpringBoot.Models.UserModel;

@Controller
public class LoginControllerJSP {
	
	@Autowired
	private UserController userController;
	@Autowired
	private RessourceController ressourceController;
	@Autowired
	private BesoinController besoinController;
	
	@Autowired
    private HttpSession httpSession; // Injection de l'objet HttpSession

    @RequestMapping("/login")
    public String showLoginPage() {
        return "Login/LoginInterface";   // Le nom du fichier JSP (LoginInterface.jsp)
          // http://localhost:4040/login
    }
    
    @RequestMapping("/interface-enseignant")
    public String showPagePrincipaleEnseignant(Model model) {
    	List<RessourceModel> ressources = ressourceController.getAllRessources();
        model.addAttribute("myListRessources", ressources);
        
        List<BesoinModel> besoins = besoinController.getAllBesoins();
        model.addAttribute("myListBesoins", besoins);
        
        return "Enseignant/InterfacePrincipaleEnseignant";
      // Le nom du fichier JSP (InterfacePrincipaleEnseignant.jsp) existe dans le dossier "Enseignant"
          // http://localhost:4040/interface-enseignant
    }
    
    @RequestMapping("/interface-chefDepartement")
    public String showPagePrincipaleChefDepartement(Model model, HttpSession httpSession) {
        // Récupérer l'utilisateur de la session
        UserModel currentUser = (UserModel) httpSession.getAttribute("currentUser");
        // Ajouter l'utilisateur au modèle
        model.addAttribute("currentUser", currentUser);
        return "ChefDepartement/InterfacePrincipaleChefDepartement";
    }

    @RequestMapping("/interface-responsable")
    public String showPagePrincipaleResponsable() {
        return "Responsable/InterfacePrincipaleResponsable";
    }

    @RequestMapping("/interface-fournisseur")
    public String showPagePrincipaleFournisseur() {
        return "Fournisseur/InterfacePrincipaleFournisseur";
    }

    @RequestMapping("/interface-technicien")
    public String showPagePrincipaleTechnicien() {
        return "Technicien/InterfacePrincipaleTechnicien";
    }
    
   // Endpoint pour vérifier les informations d'identification de l'utilisateur
    @PostMapping("/loginForm") // ce chemin existe dans la formulaire action = "/loginForm"
    public String VerifierLoginPassword(@RequestParam("emailForm") String email, 
                        @RequestParam("passwordForm") String password, 
                        Model model) {
    	// Récupérer l'utilisateur par e-mail
        UserModel existingUser = userController.getUserByEmail(email);
        if (existingUser != null && existingUser.getPassword().equals(password)) {
        	// Stocker l'utilisateur dans la session
            httpSession.setAttribute("currentUser", existingUser);
        	
            // Vérifier le rôle de l'utilisateur
            String role = existingUser.getRoles();
            switch (role) {
                case "ChefDepartement":
                    return "redirect:/interface-chefDepartement";
                case "Responsable":
                    return "redirect:/interface-responsable";
                case "Enseignant":
                    return "redirect:/interface-enseignant";
                case "FournisseurModel":
                    return "redirect:/interface-fournisseur";
                case "Technicien":
                    return "redirect:/interface-technicien";
                default:
                    return "Login/LoginInterface";
              }
	       } else {
	           model.addAttribute("errorMessage", "Erreur d'authentification...! Veuillez réessayer.");
	            return "Login/LoginInterface";
	       }
   }
        


    
    
    
    
    
}
