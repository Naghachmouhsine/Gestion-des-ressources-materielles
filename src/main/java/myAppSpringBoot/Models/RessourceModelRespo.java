package myAppSpringBoot.Models;

public class RessourceModelRespo extends RessourceModel {
	private String marque;
	private float prix;
	private FournisseurModel fournisseurModel;
	
	
	public FournisseurModel getFournisseurModel() {
		return fournisseurModel;
	}
	public void setFournisseurModel(FournisseurModel fournisseurModel) {
		this.fournisseurModel = fournisseurModel;
	}
	public RessourceModelRespo(String type, float prix) {
		super();
		this.marque = type;
		this.prix = prix;
	}
	public RessourceModelRespo() {
		// TODO Auto-generated constructor stub
	}
	public String getMarque() {
		return marque;
	}
	public void setMarque(String type) {
		this.marque = type;
	}
	public float getPrix() {
		return prix;
	}
	public void setPrix(float prix) {
		this.prix = prix;
	}
	
}
