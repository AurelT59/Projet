<?php

function renderMenuToHTML($currentPageId)
{
    global $valeurDuCookie;
    $menu = array(
        'accueil' => array('Accueil'),
        'journal' => array('Journal'),
        'profil' => array('Profil'),
        'aliments' => array('Aliments'),
    );


    echo '
        <div id="header">
            <img class="navbar-brand" id="logo_healtheat" src="imgs/logo_healtheat.png">  
            <div class="container-fluid" > 
            <nav class="navbar navbar-expand-lg" id="menu">
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav">
    ';

    foreach ($menu as $pageId => $pageParameters) {
        if ($pageId == $currentPageId) {
            echo '<a class="nav-link active" aria-current="page" href="index.php?page=' . $pageId . '">' . $pageParameters[0] . '</a>';
        } else {
            echo '<a class="nav-link" href="index.php?page=' . $pageId . '">' . $pageParameters[0] . '</a>';
        }
    }

    echo '
                        </div>
                    </div>
                    <div id="connected" class="d-flex justify-content-end">
                <p>Utilisateur connecté : <br> <span id="iduser">' . $valeurDuCookie->IDENTIFIANT . '</span></p>
                <button type="button" class="btn btn-primary" id="disconnect-button">Déconnexion</button>
            </div>
                </div>
            </nav>
        </div>
    ';
}
