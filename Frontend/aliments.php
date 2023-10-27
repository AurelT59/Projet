<!-- FORMULAIRE POUR RENSEIGNER UN NOUVEL ALIMENT -->

<div class="box" id="box_form_conso">
    <h1>Ajout d'un nouvel aliment au catalogue</h1>
    <form>
        <div class="mb-3">
            <label class="form-label">Nom</label>
            <input type="text" class="form-control" id="inputAliment">
            <label class="form-label">Quantite</label>
            <input type="text" class="form-control" id="inputQuantite">
            <label class="form-label">Portion</label>
            <input type="text" class="form-control" id="inputPortion">
            <label class="form-label">Marque</label>
            <input type="text" class="form-control" id="inputMarque">
            <label class="form-label">Energie</label>
            <input type="text" class="form-control" id="inputEnergie">
            <label class="form-label">Unité de l'energie</label>
            <input type="text" class="form-control" id="inputUnite">
        </div>
        <button type="submit" class="btn btn-primary body-button">Valider</button>
    </form>
</div>

<!-- LISTE DES ALIMENTS DÉJÀ DANS LA BDD -->

<div class="box" id="box_table_journal">
    <h1>Consulter le catalogue</h1>
    <table class="table" id="table_aliments">
        <thead>
            <tr>
                <th scope="col">Nom</th>
                <th scope="col">CRUD</th>
            </tr>
        </thead>
        <tbody id="table_journal_body">
        </tbody>
    </table>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>

<script src="js/script_aliments.js"></script>