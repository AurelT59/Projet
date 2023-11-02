<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

require_once('init_pdo.php');

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':

        $data = $data = json_decode(file_get_contents("php://input"), true);

        $request = $pdo->prepare("SELECT * FROM utilisateurs WHERE identifiant = '" . $data['identifiant'] . "'");
        $request->execute();
        $result = $request->fetchAll(PDO::FETCH_OBJ);

        checkAndResponse($request, $result, $data);
        break;

    case 'POST':

        $data = json_decode(file_get_contents("php://input"), true);

        $request = $pdo->prepare(
            "INSERT INTO `utilisateurs` (`identifiant`, `id_sportif`, `id_sexe`, `mot_de_passe`, `prenom`, `nom`, `age`, 'poids', 'taille')
            VALUES ('" . $data['identifiant'] . "','" . $data['id_sportif'] . "','" . $data['id_sexe'] . "','" . $data['mot_de_passe'] . "','" . $data['prenom'] . "','" . $data['nom'] . "','" . $data['age'] . "','" . $data['poids'] . "','" . $data['taille'] . "')"
        );
        $request->execute();
        $result = $request->fetchAll(PDO::FETCH_OBJ);

        checkAndResponse($request, $result, $data);
        break;

    case 'PUT':

        $data = json_decode(file_get_contents("php://input"), true);

        $request = $pdo->prepare("UPDATE utilisateurs SET id_sportif = '" . $data['id_sportif'] . "', id_sexe = '" . $data['id_sexe'] . "', mot_de_passe = '" . $data['mot_de_passe'] . "', prenom = '" . $data['prenom'] . "', nom = '" . $data['nom'] . "', age = '" . $data['age'] . "', poids = '" . $data['poids'] . "', taille = '" . $data['taille'] . "' WHERE identifiant = " . $data['identifiant']);
        $request->execute();
        $result = $request->fetchAll(PDO::FETCH_OBJ);

        checkAndResponse($request, $result, $data);
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"), true);

        $request = $pdo->prepare("DELETE FROM `utilisateurs` WHERE `identifiant` = " . $data['identifiant']);
        $request->execute();
        $result = $request->fetchAll(PDO::FETCH_OBJ);

        checkAndResponse($request, $result, $data);
        break;

    default:
        http_response_code(405);
        echo json_encode(array('message' => 'Méthode non autorisée'));
        break;
}


// gestion de la réponse à la requête
function checkAndResponse($request, $result, $data)
{
    if (empty($result) & $_SERVER['REQUEST_METHOD'] != 'POST') {
        // Aucune donnée trouvée, renvoyer un statut 404 - Not Found
        http_response_code(404);
        echo json_encode(array('message' => "Aucun utilisateur trouvé."));
    } else if ($request) {
        // Les données ont été récupérées avec succès, renvoyer un statut 200 - OK
        http_response_code(200);
        if ($_SERVER['REQUEST_METHOD'] == 'GET') {
            echo json_encode($result);
        } else {
            echo json_encode(array('identifiant' => $data['identifiant']));
        }
    } else {
        // Erreur de la requête SQL, renvoyer un statut 500 - Internal Server Error
        http_response_code(500);
        echo json_encode(array('message' => "Erreur interne du serveur."));
    }
}
