<!-- FORMULAIRE POUR RENTRER UNE CONSOMMATION -->
<div id="box_form_conso">
    <h1>Nouvelle entrée dans le journal</h1>
    <form>
        <div class="mb-3">
            <label for="inputDateConso" class="col-sm-2 col-form-label">Date</label>
            <div class="col-sm-3">
                <input type="date" class="form-control" id="inputDateConso">
            </div>
        </div>
        <div class="mb-3">
            <label class="form-label">Aliment consommé</label>
            <input type="text" class="form-control" id="inputAliment">
        </div>
        <button type="submit" class="btn btn-primary">Valider</button>
    </form>
</div>

<!-- LISTE DES CONSOMATIONS PRÉCÉDENTES -->

<div id="box_table_journal">
    <h1>Consulter le journal</h1>
    <table class="table" id="table_journal">
        <thead>
            <tr>
                <th scope="col">Date</th>
                <th scope="col">Aliment</th>
                <th scope="col">CRUD</th>
            </tr>
        </thead>
        <tbody id="table_journal_body">
        </tbody>
    </table>
</div>