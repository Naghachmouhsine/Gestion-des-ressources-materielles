<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page principale d'eniengant</title>
    
    <!-- ======= Bootstrap ====== -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
   <!-- Add Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- Inclure le fichier JavaScript -->
    <script src="/static/js/main.js"></script>
</head>
<body>
    <!-- Inclure la barre de navigation -->
    <jsp:include page="SideBarChefDepartement.jsp" />
    
  
=======
    <h1>Bonjour Chef de Département</h1>
    <!-- Affichage des informations de l'utilisateur -->
    <p>Nom d'utilisateur : ${ChefDepartement.nom}</p>
    <p>Email : ${ChefDepartement.email}</p>
    <!-- Ajoutez ici le contenu de la page principale du chef de département -->
</body>
</html>
