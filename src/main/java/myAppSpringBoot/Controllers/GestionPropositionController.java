package myAppSpringBoot.Controllers;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import myAppSpringBoot.Models.AppelOffreModel;
import myAppSpringBoot.Models.BesoinModel;
import myAppSpringBoot.Models.DetailsPropositionModel;
import myAppSpringBoot.Models.FournisseurModel;
import myAppSpringBoot.Models.NotificationModel;
import myAppSpringBoot.Models.PropositionModel;
import myAppSpringBoot.Models.PropositionModelRespo;
import myAppSpringBoot.Models.RessourceModel;
import myAppSpringBoot.Models.UserModel;
import myAppSpringBoot.Repositories.NotificationFournisseurRepository;
import myAppSpringBoot.Services.GestionPropositionService;



@RestController
public class GestionPropositionController {

	@Autowired
	GestionPropositionService gestionPropositionService;
	@Autowired
	NotificationFournisseurRepository fournisseurRepository;
	@GetMapping("/getAllProposition")
	public List<PropositionModelRespo> getAllProposition(@RequestParam Long appelOffreId) {
		ArrayList<PropositionModelRespo> listProposition=new ArrayList<>();
		List<DetailsPropositionModel> listDetails=gestionPropositionService.getDetilsProposition();
		for (PropositionModel pr : gestionPropositionService.getAllProposition()) {
			PropositionModelRespo model=new PropositionModelRespo(pr.getId_prop(),pr.getDate_livraison(),pr.getTotal(),pr.getEtat(),pr.getAppelOffre(),pr.getFournisseur());
			for (DetailsPropositionModel details : listDetails)
				if(details.getProposition().getId_prop()==pr.getId_prop())
					model.getDetails().add(details);
			if(model.getAppelOffre().getId_app_off()==appelOffreId)
				listProposition.add(model);
			System.out.println(model);
			
		}
		System.out.println(appelOffreId);
		return listProposition;
	}
	@GetMapping("/getAllPropositionJSP")
	public List<PropositionModelRespo> getAllProposition() {
		ArrayList<PropositionModelRespo> listProposition=new ArrayList<>();
		List<DetailsPropositionModel> listDetails=gestionPropositionService.getDetilsProposition();
		for (PropositionModel pr : gestionPropositionService.getAllProposition()) {
			PropositionModelRespo model=new PropositionModelRespo(pr.getId_prop(),pr.getDate_livraison(),pr.getTotal(),pr.getEtat(),pr.getAppelOffre(),pr.getFournisseur());
			for (DetailsPropositionModel details : listDetails)
				if(details.getProposition().getId_prop()==pr.getId_prop())
					model.getDetails().add(details);
		    listProposition.add(model);
		}
		return listProposition;
	}
	@GetMapping("/getNotification")
	public List<NotificationModel> getNotif() {
			return fournisseurRepository.findAll();
	}
	@PostMapping("/reponseProposition")
	public boolean reponseProposition(@RequestParam int idPro,@RequestParam int idFour,@RequestParam boolean etat,@RequestParam String num) {
		
		ArrayList<BesoinModel> besoins=new ArrayList<>();
		FournisseurModel fournisseurModel=new FournisseurModel();
		PropositionModel propostion = null;
		
		for (PropositionModelRespo  pr:this.getAllProposition()) {
			if(pr.getId_prop()==idPro) {
				fournisseurModel=pr.getFournisseur();
				propostion=new PropositionModel(pr.getId_prop(),pr.getDate_livraison(),pr.getTotal(),pr.getEtat(),pr.getAppelOffre(),pr.getFournisseur());
				for (DetailsPropositionModel detail : pr.getDetails())
						besoins.add(detail.getBesoin());
			}
		}
		Date dateActuel=new Date(System.currentTimeMillis());
		NotificationModel notif=new NotificationModel(dateActuel,"",0,null,null,fournisseurModel);
         try {
        	gestionPropositionService.notificationToFournisseur(notif,etat);
        	gestionPropositionService.accepteRefuseProposition(propostion, etat,besoins,num);        
        	return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return false;
		}	
	}

}
