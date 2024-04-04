package myAppSpringBoot.Models;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Proposition")
public class PropositionModel {

	@Id
	private int id_prop;
	private Date date_livraison;
	private float total;
	private String etat;
	
	@ManyToOne
    @JoinColumn(name = "id_app_off", referencedColumnName = "id_app_off")
	public AppelOffreModel appelOffre;
	
	@ManyToOne
    @JoinColumn(name = "id_four", referencedColumnName = "id_four")
	public FournisseurModel fournisseur;

	public PropositionModel(){

	}

	public int getId_prop() {
		return id_prop;
	}

	public void setId_prop(int id_prop) {
		this.id_prop = id_prop;
	}

	public Date getDate_livraison() {
		return date_livraison;
	}

	public void setDate_livraison(Date date_livraison) {
		this.date_livraison = date_livraison;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public String getEtat() {
		return etat;
	}

	public void setEtat(String etat) {
		this.etat = etat;
	}

	public AppelOffreModel getAppelOffre() {
		return appelOffre;
	}

	public void setAppelOffre(AppelOffreModel appelOffre) {
		this.appelOffre = appelOffre;
	}

	public FournisseurModel getFournisseur() {
		return fournisseur;
	}

	public void setFournisseur(FournisseurModel fournisseur) {
		this.fournisseur = fournisseur;
	}
	
	

}//end PropositionModel