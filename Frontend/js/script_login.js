//Vérification du mot de passe
$('#btnValider').on("click", function (e) {
    let identifiant = $("#inputLogin").val();
    let mdpSaisi = $("#inputMdp").val();

    $.ajax({
        url: URL_START + 'Backend/utilisateurs.php?identifiant=' + identifiant,
        method: 'GET',
        dataType: 'json',
        success: function (data) {
            console.log(data);
            if (password_verify($mdpSaisi, data.MOT_DE_PASSE)) {
                // Le mot de passe est correct
                console.log('Le mot de passe est correct');
            } else {
                // Le mot de passe est incorrect
                console.log('Le mot de passe est incorrect');
            }
        },
        error: function (error) {
            console.error('Erreur lors de la récupération des données : ', error);
        }
    })
})