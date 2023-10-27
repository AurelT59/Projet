<?php

function renderMenuToHTML($currentPageId)
{
    $menu = array(
        'accueil' => array('Accueil'),
        'journal' => array('Journal'),
        'profil' => array('Profil'),
        'aliments' => array('Aliments'),
    );

    //  bg-body-tertiary
    // <img class="navbar-brand" id="logo_healtheat" src="imgs/logo_healtheat.png">
    // <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    //     <span class="navbar-toggler-icon"></span>
    // </button>

    echo '
        <div id="header">
            <img class="navbar-brand" id="logo_healtheat" src="imgs/logo_healtheat.png">   
            <nav class="navbar navbar-expand-lg" id="menu">
                <div class="container-fluid" >
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
                </div>
            </nav>
            <div id="connected">
                <p>Utilisateur connecté : <br> Username</p>
                <button type="button" class="btn btn-primary" id="disconnect-button">Déconnexion</button>
            </div>
        </div>
    ';
}
