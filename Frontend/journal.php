<!-- FORMULAIRE POUR RENTRER UNE CONSOMMATION -->

<div class="box" id="box_form_conso">
    <h1>Nouvelle entrée dans le journal</h1>

    <div class="mb-3">
        <label for="inputDateConso" class="col-sm-2 col-form-label">Date</label>
        <div class="col-sm-3">
            <input type="date" class="form-control" id="inputDate">
        </div>
    </div>
    <div class="mb-3">
        <label class="form-label">Aliment consommé</label>
        <select id="selectAliment" class="form-select">
        </select>
    </div>
    <div class="mb-3">
        <label class="form-label">Quantité (nombre de portions)</label>
        <input type="number" class="form-control" id="inputQuantite">
    </div>
    <button type="button" id="btnValider" class="btn btn-success body-button">Valider</button>

</div>

<!-- LISTE DES CONSOMMATIONS PRÉCÉDENTES -->

<div class="box" id="box_table_journal">
    <h1>Consulter le journal</h1>
    <table class="table" id="table_journal">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Date</th>
                <th scope="col">Aliment</th>
                <th scope="col">Quantité</th>
                <th scope="col">CRUD</th>
            </tr>
        </thead>
        <tbody id="table_journal_body">
        </tbody>
    </table>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="js/config.js"></script>
<script src="js/script_journal.js"></script>