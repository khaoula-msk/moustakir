<%@page import="models.Personne"%>
<%@page import="services.servicePersonne"%>
<%@page import="services.serviceCategorie"%>
<%@page import="models.Categorie"%>
<%@page import="services.serviceLivre"%>
<%@page import="models.Livre"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Personne"%>
<% Personne p = (Personne)session.getAttribute("personne"); 
if(p==null){
	response.sendRedirect("http://localhost:8080/moustakir.khaoula/authentification");
}else{

%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title> Espace Admin |BOOK-READER </title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendors/iconfonts/ionicons/dist/css/ionicons.css">
    <link rel="stylesheet" href="assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.addons.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <link rel="stylesheet" href="assets/vendors/icheck/skins/all.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="assets/css/shared/style.css">
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="assets/css/demo_1/style.css">
    <!-- End Layout styles -->
    <link rel="shortcut icon" href="assets/images/favicon.ico" />
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_navbar.html -->
      <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-top justify-content-center">
          <a class="navbar-brand brand-logo" href="../../index.html">
            <img src="assets/images/logo.svg" alt="logo" /> </a>
          <a class="navbar-brand brand-logo-mini" href="../../index.html">
            <img src="assets/images/logo-mini.svg" alt="logo" /> </a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center">
          <ul class="navbar-nav">
            <li class="nav-item dropdown language-dropdown">
              <a class="nav-link dropdown-toggle px-2 d-flex align-items-center" id="LanguageDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                <div class="d-inline-flex mr-0 mr-md-3">
                  <div class="flag-icon-holder">
                    <i class="flag-icon flag-icon-ma"></i>
                  </div>
                </div>
                <span class="profile-text font-weight-medium d-none d-md-block">French</span>
              </a>
              <div class="dropdown-menu dropdown-menu-left navbar-dropdown py-2" aria-labelledby="LanguageDropdown">
                <a class="dropdown-item">
                  <div class="flag-icon-holder">
                    <i class="flag-icon flag-icon-us"></i>
                  </div>English
                </a>
                <a class="dropdown-item">
                  <div class="flag-icon-holder">
                    <i class="flag-icon flag-icon-fr"></i>
                  </div>French
                </a>
                <a class="dropdown-item">
                  <div class="flag-icon-holder">
                    <i class="flag-icon flag-icon-ae"></i>
                  </div>Arabic
                </a>
                <a class="dropdown-item">
                  <div class="flag-icon-holder">
                    <i class="flag-icon flag-icon-ru"></i>
                  </div>Russian
                </a>
              </div>
            </li>
          </ul>
          <form class="ml-auto search-form d-none d-md-block" action="#">
            <div class="form-group">
              <input type="search" class="form-control" placeholder="Search Here">
            </div>
          </form>
          <ul class="navbar-nav ml-auto">
            

            <li class="nav-item dropdown d-none d-xl-inline-block user-dropdown">
              <a class="nav-link dropdown-toggle" id="UserDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                <img class="img-xs rounded-circle" src="assets/images/faces/face8.jpg" alt="Profile image"> </a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                <div class="dropdown-header text-center">
                  <img class="img-md rounded-circle" src="assets/images/faces/face8.jpg" alt="Profile image">
                  <p class="mb-1 mt-3 font-weight-semibold"><%=p.getNom()+" "+p.getPrenom() %></p>
                  <p class="font-weight-light text-muted mb-0"><%=p.getEmail() %></p>
                </div>
                <a class="dropdown-item">My Profile <span class="badge badge-pill badge-danger">1</span><i class="dropdown-item-icon ti-dashboard"></i></a>
                <a class="dropdown-item">Messages<i class="dropdown-item-icon ti-comment-alt"></i></a>
                <a class="dropdown-item">Activity<i class="dropdown-item-icon ti-location-arrow"></i></a>
                <a class="dropdown-item">FAQ<i class="dropdown-item-icon ti-help-alt"></i></a>
                <a class="dropdown-item">Sign Out<i class="dropdown-item-icon ti-power-off"></i></a>
              </div>
            </li>
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item nav-profile">
              <a href="#" class="nav-link">
                <div class="profile-image">
                  <img class="img-xs rounded-circle" src="assets/images/faces/face8.jpg" alt="profile image">
                  <div class="dot-indicator bg-success"></div>
                </div>
                <div class="text-wrapper">
                  <p class="profile-name">Allen Moreno</p>
                  <p class="designation">Premium user</p>
                </div>
              </a>
            </li>
            <li class="nav-item nav-category">Main Menu</li>
            

            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8080/moustakir.khaoula/admin">
                <i class="menu-icon typcn typcn-shopping-bag"></i>
                <span class="menu-title">Ajouter Etudiant</span>
              </a>
            </li>
             <li class="nav-item">
              <a class="nav-link" href="http://localhost:8080/moustakir.khaoula/ajouterlivre.jsp">
                <i class="menu-icon typcn typcn-shopping-bag"></i>
                <span class="menu-title">Ajouter Livre</span>
              </a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8080/moustakir.khaoula/listeLivre.jsp">
                <i class="menu-icon typcn typcn-bell"></i>
                <span class="menu-title">Liste Des Livres</span>
              </a>
            </li>
                              <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/moustakir.khaoula/authentification"> Login </a>
                  </li>
 
           
          </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="row">

              <div class="col-md-10 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">AJOUTER LIVRE</h4>
                    <p class="card-description"> Veuillez saisir les donnees de votre livre: </p>
                    <form class="forms-sample" action="livre" method="post">
                      <div class="form-group">
                        <label for="exampleInputName1">ISBN</label>
                        <input type="number" name="isbn" class="form-control" id="exampleInputName1" placeholder="123456">
                      </div>
                       <div class="form-group">
                        <label for="exampleInputName1">Titre</label>
                        <input type="text" name="titre" class="form-control" id="exampleInputName1" placeholder="Les gratitudes">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputEmail3">Description</label>
                        <input type="text" name="description" class="form-control" id="exampleInputEmail3" placeholder="Les gratitudes - Delphine de Vigan - Éditions le Livre de Poche - Roman - lu d'une traite ce 21 novembre 2020.">
                      </div>
                      <div class="form-group">
                        <label for="exampleInputPassword4">Année d'edition</label>
                        <input type="number" name="annee_edition" class="form-control" id="exampleInputPassword4" placeholder="2020">
                      </div>
                                             <div class="form-group row">
                                                                <label class="col-sm-2 col-form-label">Categorie</label>
                                                                <div class="col-sm-10">
                                                                	<%ArrayList<Categorie> categories = serviceCategorie.listeCategories();%>
                                                                    <select name="select" class="form-control">
                                                                    	<% for(Categorie c:categories){ %>
                                                                        <option value="opt1"><%=c.getNom() %></option>
                                                                        <%} %>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="form-group row">
                                                                <label class="col-sm-2 col-form-label">Auteur</label>
                                                                <div class="col-sm-10">
                                                                   <%ArrayList<Personne> auteurs = servicePersonne.listeAuteurs();%>
                                                                
                                                                    <select name="select" class="form-control">
                                                                     	<% for(Personne a:auteurs){ %>
                                                                        <option value="opt1"><%=a.getNom() %></option>
                                                                        <%} %>   
                                                                     </select>
                                                                </div>
                                                            </div>
                      
                      <button type="submit" class="btn btn-success mr-2">Submit</button>
                      <button class="btn btn-light">Cancel</button>
                    </form>
                  </div>
                </div>
              </div>
             
             



            </div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:../../partials/_footer.html -->
          <footer class="footer">
            <div class="container-fluid clearfix">
              <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright Â© bootstrapdash.com 2020</span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://www.bootstrapdash.com/bootstrap-admin-template/" target="_blank">Bootstrap admin templates</a> from Bootstrapdash.com</span>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="assets/vendors/js/vendor.bundle.addons.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page-->
    <!-- End plugin js for this page-->
    <!-- inject:js -->
    <script src="assets/js/shared/off-canvas.js"></script>
    <script src="assets/js/shared/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="assets/js/shared/jquery.cookie.js" type="text/javascript"></script>
    <!-- End custom js for this page-->
  </body>
</html>
<%}%>