package myAppSpringBoot.ControllersJSP;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import myAppSpringBoot.Controllers.GestionRessourcesLivresController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class GestionRessourcesLivreControllerJSP {
	@Autowired
	GestionRessourcesLivresController controller;
	@GetMapping("/ressourcesLivre")
	public String toPageRessourceLivre(Model model) {
		model.addAttribute("listRessource",controller.getAllRessourcesLivre());		
		return "Responsable/gestionRessourcesLivres";
	}
	
}
