package myAppSpringBoot.Models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Fournisseur")
public class FournisseurModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) // pour auto-incrémenter
	private int id_four;
	private String nom_societe;
	private String gerant;
	private String adresse;
	private String lieu;
	private String site_internet;
	private int etat;

	public FournisseurModel(){

	}

	public int getId_four() {
		return id_four;
	}

	public void setId_four(int id_four) {
		this.id_four = id_four;
	}

	public String getNom_societe() {
		return nom_societe;
	}

	public void setNom_societe(String nom_societe) {
		this.nom_societe = nom_societe;
	}

	public String getGerant() {
		return gerant;
	}

	public void setGerant(String gerant) {
		this.gerant = gerant;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getLieu() {
		return lieu;
	}

	public void setLieu(String lieu) {
		this.lieu = lieu;
	}

	public String getSite_internet() {
		return site_internet;
	}

	public void setSite_internet(String site_internet) {
		this.site_internet = site_internet;
	}

	public int getEtat() {
		return etat;
	}

	public void setEtat(int etat) {
		this.etat = etat;
	}
	

}//end FournisseurModel