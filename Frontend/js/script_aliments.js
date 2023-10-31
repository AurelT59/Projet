function gestion_null($val, $str) {
    if ($val != null) {
        return $val + $str
    }
    else {
        return ""
    }
}

$(document).ready(function () {
    //Initialisation de la table des aliments
    let table = new DataTable('#table_aliments', {
        columnDefs: [{
            targets: 0,
            data: 'Code'
        },
        {
            targets: 1,
            data: 'Nom'
        },
        {
            targets: 2,
            data: 'Quantite'
        },
        {
            targets: 3,
            data: 'Portion'
        },
        {
            targets: 4,
            data: 'Marque'
        },
        {
            targets: 5,
            data: 'Nutriscore'
        },
        {
            targets: 6,
            data: null,
            render: function (data, type, row) {
                return '<button id="edit" onclick="onEditSubmit();">Éditer</button><button id="delete" onclick="onDeleteSubmit();">Supprimer</button>';
            }
        }
        ]
    });

    //Initialisation du tableau
    $.ajax({
        url: 'http://localhost/Projet/Projet/Backend/aliments.php',
        method: 'GET',
        dataType: 'json',
        success: function (data) {
            console.log(data);
            for (let i = 0; i < data.length; i++) {
                table.row.add({
                    "Code": data[i].CODE,
                    "Nom": data[i].PRODUIT,
                    "Quantite": gestion_null(data[i].QUANTITE, " g"),
                    "Portion": gestion_null(data[i].PORTION, " g"),
                    "Marque": data[i].MARQUE,
                    "Nutriscore": data[i].NUTRISCORE_GRADE,
                }).draw();
            }
        },
        error: function (error) {
            console.error('Erreur lors de la récupération des données : ', error);
        }
    })
});






//Gestion de l'interface ajouter/supprimer pour les ingrédients
let ligneCount = 1;

function ajouterLigne() {
    ligneCount++;

    const table = document.getElementById("table");
    const newRow = table.insertRow(table.rows.length);

    const cell1 = newRow.insertCell(0);
    const cell2 = newRow.insertCell(1);
    const cell3 = newRow.insertCell(2);

    cell1.innerHTML = `
        <input type="text" class="form-control input-taille" placeholder="Ingrédient" id="inputIngredient${ligneCount}">
`;
    cell2.innerHTML = `
        <input type="text" class="form-control input-taille" placeholder="Pourcentage" id="inputPourcentage${ligneCount}">
`;

    cell3.innerHTML = `
    <button class="btn btn-danger" onclick="supprimerLigne(this)">Supprimer</button>
`;
}

function supprimerLigne(button) {
    const row = button.parentNode.parentNode;
    row.parentNode.removeChild(row);
}



//Gestion de l'interface ajouter/supprimer pour les nutriments
let ligneCountNutriment = 1;

function ajouterLigneNutriment() {
    ligneCountNutriment++;

    const table = document.getElementById("tableNutriment");
    const newRow = table.insertRow(table.rows.length);

    const cell1 = newRow.insertCell(0);
    const cell2 = newRow.insertCell(1);
    const cell3 = newRow.insertCell(2);
    const cell4 = newRow.insertCell(3);
    const cell5 = newRow.insertCell(4);

    cell1.innerHTML = `
    <select class="form-select input-taille" placeholder="Nutriment" id="inputNutriment${ligneCount}">
                            <option>Calcium</option>
                            <option>Protéines</option>
                            <option>Glucides</option>
                        </select>
`;
    cell2.innerHTML = `
    <input type="text" class="form-control input-taille" placeholder="Quantité pour 100g" id="inputQuantite_100${ligneCount}">
`;

    cell3.innerHTML = `
    <input type="text" class="form-control input-taille" placeholder="Quantité pour une portion" id="inputQuantite_portion${ligneCount}">
`;
    cell4.innerHTML = `
    <input type="text" class="form-control input-taille" placeholder="Unité des quantités" id="inputQuantite_unite${ligneCount}">
`;
    cell5.innerHTML = `
    <button class="btn btn-danger" onclick="supprimerLigne(this)">Supprimer</button>
`;
}

function supprimerLigneNutriment(button) {
    const row = button.parentNode.parentNode;
    row.parentNode.removeChild(row);
}