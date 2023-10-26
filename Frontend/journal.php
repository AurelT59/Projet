<p>Bienvenue sur votre journal</p>

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
            <select class="form-select">
                <option selected>Choose from the list</option>
                <option value="1">Kebab</option>
                <option value="2">Burger</option>
                <option value="3">Pizza</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Valider</button>
    </form>
</div>

<!-- LISTE DES CONSOMMATIONS PRÉCÉDENTES -->

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

<script>
    let table = new DataTable('#table_journal', {
        columnDefs: [{
                targets: 0,
                data: 'date'
            },
            {
                targets: 1,
                data: 'aliment'
            },
            {
                targets: 2,
                data: null,
                render: function(data, type, row) {
                    return '<button id="edit" onclick="onEditSubmit();">Éditer</button><button id="delete" onclick="onDeleteSubmit();">Supprimer</button>';
                }
            }
        ]
    });
</script>