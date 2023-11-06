<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

require_once('init_pdo.php');

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':

        if (isset($_GET['identifiant'])) {
            $data = "";

            $request = $pdo->prepare("SELECT journal.*, aliments.produit FROM journal JOIN aliments ON aliments.CODE=journal.code WHERE IDENTIFIANT = '" . $_GET['identifiant'] . "'");
            $request->execute();

            checkAndResponse($request, $data);
            break;
        } else if (isset($_GET['id_journal'])) {
            $data = "";

            $request = $pdo->prepare("SELECT journal.*, aliments.produit FROM journal JOIN aliments ON aliments.CODE=journal.code WHERE ID_JOURNAL = '" . $_GET['id_journal'] . "'");
            $request->execute();

            checkAndResponse($request, $data);
            break;
        }

    case 'POST':

        $data = json_decode(file_get_contents("php://input"), true);

        $request = $pdo->exec(
            "INSERT INTO `journal` (`code`, `identifiant`, `quantite`, `date`)
            VALUES ('" . $data['code'] . "','" . $data['identifiant'] . "','" . $data['quantite'] . "','" . $data['date'] . "')"
        );



        checkAndResponse($request, $data);
        break;

    case 'PUT':

        $data = json_decode(file_get_contents("php://input"), true);
        $request = $pdo->exec("UPDATE journal SET code = '" . $data['code'] . "', quantite = " . $data['quantite'] . ", date = '" . $data['date'] . "' WHERE id_journal = '" . $data['id_journal'] . "'");
        checkAndResponse($request, $data);
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"), true);

        $request = $pdo->exec("DELETE FROM `journal` WHERE `id_journal` = '" . $data['id_journal'] . "'");

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
                echo json_encode(array('id_journal' => $data['id_journal']));
            }
        }
    }
}
