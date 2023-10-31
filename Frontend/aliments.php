<!-- FORMULAIRE POUR RENSEIGNER UN NOUVEL ALIMENT -->
<div class="box" id="box_form_conso">
    <h1>Ajout d'un nouvel aliment au catalogue</h1>
    <form>
        <div class="row">
            <div class="col-6">
                <label class="form-label">Nom</label>
                <input type="text" class="form-control" id="inputAliment">
                <div class="form-label">Quantite</div>
                <input type="text" class="form-control" id="inputQuantite">
                <div class="form-label">Portion</div>
                <input type="text" class="form-control" id="inputPortion">
            </div>
            <div class="col-6">
                <div class="form-label">Marque</div>
                <input type="text" class="form-control" id="inputMarque">
                <label class="form-label">Nutriscore</label>
                <input type="text" class="form-control" id="inputNutriscore">
                <label class="form-label">Catégories</label>
                <select class="form-control" id="inputCategories" multiple>
                    <option class="selectable" value="1">Légume</option>
                    <option class="selectable" value="2">Fruit</option>
                    <option class="selectable" value="3">Viande</option>
                </select>
            </div>
        </div>
        <div class="encadre">
            <table id="table">
                <tr>
                    <td>
                        <input type="text" class="form-control input-taille" placeholder="Ingrédient" id="inputIngredient1">
                    </td>
                    <td>
                        <input type="text" class="form-control input-taille" placeholder="Pourcentage" id="inputPourcentage1">
                    </td>
                    <td>
                        <button class="btn btn-danger" onclick="supprimerLigne(this)">Supprimer</button>
                    </td>
                </tr>
            </table>
            <input type="button" class="btn btn-primary" id="inputAjoutIng" onclick="ajouterLigne()" value="Ajouter une ligne">
        </div>
        <div class="encadre">
            <table id="tableNutriment">
                <tr>
                    <td>
                        <input type="text" class="form-control input-taille" placeholder="Nutriment" id="inputNutriment1">
                    </td>
                    <td>
                        <input type="text" class="form-control input-taille" placeholder="Quantité pour 100g" id="inputQuantite_1001">
                    </td>
                    <td>
                        <input type="text" class="form-control input-taille" placeholder="Quantité pour une portion" id="inputQuantite_portion1">
                    </td>
                    <td>
                        <input type="text" class="form-control input-taille" placeholder="Unité des quantités" id="inputQuantite_unite1">
                    </td>
                    <td>
                        <button class="btn btn-danger" onclick="supprimerLigne(this)">Supprimer</button>
                    </td>
                </tr>
            </table>
            <input type="button" class="btn btn-primary" id="inputAjoutNut" onclick="ajouterLigneNutriment()" value="Ajouter une ligne">
        </div>
        <button type="submit" class="btn btn-success body-button">Valider</button>
    </form>
</div>

<!-- LISTE DES ALIMENTS DÉJÀ DANS LA BDD -->

<div class="box" id="box_table_journal">
    <h1>Consulter le catalogue</h1>
    <table class="table" id="table_aliments">
        <thead>
            <tr>
                <th scope="col">Code</th>
                <th scope="col">Nom</th>
                <th scope="col">Quantité</th>
                <th scope="col">Portion</th>
                <th scope="col">Marque</th>
                <th scope="col">Nutriscore</th>
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