//Fonction pour lancer une erreur
function throwAlert(text) {
    alert(text);
}

//Vérification du mot de passe
$('#btnValider').on("click", function (e) {
    let identifiant = $("#inputLogin").val();
    let mdpSaisi = $("#inputMdp").val();

    $.ajax({
        url: URL_START + 'Backend/utilisateurs.php?identifiant=' + identifiant + '&mdpSaisi=' + mdpSaisi,
        method: 'GET',
        success: function (data) {
            console.log(data);
            window.location.href = URL_START + 'Frontend/index.php?page=accueil';
        },
        error: function (error) {
            throwAlert('Erreur lors de la récupération des données : ', error.status);
            console.error('Erreur lors de la récupération des données : ', error);
        }
    })
})