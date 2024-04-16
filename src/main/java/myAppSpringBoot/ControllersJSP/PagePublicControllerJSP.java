package myAppSpringBoot.ControllersJSP;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import myAppSpringBoot.Controllers.PagePublicController;
import myAppSpringBoot.Models.AppelOffreModelRespo;
import myAppSpringBoot.Models.BesoinModel;
import myAppSpringBoot.Models.FournisseurModel;

import javax.servlet.http.HttpSession;
@Controller
public class PagePublicControllerJSP {
 
	@Autowired
	private PagePublicController pagePublicController;
	
	@GetMapping("/PagePublique")
	public String toPagePublic(Model model) {
		ArrayList<AppelOffreModelRespo> listAppelsOffres=pagePublicController.getAllAppelOffres_PP();
		model.addAttribute("listAppelsOffres",listAppelsOffres);
		return "Fournisseur/PagePublic";
		
	}
	
	  @GetMapping("/proposition/{id}")
	  public String afficherAjouterProposition(@PathVariable("id") String idAppel,HttpSession session) {
		  System.out.println("HNAAAA");
		  
		  session.setAttribute("idAppel", idAppel);
	  //verfier si il est authentifier
		  FournisseurModel fournisseur =(FournisseurModel) session.getAttribute("Fournisseur"); 
	  if (fournisseur == null) {
		  System.out.println("n'est pas authentifier rediger");
		  return "redirect:/loginFournisseur"; 
	 } // L'utilisateur est authentifié, donc
	 // affiche la page protégée 
	  System.out.println("DEjaaaa authentifier ");
	  //ajouter proposition
	  return"Fournisseur/AjouterProposition";
	  
	  
	  
	  }
	 
}
