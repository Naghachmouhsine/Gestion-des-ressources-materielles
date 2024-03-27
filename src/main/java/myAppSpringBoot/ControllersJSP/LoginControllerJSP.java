package myAppSpringBoot.ControllersJSP;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import myAppSpringBoot.Controllers.UserController;
import myAppSpringBoot.Models.UserModel;

@Controller
public class LoginControllerJSP {
	
	@Autowired
	private UserController userController;

    @RequestMapping("/login")
    public String showLoginPage() {
        return "Login/LoginInterface";   // Le nom du fichier JSP (LoginInterface.jsp)
          // http://localhost:4040/login
    }
    
    @RequestMapping("/interface-ensiengant")
    public String showPagePrincipaleEnsiengant() {
        return "Ensiengant/InterfacePrincipaleEnsiengant";
      // Le nom du fichier JSP (InterfacePrincipaleEnsiengant.jsp) existe dans le dossier "Ensiengant"
          // http://localhost:4040/interface-ensiengant
    }
    
   // Endpoint pour vérifier les informations d'identification de l'utilisateur
    @PostMapping("/loginForm") // ce chemin existe dans la formulaire action = "/loginForm"
    public String VerifierLoginPassword(@RequestParam("emailForm") String email, 
                        @RequestParam("passwordForm") String password, 
                        Model model) {
    	// Récupérer l'utilisateur par e-mail
        UserModel existingUser = userController.getUserByEmail(email);
        if (existingUser != null && existingUser.getPassword().equals(password)) {
       	 return "redirect:/interface-ensiengant"; // http://localhost:4040/interface-ensiengant
       } else {
           model.addAttribute("errorMessage", "Erreur d'authentification...! Veuillez réessayer.");
            return "Login/LoginInterface";
       }
   }
        


    
    
    
    
    
}
