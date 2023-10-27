<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");

require_once('init_pdo.php');

switch ($_SERVER['REQUEST_METHOD']) {
    case 'GET':

        $data = "";

        $request = $pdo->prepare("SELECT * FROM utilisateurs");
        $request->execute();
        $result = $request->fetchAll(PDO::FETCH_OBJ);

        checkAndResponse($request, $result, $data);
        break;

    case 'POST':

        $data = json_decode(file_get_contents("php://input"), true);

        $request = $pdo->prepare(
            "INSERT INTO `aliments` (`code`, `produit`, `quantite`, `portion`, `marque`, `energy`, `energy_unit`, `nutriscore_grade`)
            VALUES ('" . $data['code'] . "','" . $data['produit'] . "','" . $data['quantite'] . "','" . $data['portion'] . "','" . $data['marque'] . "','" . $data['energy'] . "','" . $data['energy_unit'] . "','" . $data['nutriscore_grade'] . "')"
        );
        $request->execute();
        $result = $request->fetchAll(PDO::FETCH_OBJ);

        checkAndResponse($request, $result, $data);
        break;

    case 'PUT':

        $data = json_decode(file_get_contents("php://input"), true);

        $request = $pdo->prepare("UPDATE users SET name = '" . $data['name'] . "', email = '" . $data['mail'] . "' WHERE id = " . $data['id']);
        $request->execute();
        $result = $request->fetchAll(PDO::FETCH_OBJ);

        checkAndResponse($request, $result, $data);
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"), true);

        $request = $pdo->prepare("DELETE FROM `users` WHERE `id` = " . $data['id']);
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
        echo json_encode(array('message' => "Aucun aliment trouvé."));
    } else if ($request) {
        // Les données ont été récupérées avec succès, renvoyer un statut 200 - OK
        http_response_code(200);
        if ($_SERVER['REQUEST_METHOD'] == 'GET') {
            echo json_encode($result);
        } else {
            echo json_encode(array('id' => $data['id']));
        }
    } else {
        // Erreur de la requête SQL, renvoyer un statut 500 - Internal Server Error
        http_response_code(500);
        echo json_encode(array('message' => "Erreur interne du serveur."));
    }
}
