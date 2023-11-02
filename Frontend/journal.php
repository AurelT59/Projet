<!-- FORMULAIRE POUR RENTRER UNE CONSOMMATION -->

<div class="box" id="box_form_conso">
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
        <button type="submit" class="btn btn-primary body-button">Valider</button>
    </form>
</div>

<!-- LISTE DES CONSOMMATIONS PRÉCÉDENTES -->

<div class="box" id="box_table_journal">
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
<script src="js/config.js"></script>
<script src="js/script_journal.js"></script>