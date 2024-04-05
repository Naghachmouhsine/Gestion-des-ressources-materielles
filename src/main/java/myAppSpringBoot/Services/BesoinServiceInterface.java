package myAppSpringBoot.Services;

import java.util.List;

import myAppSpringBoot.Models.BesoinModel;

public interface BesoinServiceInterface {
	
	// Méthode pour récupérer tous les besoins
    public List<BesoinModel> getAllBesoins();

}
