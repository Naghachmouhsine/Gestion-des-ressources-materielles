package myAppSpringBoot.Controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import myAppSpringBoot.Models.AppelOffreModel;
import myAppSpringBoot.Models.AppelOffreModelRespo;
import myAppSpringBoot.Models.BesoinModel;
import myAppSpringBoot.Repositories.BesoinRepository;
import myAppSpringBoot.Services.BesoinService;
import myAppSpringBoot.Services.GestionAppelOffreService;

@RestController
public class PagePublicController {
	 @Autowired
	   private GestionAppelOffreService appelOffreService;
	   @Autowired
	   private BesoinService besoinService;
	   @Autowired
	   private BesoinRepository besoinRepository;
	   @GetMapping("/Pag")
	   public ArrayList<AppelOffreModelRespo> getAllAppelOffres_PP(){
		   
		   //System.out.println();
		   //Récuperer tout les appels offres
	       ArrayList<AppelOffreModelRespo> listAppelsOffres=new ArrayList<>();
	       //récuperer tout les besoins 
	       List<BesoinModel> listBesoins=appelOffreService.getAllBesoisn();
	       
	       for (AppelOffreModel appelOffre : appelOffreService.getAllAppelOffre()) {
	    	   AppelOffreModelRespo appelOffreModelRespo= new AppelOffreModelRespo(appelOffre.getId_app_off(),appelOffre.getNom(),appelOffre.getDate_debut(),appelOffre.getDate_fin());	
	    	   for (BesoinModel besoinModel : listBesoins) //remplire la list de besoins de chaque appelOffre 
	    		   if(besoinModel.getAppelOffre()!=null &&  besoinModel.getAppelOffre().getId_app_off()==appelOffre.getId_app_off())
	    			   appelOffreModelRespo.getListBesoins().add(besoinModel);
	    	   listAppelsOffres.add(appelOffreModelRespo);
		    }
		   return listAppelsOffres;

 }
}
