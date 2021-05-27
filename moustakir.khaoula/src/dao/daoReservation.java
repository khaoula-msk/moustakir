package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import models.reservation;

public class daoReservation {

	public static int Reserverlivre(reservation r) throws ClassNotFoundException, SQLException {
		int y=daoPersonne.getIdPerByName(r.getIdetudiant().getNom());
		int z=daoLivre.getIdLivByName(r.getIdlivre().getTitre());
	
		Connexion.Connect();
		int res = Connexion.Maj("INSERT INTO `reservation`(` idlivre`, `idetudiant`,` etat`) VALUES ("+z+",'"+y+"','"+r.getEtat()+"')");
		Connexion.Disconnect();
		return res;
	}
	public static boolean ReservationExiste(int id) throws ClassNotFoundException, SQLException {
		boolean exist = false ;
		Connexion.Connect();
		ResultSet res = Connexion.Select("select * from livre where id="+id);
		if(res.next()) {
			exist=true;
		}
		Connexion.Disconnect();
		return exist;
	}
}
