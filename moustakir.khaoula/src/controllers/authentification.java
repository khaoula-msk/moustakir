package controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Personne;
import models.Role;
import services.servicePersonne;




@WebServlet("/authentification")
public class authentification extends HttpServlet {
	 public authentification() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/authentification.jsp").include(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Personne p=null;	
		String login=request.getParameter("email");
		String password=request.getParameter("mdp");
	
		 try {
			p=servicePersonne.Authentification(login,password);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(p==null)
		{ 
			response.sendRedirect("http://localhost:8080/moustakir.khaoula/authentification");
		}
		else
		{ HttpSession session= request.getSession();
		session.setAttribute("personne", p);
            if(p.getRole().equals(Role.ADMIN))	{
            	response.sendRedirect("http://localhost:8080/moustakir.khaoula/admin");
            }
            else {
            	response.sendRedirect("http://localhost:8080/moustakir.khaoula/etudiant");
            }
		}
	}

}