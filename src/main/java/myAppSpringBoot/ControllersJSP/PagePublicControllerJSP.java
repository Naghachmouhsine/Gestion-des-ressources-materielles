package myAppSpringBoot.ControllersJSP;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import myAppSpringBoot.Controllers.PagePublicController;
import myAppSpringBoot.Models.AppelOffreModel;
import myAppSpringBoot.Models.AppelOffreModelRespo;
import myAppSpringBoot.Models.BesoinModel;
import myAppSpringBoot.Models.DetailsPropositionModel;
import myAppSpringBoot.Models.FournisseurModel;
import myAppSpringBoot.Models.PropositionModel;
import myAppSpringBoot.Repositories.AppelOffreRepository;

import javax.servlet.http.HttpSession;
@Controller
public class PagePublicControllerJSP {
 
	@Autowired
	private PagePublicController pagePublicController;
	private AppelOffreRepository appeloffreRepository;
	
	@GetMapping("/PagePublique")
	public String toPagePublic(Model model) {
		ArrayList<AppelOffreModelRespo> listAppelsOffres=pagePublicController.getAllAppelOffres_PP();
		model.addAttribute("listAppelsOffres",listAppelsOffres);
		return "Fournisseur/PagePublic";
		
	}
	
	  @GetMapping("/proposition/{id}")
	  public String afficherAjouterProposition(@PathVariable("id") String idAppel,HttpSession session,Model model) {
		   
		  int idAppelOffre = Integer.parseInt(idAppel);
		  // recuperer appel offres(Liste besoins)
			//ArrayList<AppelOffreModelRespo> listAppelsOffres=pagePublicController.;
		  ArrayList <BesoinModel> listBesoinsAppelOffre =pagePublicController.getBesoinsAppelOffre(idAppelOffre);
		  model.addAttribute("listBesoinsAppelOffre", listBesoinsAppelOffre);
		  //
		  ArrayList<AppelOffreModelRespo> listAppelsOffres=pagePublicController.getAllAppelOffres_PP();
		  session.setAttribute("idAppel", idAppel);
	      //verfier si il est authentifier
		   FournisseurModel fournisseur =(FournisseurModel) session.getAttribute("Fournisseur"); 
	       if (fournisseur == null) {
		      System.out.println("n'est pas authentifier rediger");
		   return "redirect:/loginFournisseur";  }
	
	       // L'utilisateur est authentifié, don
	        System.out.println("DEjaaaa authentifier ");
	      //ajouter proposition
	  return "Fournisseur/AjouterProposition";
	  
	  
	  }
	  
	  @PostMapping("/AjouterProposition")
	  public String AjouterProposition(@RequestParam("dateLivraison") Date dateLivraison,
                                       @RequestParam("total") float total,
                                       @RequestParam Map<String, String> formData,HttpSession session) {
		 //recuperer id AppelOffre
		  String idAppelOffreS = (String) session.getAttribute("idAppel");
		  int idAppelOffre = Integer.parseInt(idAppelOffreS);
		  System.out.println("session appelOffre :" + idAppelOffre);
		  
		  // recuperer Fournisseur 
		  FournisseurModel fournisseur = (FournisseurModel) session.getAttribute("Fournisseur");
		  //chercherAppeloffreModel
		    AppelOffreModel appelOffre=pagePublicController.getAppelOffre(idAppelOffre);
		    //creer model proposition
		  	PropositionModel propositionModel=new PropositionModel(dateLivraison,total,appelOffre,fournisseur);
	
		  //	propositionModel.setDate_livraison(dateLivraison);
		//  	propositionModel.setAppelOffre(appelOffre);
		//  	propositionModel.setTotal(total);
		  	//enregistrer le model proposition et recuperer idproposition
		  	PropositionModel proposition =pagePublicController.saveProposition(propositionModel);
		  
		  	//Enregister dans detailsProposition
		  	//List<DetailsPropositionModel> detailsPropositionList = new ArrayList<>();
		  	for (String key : formData.keySet()) {
		  	    if (key.startsWith("prix_")) {
		  	    	int besoinId = Integer.parseInt(key.substring(5)); // Récupération de l'identifiant du besoin à partir de la clé
		  	        System.out.println("id besoin "+besoinId);
		  	        // chercher le model besoin
		  	        BesoinModel besoin=pagePublicController.getBesoinId(besoinId);
		  	        //chercher le prix
		  	        String prixS = formData.get("prix_"+besoinId); 
		  	        float prix = Float.parseFloat(prixS);
		  	        System.out.println("prix "+prix);
		  	        //chercher la marque
		  	        String marque = formData.get("marque_"+besoinId); // name="typeForm"
		  	        System.out.println("marque "+marque);
		  	        
		  	        //stocker detailsPropositionModel
		  	        DetailsPropositionModel detailPropositionModel =new DetailsPropositionModel(marque,prix,besoin,proposition);
		  	    	//Ajouter a la liste 
		  	       // detailsPropositionList.add(detailPropositionModel);
		  	        DetailsPropositionModel DetailsProposition =pagePublicController.saveDetailsProposition(detailPropositionModel);
		  	    }
		  	}
		  	
		  
		return "Fournisseur/PagePublic";
		  
	  }
	 
}
