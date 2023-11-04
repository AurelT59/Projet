<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

require_once('init_pdo.php');

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':

        $data = json_decode(file_get_contents("php://input"), true);

        $request = $pdo->prepare("SELECT * FROM utilisateurs WHERE IDENTIFIANT = '" . $data['identifiant'] . "'");
        $request->execute();

        checkAndResponse($request, $data);
        break;

    case 'POST':

        $data = json_decode(file_get_contents("php://input"), true);

        $request = $pdo->exec(
            "INSERT INTO `utilisateurs` (`identifiant`, `id_sportif`, `id_sexe`, `mot_de_passe`, `prenom`, `nom`, `age`, `poids`, `taille`)
            VALUES ('" . $data['identifiant'] . "'," . $data['id_sportif'] . "," . $data['id_sexe'] . ",'" . $data['mot_de_passe'] . "','" . $data['prenom'] . "','" . $data['nom'] . "'," . $data['age'] . "," . $data['poids'] . "," . $data['taille'] . ")"
        );



        checkAndResponse($request, $data);
        break;

    case 'PUT':

        $data = json_decode(file_get_contents("php://input"), true);

        $request = $pdo->exec("UPDATE utilisateurs SET identifiant =  '" . $data['identifiant_nouveau'] . "', id_sportif = " . $data['id_sportif'] . ", id_sexe = " . $data['id_sexe'] . ", mot_de_passe = '" . $data['mot_de_passe'] . "', prenom = '" . $data['prenom'] . "', nom = '" . $data['nom'] . "', age = " . $data['age'] . ", poids = " . $data['poids'] . ", taille = " . $data['taille'] . " WHERE identifiant = '" . $data['identifiant_actuel'] . "'");

        checkAndResponse($request, $data);
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"), true);

        $request = $pdo->exec("DELETE FROM `utilisateurs` WHERE `identifiant` = '" . $data['identifiant'] . "'");

        checkAndResponse($request, $data);
        break;

    default:
        http_response_code(405);
        echo json_encode(array('message' => 'Méthode non autorisée'));
        break;
}


// gestion de la réponse à la requête
function checkAndResponse($request, $data)
{
    if (is_bool($request)) {

        // Erreur de la requête SQL, renvoyer un statut 500 - Internal Server Error
        http_response_code(500);
        echo json_encode(array('message' => "Echec de la requête SQL : Erreur interne au serveur."));
    } else {

        if ($_SERVER['REQUEST_METHOD'] == 'GET') {
            $result = $request->fetchAll(PDO::FETCH_OBJ);
        }

        if ((empty($result) && $_SERVER['REQUEST_METHOD'] == 'GET') || ($request == 0)) {

            // Aucune donnée trouvée, renvoyer un statut 404 - Not Found
            http_response_code(404);
            echo json_encode(array('message' => "Aucun utilisateur trouvé."));
        } else {

            // Les données ont été récupérées avec succès, renvoyer un statut 200 - OK
            http_response_code(200);

            if ($_SERVER['REQUEST_METHOD'] == 'GET') {
                echo json_encode($result);
            } else {
                if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
                    echo json_encode(array('identifiant' => $data['identifiant_nouveau']));
                } else {
                    echo json_encode(array('identifiant' => $data['identifiant']));
                }
            }
        }
    }
}
