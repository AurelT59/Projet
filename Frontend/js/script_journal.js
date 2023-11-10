//Fonction pour lancer une erreur
function throwAlert(text) {
    alert(text);
}

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

    var valeurDuCookie = JSON.parse(getCookieValue("session"));

    //Initialisation du tableau
    $.ajax({
        url: URL_START + 'Backend/journal.php?identifiant=' + valeurDuCookie.IDENTIFIANT,
        method: 'GET',
        dataType: 'json',
        success: function (data) {
            console.log(data);
            for (let i = 0; i < data.length; i++) {
                table.row.add({
                    "id_journal": data[i].ID_JOURNAL,
                    "date": data[i].DATE,
                    "aliment": data[i].produit,
                    "quantite": data[i].QUANTITE,
                }).draw();
            }
        },
        error: function (error) {
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

            //Options d'aliments
            for (let i = 0; i < data.length; i++) {
                contenu_select_aliment += "<option value=" + data[i].CODE + ">" + data[i].PRODUIT + " (1 portion = " + data[i].PORTION + "g)</option>";
            }
            $("#selectAliment").html(contenu_select_aliment);

            $("#selectAliment").html(contenu_select_aliment);

        },
        error: function (error) {
            console.error('Erreur lors de la récupération des données : ', error);
        }
    })

    //Ajout et modification d'une entrée
    //------------------------------------------------------------------------------------------------
    $('#btnValider').on("click", function (e) {

        let id_journal = $("#inputIdJournal").val();
        let date = $("#inputDate").val();
        let code = $("#selectAliment").val();
        let produit = $("#selectAliment option[value=" + code + "]").text();
        $('#messageConfirmation').html("");

        let quantite = $("#inputQuantite").val();

        var formData = {
            identifiant: valeurDuCookie.IDENTIFIANT,
            date: date,
            code: code,
            quantite: quantite,
            id_journal: id_journal
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
                        "aliment": produit,
                        "quantite": formData.quantite,
                        "id_journal": data.id_journal
                    }).draw();
                    $('#messageConfirmation').html("Ajout enregistré");
                },
                error: function (error) {
                    throwAlert('Erreur lors de l\'ajout des données : ' + error.status);
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
                        "aliment": produit,
                        "quantite": formData.quantite,
                        "id_journal": formData.id_journal
                    }).draw();
                    $('#messageConfirmation').html("Changements enregistrés");
                },
                error: function (error) {
                    throwAlert('Erreur lors de l\'ajout des données : ' + error.status);
                    console.error('Erreur lors de l\'ajout des données : ', error);
                }
            })
        }
    })
    //------------------------------------------------------------------------------------------------

    //Suppression d'une entrée
    //------------------------------------------------------------------------------------------------
    table.on('click', '#delete', function (e) {
        let row = table.row(e.target.closest('tr'));
        var formData = {
            id_journal: table.cell(row, 0).data(),
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
                throwAlert('Erreur lors de la suppression des données : ' + error.status);
                console.error('Erreur lors de la suppression des données : ', error);
            }
        })
    });
    //------------------------------------------------------------------------------------------------

    //Informations sur la modification d'un entrée du journal
    //------------------------------------------------------------------------------------------------
    table.on('click', '#edit', function (e) {
        function scrollToTop() {
            document.body.scrollTop = 0; // For Safari
            document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
        }
        scrollToTop();
        retourAjout();
        let row = table.row(e.target.closest('tr'));
        let id_journal = table.cell(row, 0).data()
        console.log(id_journal);

        $.ajax({
            url: URL_START + 'Backend/journal.php?id_journal=' + id_journal,
            method: 'GET',
            dataType: 'json',
            success: function (data) {
                console.log(data);

                $('#titre').html("Modification de l'entrée");
                $('#buttonReturn').html('<button class="btn btn-success" id="btnRAjout" onclick="retourAjout()">Retour à l\'ajout</button>');
                $('#btnValider').addClass("modif");

                //Infos générales de l'entrée
                $("#inputIdJournal").val(id_journal);
                $("#inputDate").val(data[0].DATE);
                $("#selectAliment").val(data[0].CODE);
                $("#inputQuantite").val(data[0].QUANTITE);

            },
            error: function (error) {
                throwAlert('Erreur lors de la récupération des données : ' + error.status);
                console.error('Erreur lors de la récupération des données : ', error);
            }
        })
    });
    //------------------------------------------------------------------------------------------------
});

function getCookieValue(cookieName) {
    var cookies = document.cookie.split(";");

    for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i].trim();

        if (cookie.indexOf(cookieName + "=") === 0) {
            return decodeURIComponent(cookie.substring(cookieName.length + 1, cookie.length));
        }
    }

    return null;
}

//Fonction pour revenir à l'ajout en mode modification
function retourAjout() {
    $('#titre').html("Ajout d'une nouvelle entrée au journal");
    $('#buttonReturn').html('');
    $('#btnValider').removeClass("modif");

    //Reset infos générales aliment
    $("#selectAliment").val("");
    $("#inputQuantite").val("");
    $("#inputDate").val("");
}