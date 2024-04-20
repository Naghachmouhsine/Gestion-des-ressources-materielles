<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <!-- ======= Styles ====== -->
    <link rel="stylesheet" href="/static/css/style.css">
</head>

<body>

<div class="containerCSS">
        <div class="navigationCSS">
            <ul>
                <li>
                    <div>
                        <span class="icon">
                            <ion-icon name="briefcase-outline"></ion-icon>
                        </span>
                        <span class="title">Besoins</span>
                    </div>
                </li>
                
                <li>
                    <div id="demanderBesoinButton">
                        <span class="icon">
                            <ion-icon name="add-circle-outline"></ion-icon>
                        </span>
                        <span class="title">Demande </span>
                    </div>
                </li>

                <li>
                    <div id="consulterBesoinButton">
                        <span class="icon">
                            <ion-icon name="list-outline"></ion-icon>
                        </span>
                        <span class="title">Consultation </span>
                    </div>
                </li>
                
                <li style="cursor: pointer;">
                    <div id="ConsulterMessagesButton">
                        <span class="icon">
                            <ion-icon name="chatbubble-outline"></ion-icon>
                        </span>
                        <span class="title">Messages</span>
                    </div>
                </li>

                <li>
                    <div>
                        <span class="icon">
                            <ion-icon name="log-out-outline"></ion-icon>
                        </span>
                        <span class="title">Sign Out</span>
                    </div>
                </li>
                
                
            </ul>
        </div>
    </div>
    <!-- Fin Navigation -->

    <!-- Script ionicons -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    
    
   <script>
    document.addEventListener("DOMContentLoaded", function () {
        // S�lectionne les boutons de la sidebar
        var demanderBesoinButton = document.getElementById("demanderBesoinButton");
        var consulterBesoinButton = document.getElementById("consulterBesoinButton");

        demanderBesoinButton.addEventListener("click", function () {
            document.getElementById("demandeBesoinsContent").style.display = "block";
            document.getElementById("consultationBesoinsContent").style.display = "none";
            document.getElementById("consultationMessagesChefContent").style.display = "none";
        });

        consulterBesoinButton.addEventListener("click", function () {
            document.getElementById("consultationBesoinsContent").style.display = "block";
            document.getElementById("demandeBesoinsContent").style.display = "none";
            document.getElementById("consultationMessagesChefContent").style.display = "none";
        });
        
        ConsulterMessagesButton.addEventListener("click", function () {
            document.getElementById("consultationMessagesChefContent").style.display = "block";
            document.getElementById("consultationBesoinsContent").style.display = "none";
            document.getElementById("demandeBesoinsContent").style.display = "none";
        });
    });
    
   
</script>
   
    
</body>
</html>