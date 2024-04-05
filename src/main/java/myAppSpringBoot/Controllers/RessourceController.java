package myAppSpringBoot.Controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import myAppSpringBoot.Models.RessourceModel;
import myAppSpringBoot.Services.RessourceServiceInterface;

@RestController
@RequestMapping("/backend/ressources")
public class RessourceController {

	@Autowired
    private RessourceServiceInterface ressourceService;
	
	// Endpoint pour récupérer tous les ressources
    @GetMapping
    public List<RessourceModel> getAllRessources() {
        return ressourceService.getAllRessources();
        // http://localhost:4040/backend/ressources
    }
}
