package models;

public class reservation {
private int id;
private Livre idlivre;
private Personne idetudiant;
private String etat;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public Livre getIdlivre() {
	return idlivre;
}
public void setIdlivre(Livre idlivre) {
	this.idlivre = idlivre;
}
public Personne getIdetudiant() {
	return idetudiant;
}
public void setIdetudiant(Personne idetudiant) {
	this.idetudiant = idetudiant;
}
public String getEtat() {
	return etat;
}
public void setEtat(String etat) {
	this.etat = etat;
}
public reservation() {
	super();
}
public reservation(Livre idlivre, Personne idetudiant, String etat) {
	super();
	this.idlivre = idlivre;
	this.idetudiant = idetudiant;
	this.etat = etat;
}
public reservation(int id, Livre idlivre, Personne idetudiant, String etat) {
	super();
	this.id = id;
	this.idlivre = idlivre;
	this.idetudiant = idetudiant;
	this.etat = etat;
}
@Override
public String toString() {
	return "reservation [id=" + id + ", idlivre=" + idlivre + ", idetudiant=" + idetudiant + ", etat=" + etat + "]";
}


}
