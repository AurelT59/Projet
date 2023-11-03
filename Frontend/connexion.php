<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="centre">
        <div class="cadre">
            <img class="navbar-brand" id="logo_healtheat" src="imgs/logo_healtheat.png">
            <table id="table">
                <tr>
                    <td>
                        <div class="form-label">Identifiant</div>
                    </td>
                    <td>
                        <input type="text" class="form-control input-taille" id="inputLogin">
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="form-label">Mot de passe</div>
                    </td>
                    <td>
                        <input type="password" class="form-control input-taille" id="inputMdp">
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="creation_compte.php">Créer un compte</a>
                    </td>
                    <td>
                        <button type="button" id="btnValider" class="btn btn-success body-button">Valider</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="js/config.js"></script>
    <script src="js/script_connexion.js"></script>

</body>