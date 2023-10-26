<?php

function renderMenuToHTML($currentPageId)
{
    $menu = array(
        'accueil' => array('Accueil'),
        'journal' => array('Journal'),
        'profil' => array('Profil'),
        'aliments' => array('Aliments'),
    );



    echo '
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <img class="navbar-brand" id="logo_healtheat" src="imgs/logo_healtheat.png">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav">';

    foreach ($menu as $pageId => $pageParameters) {
        if ($pageId == $currentPageId) {
            echo '<a class="nav-link active" aria-current="page" href="index.php?page=' . $pageId . '">' . $pageParameters[0] . '</a>';
        } else {
            echo '<a class="nav-link" href="index.php?page=' . $pageId . '">' . $pageParameters[0] . '</a>';
        }
    }

    echo '</div></div></div></nav>';
}
