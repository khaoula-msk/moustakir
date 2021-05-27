<%@page import="models.Personne"%>
<%@page import="models.Role"%>
 <%Personne p = (Personne)session.getAttribute("personne");  
if(p!=null){
	
    if(p.getRole().equals(Role.ADMIN)) {
		response.sendRedirect("http://localhost:8080/moustakir.khaoula/admin.jsp");
	}else {
		response.sendRedirect("http://localhost:8080/moustakir.khaoula/etudiant");}
		}
else{  %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Authentification | BOOK-READER</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendors/iconfonts/ionicons/dist/css/ionicons.css">
    <link rel="stylesheet" href="assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.addons.css">
    <!-- endinject -->
    <!-- plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="assets/css/shared/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="assets/images/favicon.ico" />
  </head>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth auth-bg-1 theme-one">
          <div class="row w-100">
            <div class="col-lg-4 mx-auto">
              <div class="auto-form-wrapper">
                <form action="authentification" method="post">
                  <div class="form-group">
                    <label class="label">E-mail</label>
                    <div class="input-group">
                      <input type="email" name="email" class="form-control" placeholder="E-mail">
                      <div class="input-group-append">
                        <span class="input-group-text">
                          <i class="mdi mdi-check-circle-outline"></i>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="label">Mot de passe</label>
                    <div class="input-group">
                      <input type="password" name="mdp" class="form-control" placeholder="*********">
                      <div class="input-group-append">
                        <span class="input-group-text">
                          <i class="mdi mdi-check-circle-outline"></i>
                        </span>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                   <input type="submit" class="btn btn-primary submit-btn btn-block" value="S'authentifier">
                  </div>
                  <div class="form-group d-flex justify-content-between">
                    <div class="form-check form-check-flat mt-0">
                      <label class="form-check-label">
                        <input type="checkbox" class="form-check-input" checked> Rester connecté </label>
                    </div>
                    
                  </div>

                  <div class="text-block text-center my-3">
                    <span class="text-small font-weight-semibold">Pas un membre ? </span>
                    <a href="http://localhost:8080/moustakir.khaoula/inscription" class="text-black text-small">Créer un nouveau compte</a>
                  </div>
                </form>
              </div>
              <ul class="auth-footer">
                <li>
                  <a href="#">Conditions</a>
                </li>
                <li>
                  <a href="#">Aide</a>
                </li>
                <li>
                  <a href="#">Termes</a>
                </li>
              </ul>
              <p class="footer-text text-center">copyright © 2021. All rights reserved.</p>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="assets/vendors/js/vendor.bundle.addons.js"></script>
    <!-- endinject -->
    <!-- inject:js -->
    <script src="assets/js/shared/off-canvas.js"></script>
    <script src="assets/js/shared/misc.js"></script>
    <!-- endinject -->
    <script src="assets/js/shared/jquery.cookie.js" type="text/javascript"></script>
  </body>
</html>
<%}%>
