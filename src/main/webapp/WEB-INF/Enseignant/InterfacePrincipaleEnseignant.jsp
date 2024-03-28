<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page principale d'eniengant</title>
    <!-- ======= Styles ====== -->
    <link rel="stylesheet" href="/static/css/style.css">
</head>

<body>

<!-- =============== Navigation ================ -->
    <div class="container">
        <div class="navigation">
            <ul>
                <li>
                    <div>
                        <span class="icon">
                            <ion-icon name="file-tray-stacked-outline" style="opacity: 0.5;"></ion-icon>
                        </span>
                        <span class="title" style="opacity: 0.5;">Resource</span>
                    </div>
                </li>

                <li>
                    <div>
                        <span class="icon">
                            <ion-icon name="list-outline"></ion-icon>
                        </span>
                        <span class="title">Besoins</span>
                    </div>
                </li>

                <li>
                    <div>
                        <span class="icon">
                            <ion-icon name="folder-open-outline"></ion-icon>
                        </span>
                        <span class="title">Ressources</span>
                    </div>
                </li>

                <li>
                    <div>
                        <span class="icon">
                            <ion-icon name="chatbubble-outline"></ion-icon>
                        </span>
                        <span class="title">Messages</span>
                    </div>
                </li>

                <li>
                    <div>
                        <span class="icon">
                            <ion-icon name="person-circle-outline"></ion-icon>
                        </span>
                        <span class="title">Profile</span>
                    </div>
                </li>

                <li>
                    <div>
                        <span class="icon">
                            <ion-icon name="lock-closed-outline"></ion-icon>
                        </span>
                        <span class="title">Password</span>
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
<!-- =============== fin Navigation ================ -->

<!-- ========================= Main ==================== -->
        <div class="main">
            <div class="topbar">
                <div class="toggle">
                    <ion-icon name="menu-outline"></ion-icon>
                </div>

                <div class="search">
                    <label>
                        <input type="text" placeholder="Search here">
                        <ion-icon name="search-outline"></ion-icon>
                    </label>
                </div>

                <div class="user">
                    <ion-icon name="person-circle-outline" size="large"></ion-icon>
                </div>              
            </div>

			<!-- le contenu ..............  -->
           
        </div>
<!-- ========================= Fin Main ==================== -->
    

<!-- =========== Scripts =========  -->
    <script src="/static/js/main.js"></script>

<!-- ====== ionicons ======= -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
</body>

</html>