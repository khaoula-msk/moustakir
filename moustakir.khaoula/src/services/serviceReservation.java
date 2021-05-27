package services;

import java.sql.SQLException;

import dao.daoReservation;
import models.reservation;

public class serviceReservation {
	 public static boolean Reserverlivre(reservation r) throws ClassNotFoundException, SQLException {
			boolean exist = daoReservation.ReservationExiste(r.getId());
			if(exist) {
				return false;
			}else {
				int res = daoReservation.Reserverlivre(r);
				return res == 1;
			}
		}
}
