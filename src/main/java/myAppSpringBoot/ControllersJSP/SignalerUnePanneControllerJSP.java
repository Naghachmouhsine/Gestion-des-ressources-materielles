package myAppSpringBoot.ControllersJSP;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import myAppSpringBoot.Models.PanneModel;
import myAppSpringBoot.Repositories.PanneRepository;

@RestController
public class SignalerUnePanneControllerJSP {
	
	@Autowired
	private PanneRepository panneRepository;

	@PostMapping(value = "/signalerUnePanne", consumes = "application/x-www-form-urlencoded")
    public void signalerUnePanne(@ModelAttribute PanneModel panne) {
		panne.setEtat_panne("Non réparée"); // l'etat de la panne par defaut
		panneRepository.save(panne);
    }
	
	@PostMapping(value = "/reparerUnePanne", consumes = "application/x-www-form-urlencoded")
    public void reparerUnePanne(@ModelAttribute PanneModel panne) {
		// Récupérer l'ID de la panne à partir du modèle
	    int panneId = panne.getId_pan();
	    Optional<PanneModel> panneExistante = panneRepository.findById(panneId);
	    
	   // Si la panne existe déjà, mettez à jour ses attributs
	    if (panneExistante.isPresent()) {
		   panneRepository.save(panne);
	    }
    }
	
	/*
    @PostMapping("/signalerUnePanne")
    @ResponseBody
    public String signalerUnePanne(@RequestBody String formData) {
        // Traitez les données du formulaire ici
        // Assurez-vous d'ajuster le traitement en fonction de votre logique métier
        
        // Exemple : affichage des données reçues dans la console
        System.out.println(formData);

        // Retournez une réponse au client pour indiquer que le traitement a été effectué avec succès
        return "Panne signalée avec succès !";
    } */
}

