<div class="box" id="box_form_profil">
    <h1>Modification des informations personnelles</h1>

    <div class="row">
        <div class="col-3">
            <div class="mb-3">
                <label class="form-label">Identifiant</label>
                <input type="text" class="form-control" id="inputLogin" value=<?php echo $valeurDuCookie->IDENTIFIANT ?>>
            </div>
            <div class="mb-3">
                <label class="form-label">Nouveau mot de passe</label>
                <input type="password" class="form-control" id="inputMdp">
            </div>
            <div class="mb-3">
                <label class="form-label">Confirmation nouveau mot de passe</label>
                <input type="password" class="form-control" id="inputMdp2">
            </div>
            <div class="mb-3">
                <label class="form-label">Nom</label>
                <input type="text" class="form-control" id="inputNom" value=<?php echo $valeurDuCookie->NOM ?>>
            </div>
            <div class="mb-3">
                <label class="form-label">Prénom</label>
                <input type="text" class="form-control" id="inputPrenom" value=<?php echo $valeurDuCookie->PRENOM ?>>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <label class="form-label">Âge</label>
                <input type="number" class="form-control" id="inputAge" value=<?php echo $valeurDuCookie->AGE ?>>
            </div>
            <div class="mb-3">
                <label class="form-label">Taille (cm)</label>
                <input type="number" class="form-control" id="inputTaille" value=<?php echo $valeurDuCookie->TAILLE ?>>
            </div>
            <div class="mb-3">
                <label class="form-label">Poids (kg)</label>
                <input type="number" class="form-control" id="inputPoids" value=<?php echo $valeurDuCookie->POIDS ?>>
            </div>
            <div class="mb-3">
                <label class="form-label">Genre</label>
                <select type="text" class="form-select input-taille" id="inputSexe"></select>
            </div>
            <div class="mb-3">
                <label class="form-label">Pratique sportive</label>
                <select type="text" class="form-select input-taille" id="inputSport"></select>
            </div>
        </div>
    </div>

    <button id="btnValider" class="btn btn-primary body-button">Valider</button>
    <p id="messageConfirmation"></p>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="js/config.js"></script>
<script src="js/script_profil.js"></script>