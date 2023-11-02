//Vérification du mot de passe
$('#btnValider').on("click", function (e) {
    let identifiant = $("#inputLogin").val();

    $.ajax({
        url: URL_START + 'Backend/utilisateurs.php?identifiant=' + identifiant,
        method: 'GET',
        dataType: 'json',
        success: function (data) {
            console.log(data);
        },
        error: function (error) {
            console.error('Erreur lors de la récupération des données : ', error);
        }
    })
})