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
                return '<button class="btn btn-primary" id="edit">Éditer</button><button class="btn btn-danger" id="delete">Supprimer</button>';
            }
        }
        ]
    });

    //Initialisation du tableau
    $.ajax({
        url: URL_START + 'Backend/aliments.php',
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
            throwAlert('Erreur lors de la récupération des données : ', error);
            console.error('Erreur lors de la récupération des données : ', error);
        }
    })

    //Initialisation des nomenclatures

    $.ajax({
        url: URL_START + 'Backend/nomenclature.php',
        method: 'GET',
        dataType: 'json',
        async: false,
        success: function (data) {
            console.log(data);

            var contenu_select_nutriments = "";
            var contenu_select_ingredients = "";
            var contenu_categories = "";

            //Gestion des nutriments
            let tab_nutriments = data.nutriments;
            for (let i = 0; i < tab_nutriments.length; i++) {
                contenu_select_nutriments += "<option value=" + tab_nutriments[i].ID_NUTRIMENT + ">" + tab_nutriments[i].NOM + "</option>";
            }
            $("#inputNutriment0").html(contenu_select_nutriments);
            $("#inputNutriment1").html(contenu_select_nutriments);

            //Gestion des ingrédients
            let tab_ingredients = data.ingredients;
            for (let i = 0; i < tab_ingredients.length; i++) {
                contenu_select_ingredients += "<option value='" + tab_ingredients[i].ID_INGREDIENT + "'>" + tab_ingredients[i].NOM + "</option>";
            }
            $("#options0").html(contenu_select_ingredients);
            $("#options1").html(contenu_select_ingredients);

            //Gestion des catégories
            let tab_categories = data.categories;
            contenu_categories += '<div class="row"><div class="col-6">';
            for (let i = 0; i < tab_categories.length; i++) {
                contenu_categories += "<input type='checkbox' value=" + tab_categories[i].ID_CATEGORIES + "> " + tab_categories[i].NOM + "<br>";
                if (i == tab_categories.length / 2 + 1) {
                    contenu_categories += '</div><div class="col-6">';
                }
            }
            contenu_categories += '</div></div>';

            $("#inputCategories").html(contenu_categories);

        },
        error: function (error) {
            throwAlert('Erreur lors de la récupération des données : ', error);
            console.error('Erreur lors de la récupération des données : ', error);
        }
    })

    //Ajout et modification d'un aliment
    //------------------------------------------------------------------------------------------------
    $('#btnValider').on("click", function (e) {
        let code = $("#inputCode").val();
        let nom = $("#inputAliment").val();
        let quantite = $("#inputQuantite").val();
        let portion = $("#inputPortion").val();
        let marque = $("#inputMarque").val();
        let nutriscore_grade = $("#inputNutriscore").val();

        // Pour composition
        var tableIng = document.getElementById('table');
        var rows = tableIng.getElementsByTagName('tr');
        var str_composition = Array();

        function get_tab_compo(index) {
            var row = rows[index];
            var inputs = row.getElementsByTagName('input');

            var ingredientValue = inputs[0].value;
            var pourcentageValue = inputs[1].value;

            //ATTENTION : LES ID SONT POUR L'INSTANT LE NOM
            str_composition.push(JSON.parse('{"id_ingredient":' + ingredientValue + ',"pourcentage":' + pourcentageValue + '}'))
        }


        for (var i = 0; i < rows.length; i++) {
            get_tab_compo(i);
        }

        // Pour composition_nutritive
        var tableNut = document.getElementById('tableNutriment');
        var rows = tableNut.getElementsByTagName('tr');
        var str_composition_nutritive = Array();

        function get_tab_compo_nut(index) {
            var row = rows[index];
            var inputs = row.getElementsByTagName('input');
            var selects = row.getElementsByClassName('input-nutriment');

            var nutrimentValue = selects[0].value;
            var valeur100Value = inputs[0].value;
            var valeurportionValue = inputs[1].value;
            var uniteValue = inputs[2].value;

            str_composition_nutritive.push(JSON.parse('{"id_nutriment":' + nutrimentValue +
                ',"valeur_100":' + valeur100Value +
                ',"valeur_portion":' + valeurportionValue +
                ',"unite":"' + uniteValue +
                '"}'))
        }


        for (var i = 0; i < rows.length; i++) {
            get_tab_compo_nut(i);
        }

        //Pour les labels
        var divInputCategories = document.getElementById('inputCategories');
        var checkboxes = divInputCategories.querySelectorAll('input[type="checkbox"]');
        var str_labels = Array();

        for (var i = 0; i < checkboxes.length; i++) {
            if (checkboxes[i].checked) {
                str_labels.push(JSON.parse('{"id_categories":' + checkboxes[i].value + '}'))
            }
        }




        var formData = {
            code: code,
            produit: nom,
            quantite: quantite,
            portion: portion,
            marque: marque,
            nutriscore_grade: nutriscore_grade,
            composition: str_composition,
            labels: str_labels,
            composition_nutritive: str_composition_nutritive
        }
        console.log(formData);

        if (!($('#btnValider').hasClass("modif"))) {
            $.ajax({
                url: URL_START + 'Backend/aliments.php',
                method: 'POST',
                data: JSON.stringify(formData),
                dataType: 'json',
                success: function (data) {
                    table.row.add({
                        "Code": data.code,
                        "Nom": formData.produit,
                        "Quantite": gestion_null(formData.quantite, " g"),
                        "Portion": gestion_null(formData.portion, " g"),
                        "Marque": formData.marque,
                        "Nutriscore": formData.nutriscore_grade
                    }).draw();
                },
                error: function (error) {
                    throwAlert('Erreur lors de l\'ajout des données : ' + error);
                    console.error('Erreur lors de l\'ajout des données : ', error);
                }
            })
        }
        else {
            $.ajax({
                url: URL_START + 'Backend/aliments.php',
                method: 'PUT',
                data: JSON.stringify(formData),
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    /*
                    table.row.add({
                        "Code": data.code,
                        "Nom": formData.produit,
                        "Quantite": gestion_null(formData.quantite, " g"),
                        "Portion": gestion_null(formData.portion, " g"),
                        "Marque": formData.marque,
                        "Nutriscore": formData.nutriscore_grade
                    }).draw();*/
                },
                error: function (error) {
                    throwAlert('Erreur lors de l\'ajout des données : ' + error);
                    console.error('Erreur lors de l\'ajout des données : ', error);
                }
            })
        }
    })
    //------------------------------------------------------------------------------------------------


    //Suppression d'un aliment
    //------------------------------------------------------------------------------------------------
    table.on('click', '#delete', function (e) {
        let row = table.row(e.target.closest('tr'));
        var formData = {
            code: table.cell(row, 0).data(),
        }

        $.ajax({
            url: URL_START + 'Backend/aliments.php',
            method: 'DELETE',
            data: JSON.stringify(formData),
            dataType: 'json',
            success: function (data) {
                row.remove().draw();
            },
            error: function (error) {
                throwAlert('Erreur lors de la suppression des données : ' + error);
                console.error('Erreur lors de la suppression des données : ', error);
            }
        })
    });
    //------------------------------------------------------------------------------------------------


    //Informations sur la modification d'un aliment
    //------------------------------------------------------------------------------------------------
    table.on('click', '#edit', function (e) {
        retourAjout();
        let row = table.row(e.target.closest('tr'));

        $.ajax({
            url: URL_START + 'Backend/aliments.php?code=' + table.cell(row, 0).data(),
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                console.log(data);

                $('#titre').html("Modification de l'aliment");
                $('#buttonReturn').html('<button class="btn btn-success" id="btnRAjout" onclick="retourAjout()">Retour à l\'ajout</button>');
                $('#btnValider').addClass("modif");

                //Infos générales de l'aliment
                let data_aliment = data.aliment[0];

                $("#inputCode").val(data_aliment.CODE);
                $("#inputAliment").val(data_aliment.PRODUIT);
                $("#inputQuantite").val(data_aliment.QUANTITE);
                $("#inputPortion").val(data_aliment.PORTION);
                $("#inputMarque").val(data_aliment.MARQUE);
                $("#inputNutriscore").val(data_aliment.NUTRISCORE_GRADE);

                //Pour les catégories
                let data_categories = data.categories;

                var divInputCategories = document.getElementById('inputCategories');
                var checkboxes = divInputCategories.querySelectorAll('input[type="checkbox"]');

                for (var i = 0; i < checkboxes.length; i++) {
                    for (var j = 0; j < data_categories.length; j++) {
                        if (checkboxes[i].value == data_categories[j].ID_CATEGORIES) {
                            checkboxes[i].checked = true;
                        }
                    }
                }

                //Pour les ingrédients
                let data_ingredients = data.ingredients;

                supprimerLigne(document.querySelectorAll('.btnSuppr')[0]);
                for (var i = 0; i < data_ingredients.length; i++) {
                    ajouterLigne(data_ingredients[i].ID_INGREDIENT, data_ingredients[i].POURCENTAGE);
                }

                //Pour les nutriments
                let data_nutriments = data.nutriments;

                supprimerLigneNutriment(document.querySelectorAll('.btnSupprNut')[0]);
                for (var i = 0; i < data_nutriments.length; i++) {
                    ajouterLigneNutriment(data_nutriments[i].ID_NUTRIMENT, data_nutriments[i].VALEUR_100, data_nutriments[i].VALEUR_PORTION, data_nutriments[i].UNITE);
                }

            },
            error: function (error) {
                throwAlert('Erreur lors de la récupération des données : ' + error);
                console.error('Erreur lors de la récupération des données : ', error);
            }
        })
    });
    //------------------------------------------------------------------------------------------------
});




//Fonction pour lancer une erreur
function throwAlert(text) {
    var alertElement = document.getElementById("myAlert");
    var msgError = document.getElementById("msgError");

    alertElement.style.display = "block";
    msgError.innerHTML = text;
    alertElement.classList.add("show");

    setTimeout(function () {
        alertElement.style.display = "none";
        alertElement.classList.remove("show");
    }, 5000);
}


//Fonction pour revenir à l'ajout en mode modification
function retourAjout() {
    $('#titre').html("Ajout d'un nouvel aliment au catalogue");
    $('#buttonReturn').html('');
    $('#btnValider').removeClass("modif");

    //Reset infos générales aliment
    $("#inputCode").val("");
    $("#inputAliment").val("");
    $("#inputQuantite").val("");
    $("#inputPortion").val("");
    $("#inputMarque").val("");
    $("#inputNutriscore").val("");

    //Reset des catégories
    var divInputCategories = document.getElementById('inputCategories');
    var checkboxes = divInputCategories.querySelectorAll('input[type="checkbox"]');

    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = false;
    }

    //Reset des ingrédients
    let list_btnSuppr = document.querySelectorAll('.btnSuppr');
    for (var i = 0; i < list_btnSuppr.length; i++) {
        supprimerLigne(list_btnSuppr[i]);
    }
    ajouterLigne("", "");

    //Reset des nutriments
    let list_btnSupprNut = document.querySelectorAll('.btnSupprNut');
    for (var i = 0; i < list_btnSupprNut.length; i++) {
        supprimerLigneNutriment(list_btnSupprNut[i]);
    }
    ajouterLigneNutriment("", "", "", "");
}



//Gestion de l'interface ajouter/supprimer pour les ingrédients
//------------------------------------------------------------------------------------------------
let ligneCount = 1;

function ajouterLigne(ingredient, pourcentage) {
    ligneCount++;

    const tableAj = document.getElementById("table");
    const newRow = tableAj.insertRow(tableAj.rows.length);

    const cell1 = newRow.insertCell(0);
    const cell2 = newRow.insertCell(1);
    const cell3 = newRow.insertCell(2);

    cell1.innerHTML = `
<input type="text" class="form-control input-taille" placeholder="Ingrédient" id="inputIngredient${ligneCount}" list="options${ligneCount}" value=${ingredient}>
<datalist id="options${ligneCount}">
`+ $("#options0").html() + `
                </datalist>
`;
    cell2.innerHTML = `
<input type="text" class="form-control input-taille" placeholder="Pourcentage" id="inputPourcentage${ligneCount}" value=${pourcentage}>
`;

    cell3.innerHTML = `
<button class="btn btn-danger btnSuppr" onclick="supprimerLigne(this)">Supprimer</button>
`;
}

function supprimerLigne(button) {
    const row = button.parentNode.parentNode;
    row.parentNode.removeChild(row);
}
//------------------------------------------------------------------------------------------------



//Gestion de l'interface ajouter/supprimer pour les nutriments
//------------------------------------------------------------------------------------------------
let ligneCountNutriment = 1;

function ajouterLigneNutriment(nutriment, quantite_100, quantite_portion, unite) {
    ligneCountNutriment++;

    const tableAjNut = document.getElementById("tableNutriment");
    const newRow = tableAjNut.insertRow(tableAjNut.rows.length);

    const cell1 = newRow.insertCell(0);
    const cell2 = newRow.insertCell(1);
    const cell3 = newRow.insertCell(2);
    const cell4 = newRow.insertCell(3);
    const cell5 = newRow.insertCell(4);

    cell1.innerHTML = `
<select class="form-select input-taille input-nutriment" placeholder="Nutriment" id="inputNutriment${ligneCountNutriment}">
`+ $("#inputNutriment0").html() + `
                </select>
`;

    var selectElement = document.getElementById("inputNutriment" + ligneCountNutriment);
    for (var i = 0; i < selectElement.options.length; i++) {
        if (selectElement.options[i].value === nutriment) {
            selectElement.selectedIndex = i;
            break;
        }
    }

    cell2.innerHTML = `
<input type="text" class="form-control input-taille" placeholder="Quantité pour 100g" id="inputQuantite_100${ligneCountNutriment}" value=${quantite_100}>
`;

    cell3.innerHTML = `
<input type="text" class="form-control input-taille" placeholder="Quantité pour une portion" id="inputQuantite_portion${ligneCountNutriment}" value=${quantite_portion}>
`;
    cell4.innerHTML = `
<input type="text" class="form-control input-taille" placeholder="Unité des quantités" id="inputQuantite_unite${ligneCountNutriment}" value=${unite}>
`;
    cell5.innerHTML = `
<button class="btn btn-danger btnSupprNut" onclick="supprimerLigne(this)">Supprimer</button>
`;
}

function supprimerLigneNutriment(button) {
    const row = button.parentNode.parentNode;
    row.parentNode.removeChild(row);
}
//------------------------------------------------------------------------------------------------
