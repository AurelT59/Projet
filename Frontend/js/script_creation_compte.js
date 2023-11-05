$(document).ready(function () {

    //Initialisation des nomenclatures
    $.ajax({
        url: URL_START + 'Backend/nomenclature_utilisateurs.php',
        method: 'GET',
        dataType: 'json',
        success: function (data) {
            console.log(data);

            var contenu_select_sexes = "";
            var contenu_select_sports = "";

            //Gestion des sexes
            let tab_sexes = data.sexes;
            for (let i = 0; i < tab_sexes.length; i++) {
                contenu_select_sexes += "<option value=" + tab_sexes[i].ID_SEXE + ">" + tab_sexes[i].NOM + "</option>";
            }
            $("#inputSexe").html(contenu_select_sexes);

            //Gestion des pratiques sportives
            let tab_sports = data.sports;
            for (let i = 0; i < tab_sports.length; i++) {
                contenu_select_sports += "<option value='" + tab_sports[i].ID_SPORTIF + "'>" + tab_sports[i].NOM + "</option>";
            }
            $("#inputSport").html(contenu_select_sports);

        },
        error: function (error) {
            throwAlert('Erreur lors de la récupération des données : ', error);
            console.error('Erreur lors de la récupération des données : ', error);
        }
    })
})

$('#btnValider').on("click", function (e) {
    let identifiant = $("#inputLogin").val();
    let mdp = $("#inputMdp").val();
    let confirmmdp = $("#inputMdp2").val();
    let prenom = $("#inputPrenom").val();
    let nom = $("#inputNom").val();
    let sexe = $("#inputSexe").val();
    let age = $("#inputAge").val();
    let poids = $("#inputPoids").val();
    let taille = $("#inputTaille").val();
    let sport = $("#inputSport").val();

    if (mdp == confirmmdp) {
        var formData = {
            "identifiant": identifiant,
            "id_sportif": sport,
            "id_sexe": sexe,
            "mot_de_passe": mdp,
            "prenom": prenom,
            "nom": nom,
            "age": age,
            "poids": poids,
            "taille": taille
        }


        $.ajax({
            url: URL_START + 'Backend/utilisateurs.php',
            method: 'POST',
            data: JSON.stringify(formData),
            dataType: 'json',
            success: function (data) {
                document.cookie = "session=" + encodeURIComponent(JSON.stringify(formData));
                window.location.href = URL_START + 'Frontend/index.php?page=accueil';
            },
            error: function (error) {
                console.error('Erreur lors de l\'ajout des données : ', error);
            }
        })
    }
    else {
        $("#erreurMdp").css("display", "block")
        $("#inputMdp").css("border-color", "red")
        $("#inputMdp2").css("border-color", "red")
    }
})