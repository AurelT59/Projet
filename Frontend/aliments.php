<p>Bienvenue sur votre la page aliments</p>

<!-- FORMULAIRE POUR RENSEIGNER UN NOUVEL ALIMENT -->

<div id="box_form_conso">
    <h1>Ajout d'un nouvel aliment au catalogue</h1>
    <form>
        <div class="mb-3">
            <label class="form-label">Nom</label>
            <input type="text" class="form-control" id="inputAliment">
        </div>
        <button type="submit" class="btn btn-primary">Valider</button>
    </form>
</div>

<!-- LISTE DES ALIMENTS DÉJÀ DANS LA BDD -->

<div id="box_table_journal">
    <h1>Consulter le catalogue</h1>
    <table class="table" id="table_journal">
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

<script>
    let table = new DataTable('#table_aliments', {
        columnDefs: [{
                targets: 0,
                data: 'Nom'
            },
            {
                targets: 1,
                data: null,
                render: function(data, type, row) {
                    return '<button id="edit" onclick="onEditSubmit();">Éditer</button><button id="delete" onclick="onDeleteSubmit();">Supprimer</button>';
                }
            }
        ]
    });
</script>