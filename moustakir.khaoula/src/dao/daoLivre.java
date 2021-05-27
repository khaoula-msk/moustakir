package dao;

import java.sql.ResultSet; 
import java.sql.SQLException;
import java.util.ArrayList;

import models.Livre;

public class daoLivre {

	public static Livre LivreParId(int id) throws ClassNotFoundException, SQLException {
		Livre l=null;
		Connexion.Connect();
		ResultSet res = Connexion.Select("select * from livre where id="+id);
		if(res.next()) {
			l=new Livre(res.getInt(1), res.getInt(2), res.getString(3), res.getString(4),res.getInt(5), null,null);
		}
		Connexion.Disconnect();
		return l;
	}
	public static ArrayList<Livre> listeLivres() throws SQLException, ClassNotFoundException{
		ArrayList<Livre> livres = new ArrayList<Livre>();
		Connexion.Connect();
		ResultSet res = Connexion.Select("select * from livre");
		while(res.next()) {
			Livre l =new Livre(res.getInt(1), res.getInt(2), res.getString(3),res.getString(4),res.getInt(5),null, null);
			l.setCategorie(daoCategorie.categorieParId(res.getInt(6)));
			l.setAuteur(daoPersonne.PersonneParId(res.getInt(7)));
			livres.add(l);
		}
		Connexion.Disconnect();
		return livres;
	}	
	public static int AjouterLivre(Livre l) throws ClassNotFoundException, SQLException {
		int x=daoCategorie.getIdCatByName(l.getCategorie().getNom());
		int y=daoPersonne.getIdPerByName(l.getAuteur().getNom());
		
	
		Connexion.Connect();
		int res = Connexion.Maj("INSERT INTO `livre`(` isbn`, `titre`, `description`, `annee_edition`,'idCategorie','idAuteur') VALUES ("+l.getIsbn()+",'"+l.getTitre()+"','"+l.getDescription()+"',"+l.getAnnee_edition()+","+x+","+y+")");
		Connexion.Disconnect();
		return res;
	}
		
	public static boolean LivreExiste(int isbn) throws ClassNotFoundException, SQLException {
		boolean exist = false ;
		Connexion.Connect();
		ResultSet res = Connexion.Select("select * from livre where isbn="+isbn);
		if(res.next()) {
			exist=true;
		}
		Connexion.Disconnect();
		return exist;
	}

	public static int getIdLivByName(String titre) throws ClassNotFoundException, SQLException {
		int idcat=0;
		Connexion.Connect();
		ResultSet res = Connexion.Select("select id from livre where titre='"+titre+"'");
		if(res.next()) {
			idcat = res.getInt(2);
		}
		Connexion.Disconnect();
		return idcat;
	}
}
