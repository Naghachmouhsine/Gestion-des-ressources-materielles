package myAppSpringBoot.Services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myAppSpringBoot.Models.BesoinModel;
import myAppSpringBoot.Models.DetailsPropositionModel;
import myAppSpringBoot.Models.NotificationModel;
import myAppSpringBoot.Models.PropositionModel;
import myAppSpringBoot.Models.RessourceModel;
import myAppSpringBoot.Repositories.DetailProposiionRepository;
import myAppSpringBoot.Repositories.GestionPropositionRepository;
import myAppSpringBoot.Repositories.NotificationFournisseurRepository;
import myAppSpringBoot.Repositories.RessourceRepository;

@Service
public class GestionPropositionService {

	@Autowired
	GestionPropositionRepository gestionPropositionRepository;
	@Autowired
	DetailProposiionRepository detailProposiion;
	@Autowired
	NotificationFournisseurRepository fournisseurRepository;
	@Autowired
	RessourceRepository ressourceRepository;
	public List<PropositionModel> getAllProposition() {
		// TODO Auto-generated method stub
		return gestionPropositionRepository.findAll();
	}
	public List<DetailsPropositionModel> getDetilsProposition(){
		return detailProposiion.findAll();
	}
	public void accepteRefuseProposition(PropositionModel model,boolean etat,ArrayList<BesoinModel> besoins, String num){
		ArrayList<RessourceModel> ressources=new ArrayList<>();

		if(etat){
			model.setEtat("accepter");
			for (BesoinModel b : besoins) {
				RessourceModel r=new RessourceModel();
				r.setNumero_inventaire(num);
				r.setBesoin(b);		
				//ressources.add(r);
				ressourceRepository.save(r);
				System.out.println("id : "+b.getId_bes());
			}
			
		}			
		else
			model.setEtat("refuse");
		
		System.out.println("etat");
		for (BesoinModel bb : besoins) {
			System.out.println(bb);
		}
		gestionPropositionRepository.save(model);		
	}
	public void notificationToFournisseur(NotificationModel notif, boolean etat) {
		if(etat) //proposition est accepter
			notif.setMessage("Votre proposition pour l'appel d'offres a été acceptée. En attente de livraison.");
		else	//proposition est refuser	
		  notif.setMessage("votre propositon est refuse");
		 fournisseurRepository.save(notif);	
	}

}
