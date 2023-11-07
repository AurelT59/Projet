$(document).ready(function () {
    let table = new DataTable('#table_journal', {
        columnDefs: [{
            targets: 0,
            data: 'id_journal',
            visible: false
        },
        {
            targets: 1,
            data: 'date'
        },
        {
            targets: 2,
            data: 'aliment'
        },
        {
            targets: 3,
            data: 'quantite'
        },
        {
            targets: 4,
            data: null,
            render: function (data, type, row) {
                return '<button class="btn btn-primary" id="edit">Éditer</button><button class="btn btn-danger" id="delete">Supprimer</button>';
            }
        }
        ]
    });

    //Initialisation du tableau
    $.ajax({
        url: URL_START + 'Backend/journal.php',
        method: 'GET',
        dataType: 'json',
        success: function (data) {
            console.log(data);
            for (let i = 0; i < data.length; i++) {
                table.row.add({
                    "id_journal": data[i].ID_JOURNAL,
                    "date": data[i].DATE,
                    "aliment": data[i].ALIMENT,
                    "quantite": data[i].QUANTITE,
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
        url: URL_START + 'Backend/aliments.php',
        method: 'GET',
        dataType: 'json',
        success: function (data) {
            console.log(data);

            var contenu_select_aliment = "<option selected>Option</option>";

            //Gestion des nutriments
            for (let i = 0; i < data.length; i++) {
                contenu_select_aliments += "<option value=" + data[i].CODE + ">" + data[i].PRODUIT + "</option>";
            }
            $("#selectAliment").html(contenu_select_aliment);

        },
        error: function (error) {
            // throwAlert('Erreur lors de la récupération des données : ', error);
            console.error('Erreur lors de la récupération des données : ', error);
        }
    })

    //Ajout et modification d'un aliment
    //------------------------------------------------------------------------------------------------
    $('#btnValider').on("click", function (e) {
        let date = $("#inputDate").val();
        let aliment = $("#selectAliment").val();
        let quantite = $("#inputQuantite").val();

        var formData = {
            id_journal: id_journal,
            date: date,
            aliment: aliment,
            quantite: quantite,
        }
        console.log(formData);

        if (!($('#btnValider').hasClass("modif"))) {
            $.ajax({
                url: URL_START + 'Backend/journal.php',
                method: 'POST',
                data: JSON.stringify(formData),
                dataType: 'json',
                success: function (data) {
                    table.row.add({
                        "date": formData.date,
                        "aliment": formData.aliment,
                        "quantite": formData.quantite,
                        "id_journal": formData.id_journal
                    }).draw();
                },
                error: function (error) {
                    throwAlert('Erreur lors de l\'ajout des données : ' + error);
                    console.error('Erreur lors de l\'ajout des données : ', error);
                }
            })
        }
        else {
            let firstColumnData = table.column(0).data().toArray();
            let row = table.row(0);
            let numRows = table.rows().toArray()[0];

            for (let i = 0; i < firstColumnData.length; i++) {
                let value = firstColumnData[i];
                if (value == id_journal) {
                    row = table.row(numRows[i]);
                    break;
                }
            }

            $.ajax({
                url: URL_START + 'Backend/journal.php',
                method: 'PUT',
                data: JSON.stringify(formData),
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    row.data({
                        "date": formData.date,
                        "aliment": formData.aliment,
                        "quantite": formData.quantite,
                        "id_journal": formData.id_journal
                    }).draw();
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
            url: URL_START + 'Backend/journal.php',
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

